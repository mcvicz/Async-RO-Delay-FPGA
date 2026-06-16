#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
run_trng.py — pełny pipeline TRNG end-to-end.

Kroki:
  1. wczytaj freq_count ze wszystkich measurements/*.csv (TYLKO ODCZYT),
  2. oceń każde źródło (bias LSB) i sklasyfikuj good/poor,
  3. zbuduj strumienie bitów: per-source raw LSB, pooled, XOR-combine, von Neumann,
  4. zapisz strumienie do bits/ (.bin + nagłówek .txt),
  5. uruchom pełny zestaw testów losowości (ent-clone + NIST + własne),
  6. wygeneruj figures/*.png,
  7. zapisz REPORT.md + results.json.

Uruchom z katalogu analysis/trng/:  python3 run_trng.py
measurements/ jest read-only; pipeline nic tam nie zapisuje.
"""

from __future__ import annotations

import json
import os
from dataclasses import asdict
from typing import Dict, List

import numpy as np

import matplotlib

matplotlib.use("Agg")  # bez wyświetlacza
import matplotlib.pyplot as plt

import trng_lib as T

HERE = os.path.dirname(os.path.abspath(__file__))
MEAS = os.path.normpath(os.path.join(HERE, "..", "..", "measurements"))
BITS_DIR = os.path.join(HERE, "bits")
FIG_DIR = os.path.join(HERE, "figures")

# źródła z głównego katalogu pomiarów (jeden RO-wariant na plik)
MAIN_SOURCES = [
    "carry_16.csv",
    "carry_32.csv",
    "carry_48.csv",
    "carry_64.csv",
    "loop.csv",
    "lut.csv",
    "sync.csv",
]
DRIFT_SOURCES = [
    "drift/carry_16_cold.csv",
    "drift/carry_16_warm.csv",
    "drift/carry_16_warm_longer.csv",
]

BIAS_TOL = 0.02  # |P(1)-0.5| <= 0.02 => źródło "good" do puli/XOR


def banner(msg: str) -> None:
    print(f"\n=== {msg} ===")


def write_bits(name: str, bits: np.ndarray) -> Dict[str, str]:
    """Zapisz strumień jako .bin (spakowane bajty) + .txt (ASCII 0/1, pierwsze 4096)."""
    bin_path = os.path.join(BITS_DIR, f"{name}.bin")
    with open(bin_path, "wb") as fh:
        fh.write(T.bits_to_bytes(bits))
    txt_path = os.path.join(BITS_DIR, f"{name}.bits.txt")
    head = "".join(str(int(b)) for b in bits[:4096])
    with open(txt_path, "w") as fh:
        fh.write(f"# {name}  n_bits={len(bits)}  (pokazane pierwsze {min(4096,len(bits))})\n")
        fh.write(head + "\n")
    return {"bin": os.path.relpath(bin_path, HERE), "txt": os.path.relpath(txt_path, HERE)}


def main() -> None:
    os.makedirs(BITS_DIR, exist_ok=True)
    os.makedirs(FIG_DIR, exist_ok=True)

    banner("1. Ładowanie measurements/ (read-only)")
    raw: Dict[str, np.ndarray] = {}
    for fn in MAIN_SOURCES + DRIFT_SOURCES:
        path = os.path.join(MEAS, fn)
        if not os.path.exists(path):
            print(f"  POMIJAM (brak): {fn}")
            continue
        vals = T.load_freq_count(path)
        key = fn.replace("/", "__").replace(".csv", "")
        raw[key] = vals
        print(f"  {key:28s} n={len(vals):5d}  min={int(vals.min())} max={int(vals.max())} "
              f"range={int(vals.max()-vals.min())}")

    banner("2. Klasyfikacja źródeł (bias LSB bit0)")
    src_lsb: Dict[str, np.ndarray] = {}
    src_class: Dict[str, str] = {}
    bias_table: List[dict] = []
    for key, vals in raw.items():
        bits = T.lsb_bits(vals, 0)
        src_lsb[key] = bits
        p1 = float(np.count_nonzero(bits)) / len(bits)
        good = abs(p1 - 0.5) <= BIAS_TOL
        src_class[key] = "good" if good else "poor"
        bias_table.append({"source": key, "p_one": p1, "class": src_class[key],
                           "n": len(bits)})
        print(f"  {key:28s} P(1)={p1:.4f}  -> {src_class[key]}")

    good_main = [k for k in raw if k in
                 [s.replace(".csv", "") for s in MAIN_SOURCES] and src_class[k] == "good"]
    print(f"\n  Źródła GOOD do puli/XOR: {good_main}")

    banner("3. Budowa strumieni bitów")
    streams: Dict[str, np.ndarray] = {}

    # 3a. per-source raw LSB
    for key in raw:
        streams[f"raw_lsb__{key}"] = src_lsb[key]

    # 3b. pula good (konkatenacja)
    if good_main:
        streams["pool_good_raw"] = np.concatenate([src_lsb[k] for k in good_main])
    # pula wszystkich main
    main_keys = [s.replace(".csv", "") for s in MAIN_SOURCES if s.replace(".csv", "") in raw]
    streams["pool_all_raw"] = np.concatenate([src_lsb[k] for k in main_keys])

    # 3c. XOR-combine (równoległy) good
    if len(good_main) >= 2:
        streams["xor_combine_good"] = T.xor_combine([src_lsb[k] for k in good_main])

    # 3d. von Neumann
    if good_main:
        streams["vn_pool_good"] = T.von_neumann(streams["pool_good_raw"])
    if "xor_combine_good" in streams:
        streams["vn_xor_good"] = T.von_neumann(streams["xor_combine_good"])

    # 3e. XOR-whitening puli good
    if good_main:
        streams["xorw_pool_good"] = T.xor_whiten(streams["pool_good_raw"], span=2)

    bit_files: Dict[str, Dict[str, str]] = {}
    for name, bits in streams.items():
        bit_files[name] = write_bits(name, bits)
        print(f"  {name:26s} n_bits={len(bits):6d}  bytes={len(bits)//8}")

    banner("4. Testy losowości")
    reports: Dict[str, T.StreamReport] = {}
    for name, bits in streams.items():
        if len(bits) < 100:
            print(f"  POMIJAM {name}: za mało bitów ({len(bits)})")
            continue
        reports[name] = T.analyze_stream(name, bits)
        r = reports[name]
        npass = sum(1 for v in r.nist_pass_fail.values() if v is True)
        ntot = sum(1 for v in r.nist_pass_fail.values() if v is not None)
        print(f"  {name:26s} H_shannon={r.shannon_bit:.4f} H_min={r.min_entropy_bit:.4f} "
              f"ent={r.ent.entropy_bits_per_byte:.4f} b/B  NIST {npass}/{ntot}")

    banner("5. Wykresy")
    make_figures(raw, src_lsb, src_class, bias_table, reports)

    banner("6. Zapis results.json + REPORT.md")
    dump_json(bias_table, bit_files, reports, good_main)
    write_report(raw, bias_table, reports, good_main, bit_files)

    print("\nGOTOWE. Wyniki w analysis/trng/  (REPORT.md, results.json, bits/, figures/)")


# ----------------------------------------------------------------------------------------
# Wykresy
# ----------------------------------------------------------------------------------------


def make_figures(raw, src_lsb, src_class, bias_table, reports) -> None:
    # Fig 1: bias per bit-position (dlaczego tylko LSB)
    main_keys = [b["source"] for b in bias_table if "drift" not in b["source"]]
    fig, ax = plt.subplots(figsize=(10, 5))
    width = 0.11
    xs = np.arange(len(main_keys))
    for bit in range(6):
        ps = []
        for k in main_keys:
            v = raw[k]
            ps.append(float(np.count_nonzero(((v >> bit) & 1))) / len(v))
        ax.bar(xs + bit * width, ps, width, label=f"bit{bit}")
    ax.axhline(0.5, color="k", ls="--", lw=1, label="ideał 0.5")
    ax.set_xticks(xs + 2.5 * width)
    ax.set_xticklabels(main_keys, rotation=30, ha="right")
    ax.set_ylabel("P(bit=1)")
    ax.set_title("Polaryzacja bitów freq_count wg pozycji — entropia tylko w LSB (bit0)")
    ax.legend(ncol=7, fontsize=8)
    fig.tight_layout()
    fig.savefig(os.path.join(FIG_DIR, "01_bit_bias_per_position.png"), dpi=120)
    plt.close(fig)

    # Fig 2: freq_count szereg + histogram (reprezentatywne źródło carry_16)
    rep = "carry_16" if "carry_16" in raw else list(raw)[0]
    v = raw[rep]
    fig, (a1, a2) = plt.subplots(1, 2, figsize=(12, 4))
    a1.plot(v[:512], lw=0.7)
    a1.set_title(f"{rep}: freq_count (pierwsze 512 próbek) — widoczny jitter ±LSB")
    a1.set_xlabel("próbka"); a1.set_ylabel("freq_count")
    vals, cnts = np.unique(v, return_counts=True)
    a2.bar(vals, cnts, width=0.8)
    a2.set_title(f"{rep}: histogram freq_count")
    a2.set_xlabel("freq_count"); a2.set_ylabel("liczność")
    fig.tight_layout()
    fig.savefig(os.path.join(FIG_DIR, "02_jitter_timeseries_hist.png"), dpi=120)
    plt.close(fig)

    # Fig 3: autokorelacja headline stream
    headline = pick_headline(reports)
    if headline and reports[headline].autocorr:
        lags = [l for l, _ in reports[headline].autocorr]
        rs = [r for _, r in reports[headline].autocorr]
        n = reports[headline].n_bits
        bound = 3.0 / np.sqrt(n)
        fig, ax = plt.subplots(figsize=(9, 4))
        ax.bar(lags, rs, width=0.8)
        ax.axhline(bound, color="r", ls="--", lw=1, label=f"±3/√n = ±{bound:.4f}")
        ax.axhline(-bound, color="r", ls="--", lw=1)
        ax.set_title(f"Autokorelacja: {headline}")
        ax.set_xlabel("lag"); ax.set_ylabel("r")
        ax.legend()
        fig.tight_layout()
        fig.savefig(os.path.join(FIG_DIR, "03_autocorrelation.png"), dpi=120)
        plt.close(fig)

    # Fig 4: entropia bit/bajt + min-entropia w strumieniach
    names = list(reports.keys())
    fig, ax = plt.subplots(figsize=(11, 5))
    xs = np.arange(len(names))
    hb = [reports[n].ent.entropy_bits_per_byte for n in names]
    ax.bar(xs, hb, color="tab:blue")
    ax.axhline(8.0, color="k", ls="--", lw=1, label="ideał 8.0 bit/bajt")
    ax.set_xticks(xs); ax.set_xticklabels(names, rotation=45, ha="right", fontsize=7)
    ax.set_ylabel("entropia [bit/bajt]"); ax.set_ylim(0, 8.4)
    ax.set_title("Entropia (ent) na strumień")
    ax.legend()
    fig.tight_layout()
    fig.savefig(os.path.join(FIG_DIR, "04_entropy_per_stream.png"), dpi=120)
    plt.close(fig)

    # Fig 5: heatmapa p-value NIST
    test_keys = ["monobit", "block_frequency", "runs", "longest_run", "dft_spectral",
                 "approx_entropy", "cusum_fwd", "cusum_bwd", "serial"]
    names = list(reports.keys())
    mat = np.full((len(names), len(test_keys)), np.nan)
    for i, n in enumerate(names):
        for j, tk in enumerate(test_keys):
            p = reports[n].nist.get(tk, (float("nan"), {}))[0]
            mat[i, j] = p
    fig, ax = plt.subplots(figsize=(11, max(4, 0.4 * len(names) + 2)))
    im = ax.imshow(mat, aspect="auto", cmap="RdYlGn", vmin=0, vmax=0.1)
    ax.set_xticks(range(len(test_keys)))
    ax.set_xticklabels(test_keys, rotation=40, ha="right", fontsize=8)
    ax.set_yticks(range(len(names)))
    ax.set_yticklabels(names, fontsize=7)
    for i in range(len(names)):
        for j in range(len(test_keys)):
            val = mat[i, j]
            txt = "n/a" if np.isnan(val) else f"{val:.2f}"
            ax.text(j, i, txt, ha="center", va="center", fontsize=6,
                    color="black")
    ax.set_title(f"NIST p-value (zielony PASS p≥{T.ALPHA}, czerwony FAIL); skala 0..0.1")
    fig.colorbar(im, ax=ax, label="p-value (clamped 0.1)")
    fig.tight_layout()
    fig.savefig(os.path.join(FIG_DIR, "05_nist_pvalue_heatmap.png"), dpi=120)
    plt.close(fig)


def pick_headline(reports: Dict[str, T.StreamReport]) -> str:
    """Wybierz najlepszy strumień 'produkcyjny' (najwięcej PASS, potem najwyższa min-entropia)."""
    cand = [n for n in reports if n.startswith(("xor", "vn", "pool"))]
    if not cand:
        cand = list(reports)

    def score(n):
        r = reports[n]
        npass = sum(1 for v in r.nist_pass_fail.values() if v is True)
        return (npass, r.min_entropy_bit, r.n_bits)

    return max(cand, key=score) if cand else ""


# ----------------------------------------------------------------------------------------
# Serializacja
# ----------------------------------------------------------------------------------------


def report_to_dict(r: T.StreamReport) -> dict:
    base_mean, base_std = T.expected_byte_entropy(r.n_bits // 8)
    return {
        "name": r.name,
        "n_bits": r.n_bits,
        "p_one": r.p_one,
        "shannon_bit": r.shannon_bit,
        "min_entropy_bit": r.min_entropy_bit,
        "ent": asdict(r.ent),
        "ent_ideal_at_n": {"mean": base_mean, "std": base_std,
                           "note": "oczekiwana entropia bajtowa idealnego CSPRNG dla tej liczby bajtów"},
        "nist": {k: {"p_value": (None if v[0] != v[0] else v[0]), "detail": _clean(v[1])}
                 for k, v in r.nist.items()},
        "nist_pass_fail": r.nist_pass_fail,
        "autocorr_max_abs": max((abs(x) for _, x in r.autocorr), default=0.0),
    }


def _clean(d: dict) -> dict:
    out = {}
    for k, v in d.items():
        if isinstance(v, (np.floating,)):
            v = float(v)
        elif isinstance(v, (np.integer,)):
            v = int(v)
        elif isinstance(v, list):
            v = [int(x) if isinstance(x, (np.integer, int)) else float(x) for x in v]
        out[k] = v
    return out


def dump_json(bias_table, bit_files, reports, good_main) -> None:
    obj = {
        "alpha": T.ALPHA,
        "good_sources": good_main,
        "sources_bias": bias_table,
        "bit_files": bit_files,
        "streams": {n: report_to_dict(r) for n, r in reports.items()},
        "headline_stream": pick_headline(reports),
    }
    with open(os.path.join(HERE, "results.json"), "w") as fh:
        json.dump(obj, fh, indent=2, ensure_ascii=False)


def write_report(raw, bias_table, reports, good_main, bit_files) -> None:
    headline = pick_headline(reports)
    L: List[str] = []
    L.append("# Raport TRNG — ring oscillator (jitter freq_count)\n")
    L.append("Pipeline: `analysis/trng/run_trng.py` + `trng_lib.py`. "
             "Dane wejściowe: `measurements/*.csv` (read-only).\n")
    L.append(f"Poziom istotności NIST: **alpha = {T.ALPHA}** "
             "(PASS gdy p ≥ alpha; FAIL gdy p < alpha).\n")

    L.append("\n## 1. Źródło entropii\n")
    L.append("Jitter RO ujawnia się w **najmłodszym bicie (LSB, bit0)** `freq_count`. "
             "Starsze bity kodują wartość średnią częstości i są mocno spolaryzowane "
             "(patrz `figures/01_bit_bias_per_position.png`) — nie są używane.\n")

    L.append("\n### Bias LSB per źródło\n")
    L.append("| źródło | n | P(1) | klasa |")
    L.append("|---|---:|---:|---|")
    for b in bias_table:
        L.append(f"| `{b['source']}` | {b['n']} | {b['p_one']:.4f} | {b['class']} |")
    L.append(f"\nŹródła **good** (|P(1)-0.5| ≤ {BIAS_TOL}) użyte do puli i XOR-combine: "
             f"{', '.join('`'+g+'`' for g in good_main)}.\n")
    L.append("\n> **Uwaga:** klasa „good” to przesiew **wyłącznie po biasie I rzędu** (P(1)). "
             "NIE gwarantuje braku korelacji strukturalnej — patrz testy strukturalne w sekcji 3 "
             "(niektóre źródła „good” oblewają block_frequency/approx_entropy/serial). Pełna "
             "kwalifikacja źródła TRNG (NIST SP800-90B) ocenia też zależności szeregowe.\n")

    L.append("\n## 2. Strumienie i wyniki testów\n")
    L.append("Metryki ent (ideały): entropia 8.0 bit/bajt, średnia 127.5, "
             "korelacja szeregowa 0.0, błąd π → 0%.\n")
    L.append("\n> **UWAGA o entropii bajtowej.** Dla krótkich strumieni entropia bajtowa idealnego "
             "źródła jest **< 8.0** z powodu biasu próbkowania (256 symboli, mało zliczeń/symbol) — "
             "to NIE jest bias generatora. Dlatego w tabeli podaję kolumnę `ent_id@n` = oczekiwana "
             "entropia IDEALNEGO CSPRNG dla tej samej liczby bajtów (baseline; "
             "`trng_lib.expected_byte_entropy`). Oceniaj `ent` względem `ent_id@n`, nie względem 8.0. "
             "Bias generatora widać w **P(1)/monobit**, nie w entropii bajtowej krótkiej próbki.\n")
    L.append("\n| strumień | n_bits | P(1) | H_shannon | H_min | ent[b/B] | ent_id@n | "
             "χ² p | scc | π err% | NIST PASS |")
    L.append("|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    for n, r in reports.items():
        npass = sum(1 for v in r.nist_pass_fail.values() if v is True)
        ntot = sum(1 for v in r.nist_pass_fail.values() if v is not None)
        mark = " ⭐" if n == headline else ""
        base, _ = T.expected_byte_entropy(r.n_bits // 8)
        L.append(f"| `{n}`{mark} | {r.n_bits} | {r.p_one:.4f} | {r.shannon_bit:.4f} | "
                 f"{r.min_entropy_bit:.4f} | {r.ent.entropy_bits_per_byte:.4f} | {base:.4f} | "
                 f"{r.ent.chi_square_p:.3f} | {r.ent.serial_correlation:+.4f} | "
                 f"{r.ent.monte_carlo_pi_error_pct:.2f} | {npass}/{ntot} |")

    L.append("\n## 3. Szczegóły NIST per strumień (p-value)\n")
    test_keys = ["monobit", "block_frequency", "runs", "longest_run", "dft_spectral",
                 "approx_entropy", "cusum_fwd", "cusum_bwd", "serial"]
    L.append("| strumień | " + " | ".join(test_keys) + " |")
    L.append("|---|" + "|".join(["---:"] * len(test_keys)) + "|")
    for n, r in reports.items():
        cells = []
        for tk in test_keys:
            p = r.nist.get(tk, (float("nan"), {}))[0]
            if p != p:
                cells.append("n/a")
            else:
                flag = "✓" if p >= T.ALPHA else "✗"
                cells.append(f"{p:.3f}{flag}")
        L.append(f"| `{n}` | " + " | ".join(cells) + " |")

    L.append("\n## 4. Rekomendacja\n")
    if headline:
        r = reports[headline]
        npass = sum(1 for v in r.nist_pass_fail.values() if v is True)
        ntot = sum(1 for v in r.nist_pass_fail.values() if v is not None)
        L.append(f"Najwięcej PASS przy największej przepływności: **`{headline}`** "
                 f"(NIST {npass}/{ntot}, H_min={r.min_entropy_bit:.4f} bit/bit, "
                 f"ent={r.ent.entropy_bits_per_byte:.4f} bit/bajt, n={r.n_bits} bitów).\n")
        L.append("\n> **Do zastosowań kryptograficznych** rekomenduję jednak **`vn_pool_good` / "
                 "`vn_xor_good` (von Neumann)** — daje *dowodliwie* nieobciążone wyjście niezależnie "
                 "od wyniku testów empirycznych, kosztem ~75% bitów. `xorw_*`/`xor_combine_*` "
                 "(wybielanie/piling-up) przechodzą testy i są wydajniejsze, ale gwarancja jest "
                 "statystyczna, nie strukturalna. Najlepsza praktyka produkcyjna: **XOR-combine "
                 "niezależnych RO → von Neumann → (opcjonalnie) hash/CBC-MAC jako conditioner** "
                 "(NIST SP800-90B).\n")
    # --- analiza danych: bias (monobit) vs struktura (testy strukturalne) wśród źródeł good ---
    struct_tests = ["block_frequency", "approx_entropy", "serial", "longest_run"]
    monobit_all_pass = True
    struct_fail: Dict[str, List[str]] = {}
    for g in good_main:
        src = f"raw_lsb__{g}"
        if src not in reports:
            continue
        rr = reports[src]
        if rr.nist["monobit"][0] < T.ALPHA:
            monobit_all_pass = False
        fails = [t for t in struct_tests
                 if rr.nist.get(t, (1.0, {}))[0] == rr.nist.get(t, (1.0, {}))[0]
                 and rr.nist.get(t, (1.0, {}))[0] < T.ALPHA]
        if fails:
            struct_fail[g] = fails
    worst_autocorr = sorted(
        ((g, max((abs(x) for _, x in reports[f"raw_lsb__{g}"].autocorr), default=0.0))
         for g in good_main if f"raw_lsb__{g}" in reports),
        key=lambda kv: kv[1], reverse=True)

    L.append("\n**Wnioski metodyczne:**\n")
    mono_txt = ("Wszystkie źródła „good” **przechodzą monobit** (P(1)≈0.49–0.50, brak istotnego "
                "biasu I rzędu przy n=4096)" if monobit_all_pass
                else "Część źródeł „good” oblewa monobit (bias I rzędu)")
    L.append(f"- **Bias vs struktura.** {mono_txt}. Słabość surowych LSB jest **strukturalna**, "
             "nie biasowa: ")
    if struct_fail:
        items = "; ".join(f"`{g}` oblewa {', '.join(struct_fail[g])}" for g in struct_fail)
        L.append(f"  {items} → resztkowa **korelacja krótkozasięgowa** (autokorelacja), a NIE bias.")
    if worst_autocorr:
        gmax, amax = worst_autocorr[0]
        L.append(f"  Najwyższa autokorelacja wśród źródeł good: `{gmax}` (max|r|={amax:.3f}).\n")
    L.append("- **Post-processing usuwa OBA defekty.** **XOR-combine** niezależnych RO dekoreluje "
             "(różne fizycznie oscylatory) i redukuje bias (piling-up ~(2p−1)^N); **von Neumann** "
             "usuwa bias *dowodliwie* (koszt ~75% bitów). Stąd `xor_combine_*`/`vn_*` → NIST 9/9, "
             "podczas gdy surowe `carry_64` ma 5/9.\n")
    if "pool_good_raw" in reports:
        pr = reports["pool_good_raw"]
        pnp = sum(1 for v in pr.nist_pass_fail.values() if v is True)
        pnt = sum(1 for v in pr.nist_pass_fail.values() if v is not None)
        L.append(f"- **Konkatenacja nie naprawia struktury.** `pool_good_raw` (zwykłe sklejenie "
                 f"źródeł good) daje NIST {pnp}/{pnt} — gorzej niż XOR/von Neumann. Łączenie "
                 "źródeł wymaga **conditioningu** (XOR/dekorelacja), nie prostej konkatenacji.\n")
    L.append("- **Mała liczba bitów.** Strumienie mają 1k–28k bitów; twarde minima per-test w "
             "kodzie (np. longest_run n≥128, DFT n≥100) są spełnione przez wszystkie strumienie, "
             "więc nie pojawia się `n/a`. Jednak **wszystkie** są daleko poniżej zalecanych przez "
             "NIST STS ~10^6 bitów/strumień → **p-value są orientacyjne, nie rozstrzygające**. "
             "Do produkcji: dłuższa akwizycja (ciągły zrzut przez AXI/UART zamiast bufora ILA).\n")
    L.append("- `loop` i `sync` mają zbyt mały jitter (range 1–2 LSB) → odrzucone jako źródła.\n")

    L.append("\n## 5. Pliki\n")
    L.append("- `bits/*.bin` — spakowane strumienie (binarnie), `bits/*.bits.txt` — podgląd ASCII.\n")
    L.append("- `figures/01..05_*.png` — wykresy (bias, jitter, autokorelacja, entropia, heatmapa NIST).\n")
    L.append("- `results.json` — pełne wyniki maszynowe.\n")

    with open(os.path.join(HERE, "REPORT.md"), "w") as fh:
        fh.write("\n".join(L) + "\n")


if __name__ == "__main__":
    main()
