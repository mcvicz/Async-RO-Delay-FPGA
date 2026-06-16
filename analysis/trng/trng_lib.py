#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
trng_lib.py — biblioteka pipeline'u TRNG dla asynchronicznego ring oscillatora.

Źródło entropii: jitter zegara RO widoczny w kolumnie ``freq_count[31:0]`` z pomiarów ILA
(measurements/*.csv). Najmłodszy bit (LSB, bit0) wartości freq_count zmienia się losowo z
pomiaru na pomiar wskutek jitteru fazy/termicznego; starsze bity kodują głównie wartość
średnią (są mocno spolaryzowane) i nie nadają się jako źródło entropii.

Moduł zawiera:
  * ładowanie freq_count z CSV (tylko ODCZYT z measurements/),
  * ekstraktory bitów (raw LSB, von Neumann, XOR-whitening, XOR-combine wielu RO),
  * pakowanie bitów do bajtów,
  * zestaw testów losowości:
      - ent-clone   : entropia (bit/bajt), chi^2, średnia arytmetyczna, Monte-Carlo pi,
                      szeregowy wsp. korelacji,
      - NIST SP800-22 (podzbiór): monobit, block-frequency, runs, longest-run-of-ones,
                      DFT/spectral, approximate-entropy, cumulative-sums, serial,
      - własne      : entropia Shannona, min-entropia, autokorelacja dla lagów 1..K.

Wszystkie p-value liczone scipy.special (erfc, gammaincc) — bez zewn. binariów ent/NIST STS,
których w środowisku nie ma.

Konwencja p-value (NIST): H0 = "ciąg losowy". p >= alpha (alpha=0.01) => brak podstaw do
odrzucenia (PASS). p < alpha => FAIL.
"""

from __future__ import annotations

import csv
import math
import os
from dataclasses import dataclass, field
from typing import Dict, List, Sequence, Tuple

import numpy as np
from scipy.special import erfc, gammaincc
from scipy.stats import chi2 as chi2_dist
from scipy.stats import norm

ALPHA = 0.01  # poziom istotności NIST SP800-22

# ----------------------------------------------------------------------------------------
# Ładowanie danych (measurements/ — tylko odczyt)
# ----------------------------------------------------------------------------------------


def load_freq_count(csv_path: str) -> np.ndarray:
    """Wczytaj kolumnę freq_count[31:0] (hex) z pliku CSV ILA. Zwraca tablicę uint32."""
    vals: List[int] = []
    with open(csv_path, newline="") as fh:
        reader = csv.DictReader(fh)
        cols = [c for c in reader.fieldnames or [] if c.lower().startswith("freq_count")]
        if not cols:
            raise ValueError(f"{csv_path}: brak kolumny freq_count[..]")
        col = cols[0]
        for row in reader:
            raw = (row[col] or "").strip()
            if raw == "":
                continue
            # ILA zapisuje hex bez prefiksu 0x (np. 000020ce)
            vals.append(int(raw, 16))
    return np.asarray(vals, dtype=np.uint32)


# ----------------------------------------------------------------------------------------
# Ekstraktory bitów
# ----------------------------------------------------------------------------------------


def lsb_bits(values: np.ndarray, bit: int = 0) -> np.ndarray:
    """Wyłuskaj wskazany bit (domyślnie LSB) każdej próbki. Zwraca tablicę uint8 {0,1}."""
    return ((values.astype(np.uint64) >> np.uint64(bit)) & np.uint64(1)).astype(np.uint8)


def von_neumann(bits: np.ndarray) -> np.ndarray:
    """
    Ekstraktor von Neumanna — usuwa polaryzację (bias) niezależnych bitów o stałym P(1).
    Bierze pary kolejnych bitów: 01 -> 0, 10 -> 1, 00/11 -> odrzuć.
    Wynikowy strumień jest nieobciążony, jeśli bity wejściowe są i.i.d.
    """
    b = bits[: len(bits) - (len(bits) % 2)].reshape(-1, 2)
    pairs = b[b[:, 0] != b[:, 1]]
    return pairs[:, 0].astype(np.uint8)


def xor_whiten(bits: np.ndarray, span: int = 2) -> np.ndarray:
    """Proste wybielanie: XOR rozłącznych grup po ``span`` kolejnych bitów (redukuje bias)."""
    n = len(bits) - (len(bits) % span)
    g = bits[:n].reshape(-1, span)
    return np.bitwise_xor.reduce(g, axis=1).astype(np.uint8)


def xor_combine(streams: Sequence[np.ndarray]) -> np.ndarray:
    """
    XOR równoległy wielu niezależnych źródeł na tym samym indeksie próbki.
    Łączy entropię N niezależnych oscylatorów: P(bias) maleje wykładniczo z N
    (kopiec resztkowy ~ (2p-1)^N wg lematu o kopcu/piling-up).
    Strumienie ucinane do najkrótszego.
    """
    m = min(len(s) for s in streams)
    out = np.zeros(m, dtype=np.uint8)
    for s in streams:
        out ^= s[:m]
    return out


def bits_to_bytes(bits: np.ndarray) -> bytes:
    """Spakuj bity (MSB-first) do bajtów; ucina niepełny ostatni bajt."""
    n = len(bits) - (len(bits) % 8)
    if n == 0:
        return b""
    return np.packbits(bits[:n]).tobytes()


# ----------------------------------------------------------------------------------------
# Testy własne: entropia, min-entropia, autokorelacja
# ----------------------------------------------------------------------------------------


def shannon_entropy_bit(bits: np.ndarray) -> float:
    """Entropia Shannona na bit (0..1). Ideał = 1.0."""
    n = len(bits)
    if n == 0:
        return 0.0
    p1 = float(np.count_nonzero(bits)) / n
    p0 = 1.0 - p1
    h = 0.0
    for p in (p0, p1):
        if p > 0.0:
            h -= p * math.log2(p)
    return h


def min_entropy_bit(bits: np.ndarray) -> float:
    """Min-entropia na bit = -log2(max(p0,p1)). Konserwatywna miara (NIST SP800-90B)."""
    n = len(bits)
    if n == 0:
        return 0.0
    p1 = float(np.count_nonzero(bits)) / n
    pmax = max(p1, 1.0 - p1)
    if pmax <= 0.0:
        return 0.0
    return -math.log2(pmax)


def autocorrelation(bits: np.ndarray, max_lag: int = 32) -> List[Tuple[int, float]]:
    """
    Autokorelacja bitów dla lagów 1..max_lag (na ciągu +-1).
    Zwraca [(lag, r)], gdzie r ~ N(0, 1/n) dla ciągu losowego => |r| > 3/sqrt(n) podejrzane.
    """
    x = 2.0 * bits.astype(np.float64) - 1.0
    n = len(x)
    out: List[Tuple[int, float]] = []
    if n < 2:
        return out
    xc = x - x.mean()
    denom = float(np.dot(xc, xc))
    for lag in range(1, min(max_lag, n - 1) + 1):
        if denom == 0.0:
            out.append((lag, 0.0))
            continue
        num = float(np.dot(xc[: n - lag], xc[lag:]))
        out.append((lag, num / denom))
    return out


# ----------------------------------------------------------------------------------------
# ent-clone (metryki narzędzia `ent` Fourmilaba na strumieniu bajtów)
# ----------------------------------------------------------------------------------------


@dataclass
class EntResult:
    n_bytes: int
    entropy_bits_per_byte: float
    entropy_bits_per_bit: float
    chi_square: float
    chi_square_p: float
    arithmetic_mean: float
    monte_carlo_pi: float
    monte_carlo_pi_error_pct: float
    serial_correlation: float
    optimum_compression_pct: float


def ent_metrics(data: bytes) -> EntResult:
    """Replika metryk programu `ent` Fourmilaba dla strumienia bajtów."""
    arr = np.frombuffer(data, dtype=np.uint8)
    n = len(arr)
    if n == 0:
        return EntResult(0, 0, 0, 0, 1.0, 0, 0, 0, 0, 100.0)

    counts = np.bincount(arr, minlength=256).astype(np.float64)
    p = counts / n
    nz = p[p > 0]
    h_byte = float(-np.sum(nz * np.log2(nz)))  # bit/bajt, ideał 8.0
    h_bit = h_byte / 8.0
    opt_comp = 100.0 * (8.0 - h_byte) / 8.0  # ile % dałoby się skompresować

    expected = n / 256.0
    chi2_val = float(np.sum((counts - expected) ** 2 / expected))
    chi2_p = float(chi2_dist.sf(chi2_val, df=255))

    mean = float(arr.mean())  # ideał 127.5

    # Monte-Carlo pi: pary po 6 bajtów -> 2 współrzędne 24-bit w [0,1)
    scc = _serial_correlation(arr.astype(np.float64))
    pi_est, pi_err = _monte_carlo_pi(arr)

    return EntResult(
        n_bytes=n,
        entropy_bits_per_byte=h_byte,
        entropy_bits_per_bit=h_bit,
        chi_square=chi2_val,
        chi_square_p=chi2_p,
        arithmetic_mean=mean,
        monte_carlo_pi=pi_est,
        monte_carlo_pi_error_pct=pi_err,
        serial_correlation=scc,
        optimum_compression_pct=opt_comp,
    )


def expected_byte_entropy(n_bytes: int, trials: int = 60, seed: int = 12345) -> Tuple[float, float]:
    """
    Oczekiwana entropia bajtowa (bit/bajt) IDEALNEGO źródła losowego dla próbki n_bytes.
    Dla małych n entropia empiryczna jest < 8.0 wyłącznie z powodu bias-u próbkowania
    (256 symboli, mało zliczeń/symbol) — to NIE jest bias generatora. Zwraca (mean, std).
    Reproskowalne (seed). Używane jako baseline odniesienia w raporcie.
    """
    if n_bytes <= 0:
        return 0.0, 0.0
    rng = np.random.default_rng(seed)
    hs = []
    for _ in range(trials):
        arr = rng.integers(0, 256, size=n_bytes, dtype=np.uint8)
        counts = np.bincount(arr, minlength=256).astype(np.float64)
        p = counts / n_bytes
        nz = p[p > 0]
        hs.append(float(-np.sum(nz * np.log2(nz))))
    return float(np.mean(hs)), float(np.std(hs))


def _serial_correlation(x: np.ndarray) -> float:
    """Szeregowy współczynnik korelacji (lag-1) wg algorytmu `ent` (z zawinięciem)."""
    n = len(x)
    if n < 2:
        return 0.0
    t1 = float(np.dot(x[:-1], x[1:])) + float(x[-1] * x[0])  # zawinięcie ostatni*pierwszy
    t2 = float(x.sum())
    t3 = float(np.dot(x, x))
    denom = n * t3 - t2 * t2
    if denom == 0.0:
        return 0.0
    return (n * t1 - t2 * t2) / denom


def _monte_carlo_pi(arr: np.ndarray) -> Tuple[float, float]:
    """Oszacuj pi: 6 bajtów -> (x,y) 24-bit; punkt w kole jednostkowym."""
    m = (len(arr) // 6) * 6
    if m == 0:
        return 0.0, 100.0
    a = arr[:m].reshape(-1, 6).astype(np.float64)
    scale = float(2 ** 24 - 1)
    x = (a[:, 0] * 65536 + a[:, 1] * 256 + a[:, 2]) / scale
    y = (a[:, 3] * 65536 + a[:, 4] * 256 + a[:, 5]) / scale
    inside = np.count_nonzero(x * x + y * y <= 1.0)
    total = len(a)
    pi_est = 4.0 * inside / total
    err = 100.0 * abs(pi_est - math.pi) / math.pi
    return pi_est, err


# ----------------------------------------------------------------------------------------
# NIST SP800-22 (podzbiór). Każdy test zwraca (p_value, dict_szczegółów).
# ----------------------------------------------------------------------------------------


def _pm1(bits: np.ndarray) -> np.ndarray:
    return 2.0 * bits.astype(np.float64) - 1.0


def nist_monobit(bits: np.ndarray) -> Tuple[float, dict]:
    """2.1 Frequency (Monobit) Test."""
    n = len(bits)
    s = float(np.sum(_pm1(bits)))
    s_obs = abs(s) / math.sqrt(n)
    p = math.erfc(s_obs / math.sqrt(2.0))
    return p, {"n": n, "sum": s, "s_obs": s_obs}


def nist_block_frequency(bits: np.ndarray, M: int = 128) -> Tuple[float, dict]:
    """2.2 Frequency Test within a Block."""
    n = len(bits)
    N = n // M
    if N < 1:
        return float("nan"), {"error": "za mało bitów na blok", "M": M, "n": n}
    blocks = bits[: N * M].reshape(N, M)
    pi = blocks.mean(axis=1)
    chi2 = 4.0 * M * float(np.sum((pi - 0.5) ** 2))
    p = float(gammaincc(N / 2.0, chi2 / 2.0))
    return p, {"M": M, "N": N, "chi_square": chi2}


def nist_runs(bits: np.ndarray) -> Tuple[float, dict]:
    """2.3 Runs Test."""
    n = len(bits)
    pi = float(np.count_nonzero(bits)) / n
    tau = 2.0 / math.sqrt(n)
    if abs(pi - 0.5) >= tau:
        # warunek wstępny nie spełniony — monobit i tak by oblał
        return 0.0, {"pi": pi, "precondition_failed": True}
    vobs = 1 + int(np.count_nonzero(bits[1:] != bits[:-1]))
    num = abs(vobs - 2.0 * n * pi * (1.0 - pi))
    den = 2.0 * math.sqrt(2.0 * n) * pi * (1.0 - pi)
    p = math.erfc(num / den)
    return p, {"pi": pi, "runs": vobs}


def nist_longest_run(bits: np.ndarray) -> Tuple[float, dict]:
    """2.4 Test for the Longest Run of Ones in a Block."""
    n = len(bits)
    if n < 128:
        return float("nan"), {"error": "n<128", "n": n}
    if n < 6272:
        M, K, N = 8, 3, 16
        pi = [0.2148, 0.3672, 0.2305, 0.1875]
        # klasy: <=1, ==2, ==3, >=4
        def cls(longest: int) -> int:
            if longest <= 1:
                return 0
            if longest == 2:
                return 1
            if longest == 3:
                return 2
            return 3
    elif n < 750000:
        M, K, N = 128, 5, 49
        pi = [0.1174, 0.2430, 0.2493, 0.1752, 0.1027, 0.1124]
        # klasy: <=4,5,6,7,8,>=9
        def cls(longest: int) -> int:
            if longest <= 4:
                return 0
            if longest >= 9:
                return 5
            return longest - 4
    else:
        M, K, N = 10000, 6, 75
        pi = [0.0882, 0.2092, 0.2483, 0.1933, 0.1208, 0.0675, 0.0727]
        def cls(longest: int) -> int:
            if longest <= 10:
                return 0
            if longest >= 16:
                return 6
            return longest - 10

    nb = n // M
    use = min(nb, N) if n < 6272 else nb  # dla M=8 NIST używa dokładnie N=16 bloków
    if n < 6272:
        if nb < N:
            return float("nan"), {"error": "za mało bloków dla M=8", "blocks": nb}
        nb = N
    blocks = bits[: nb * M].reshape(nb, M)
    v = [0] * (K + 1)
    for blk in blocks:
        longest = _longest_run_of_ones(blk)
        v[cls(longest)] += 1
    chi2 = 0.0
    for i in range(K + 1):
        e = nb * pi[i]
        chi2 += (v[i] - e) ** 2 / e
    p = float(gammaincc(K / 2.0, chi2 / 2.0))
    return p, {"M": M, "blocks": nb, "chi_square": chi2, "v": v}


def _longest_run_of_ones(block: np.ndarray) -> int:
    longest = run = 0
    for b in block:
        if b:
            run += 1
            if run > longest:
                longest = run
        else:
            run = 0
    return longest


def nist_dft_spectral(bits: np.ndarray) -> Tuple[float, dict]:
    """2.6 Discrete Fourier Transform (Spectral) Test."""
    n = len(bits)
    if n < 100:
        return float("nan"), {"error": "n<100", "n": n}
    x = _pm1(bits)
    s = np.fft.fft(x)
    mod = np.abs(s[: n // 2])
    T = math.sqrt(math.log(1.0 / 0.05) * n)
    n0 = 0.95 * n / 2.0
    n1 = float(np.count_nonzero(mod < T))
    d = (n1 - n0) / math.sqrt(n * 0.95 * 0.05 / 4.0)
    p = math.erfc(abs(d) / math.sqrt(2.0))
    return p, {"T": T, "n0_expected": n0, "n1_observed": n1, "d": d}


def nist_approximate_entropy(bits: np.ndarray, m: int = 2) -> Tuple[float, dict]:
    """2.12 Approximate Entropy Test."""
    n = len(bits)
    if n < 100:
        return float("nan"), {"error": "n<100", "n": n}

    def phi(mm: int) -> float:
        if mm == 0:
            return 0.0
        # okno z zawinięciem (NIST): dolicz mm-1 bitów z początku
        ext = np.concatenate([bits, bits[: mm - 1]]) if mm > 1 else bits
        # zakoduj każde okno mm-bitowe jako liczbę
        powers = (1 << np.arange(mm - 1, -1, -1)).astype(np.int64)
        windows = np.array(
            [ext[i : i + mm] for i in range(n)], dtype=np.int64
        )
        codes = windows.dot(powers)
        counts = np.bincount(codes, minlength=1 << mm).astype(np.float64)
        c = counts / n
        nz = c[c > 0]
        return float(np.sum(nz * np.log(nz)))

    apen = phi(m) - phi(m + 1)
    chi2 = 2.0 * n * (math.log(2.0) - apen)
    p = float(gammaincc(2 ** (m - 1), chi2 / 2.0))
    return p, {"m": m, "ap_en": apen, "chi_square": chi2}


def nist_cumulative_sums(bits: np.ndarray, mode: int = 0) -> Tuple[float, dict]:
    """2.13 Cumulative Sums (Cusum) Test. mode=0 forward, mode=1 backward."""
    n = len(bits)
    x = _pm1(bits)
    if mode == 1:
        x = x[::-1]
    s = np.cumsum(x)
    z = float(np.max(np.abs(s)))
    if z == 0.0:
        return 1.0, {"mode": mode, "z": 0.0}
    # suma po k wg NIST
    def term(a: float, b: float) -> float:
        s1 = 0.0
        k = int(math.floor((-n / z + 1) / 4.0))
        kmax = int(math.floor((n / z - 1) / 4.0))
        for kk in range(k, kmax + 1):
            s1 += norm.cdf((4 * kk + 1) * z / math.sqrt(n)) - norm.cdf(
                (4 * kk - 1) * z / math.sqrt(n)
            )
        s2 = 0.0
        k = int(math.floor((-n / z - 3) / 4.0))
        kmax = int(math.floor((n / z - 1) / 4.0))
        for kk in range(k, kmax + 1):
            s2 += norm.cdf((4 * kk + 3) * z / math.sqrt(n)) - norm.cdf(
                (4 * kk + 1) * z / math.sqrt(n)
            )
        return s1 - s2

    p = 1.0 - term(0, 0)
    p = max(0.0, min(1.0, p))
    return p, {"mode": mode, "z": z}


def nist_serial(bits: np.ndarray, m: int = 3) -> Tuple[float, dict]:
    """2.11 Serial Test. Zwraca p-value dla del^2 (psi2_m)."""
    n = len(bits)
    if n < 16:
        return float("nan"), {"error": "n za małe", "n": n}

    def psi2(mm: int) -> float:
        if mm <= 0:
            return 0.0
        ext = np.concatenate([bits, bits[: mm - 1]]) if mm > 1 else bits
        powers = (1 << np.arange(mm - 1, -1, -1)).astype(np.int64)
        windows = np.array([ext[i : i + mm] for i in range(n)], dtype=np.int64)
        codes = windows.dot(powers)
        counts = np.bincount(codes, minlength=1 << mm).astype(np.float64)
        return float((2 ** mm) / n * np.sum(counts ** 2) - n)

    p_m = psi2(m)
    p_m1 = psi2(m - 1)
    p_m2 = psi2(m - 2)
    del1 = p_m - p_m1
    del2 = p_m - 2 * p_m1 + p_m2
    pv1 = float(gammaincc(2 ** (m - 2), del1 / 2.0))
    pv2 = float(gammaincc(2 ** (m - 3), del2 / 2.0)) if m >= 3 else float("nan")
    return pv1, {"m": m, "psi2_m": p_m, "del1": del1, "del2": del2, "p_value2": pv2}


# ----------------------------------------------------------------------------------------
# Agregacja: pełny raport dla jednego strumienia bitów
# ----------------------------------------------------------------------------------------


@dataclass
class StreamReport:
    name: str
    n_bits: int
    p_one: float
    shannon_bit: float
    min_entropy_bit: float
    ent: EntResult
    nist: Dict[str, Tuple[float, dict]] = field(default_factory=dict)
    autocorr: List[Tuple[int, float]] = field(default_factory=list)

    @property
    def nist_pass_fail(self) -> Dict[str, bool]:
        out = {}
        for k, (p, _) in self.nist.items():
            if p != p:  # NaN -> N/A
                out[k] = None
            else:
                out[k] = bool(p >= ALPHA)
        return out


def analyze_stream(name: str, bits: np.ndarray, max_lag: int = 32) -> StreamReport:
    """Policz wszystkie metryki dla danego strumienia bitów."""
    n = len(bits)
    data = bits_to_bytes(bits)
    ent = ent_metrics(data)

    nist: Dict[str, Tuple[float, dict]] = {}
    nist["monobit"] = nist_monobit(bits)
    nist["block_frequency"] = nist_block_frequency(bits, M=min(128, max(1, n // 20)))
    nist["runs"] = nist_runs(bits)
    nist["longest_run"] = nist_longest_run(bits)
    nist["dft_spectral"] = nist_dft_spectral(bits)
    nist["approx_entropy"] = nist_approximate_entropy(bits, m=2)
    nist["cusum_fwd"] = nist_cumulative_sums(bits, mode=0)
    nist["cusum_bwd"] = nist_cumulative_sums(bits, mode=1)
    nist["serial"] = nist_serial(bits, m=3)

    return StreamReport(
        name=name,
        n_bits=n,
        p_one=float(np.count_nonzero(bits)) / n if n else 0.0,
        shannon_bit=shannon_entropy_bit(bits),
        min_entropy_bit=min_entropy_bit(bits),
        ent=ent,
        nist=nist,
        autocorr=autocorrelation(bits, max_lag=max_lag),
    )
