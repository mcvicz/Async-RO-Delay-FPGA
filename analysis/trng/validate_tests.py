#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
validate_tests.py — kalibracja/known-answer baterii testów z trng_lib.

Idea: jeśli implementacja testów jest poprawna, to:
  * strumień CSPRNG (os.urandom) -> PRZECHODZI wszystkie testy (p-value rozsądne),
  * strumień obciążony p(1)=0.6 -> OBLEWA monobit/runs/entropię,
  * strumień okresowy 0101...    -> OBLEWA runs/serial/autokorelacja ekstremalna,
  * strumień stały (same 1)      -> OBLEWA wszystko, entropia=0,
  * von Neumann na obciążonym    -> wynikowy bias ~ 0.5 (usuwa polaryzację),
  * ent entropia: CSPRNG ~ 8.0 bit/bajt, stały = 0.

Uruchom: python3 validate_tests.py   (exit 0 = wszystkie asercje OK).
"""

from __future__ import annotations

import os
import sys

import numpy as np

import trng_lib as T


def csprng_bits(n: int) -> np.ndarray:
    nbytes = (n + 7) // 8
    arr = np.frombuffer(os.urandom(nbytes), dtype=np.uint8)
    bits = np.unpackbits(arr)[:n]
    return bits.astype(np.uint8)


def biased_bits(n: int, p1: float) -> np.ndarray:
    # deterministyczny generator obciążony oparty o CSPRNG (bez Math.random ograniczeń env)
    raw = np.frombuffer(os.urandom(n * 2), dtype=np.uint16).astype(np.float64) / 65535.0
    return (raw[:n] < p1).astype(np.uint8)


def periodic_bits(n: int) -> np.ndarray:
    return np.tile(np.array([0, 1], dtype=np.uint8), (n + 1) // 2)[:n]


def constant_bits(n: int, v: int = 1) -> np.ndarray:
    return np.full(n, v, dtype=np.uint8)


PASS = "\033[32mOK\033[0m"
FAIL = "\033[31mFAIL\033[0m"
results = []


def check(label: str, cond: bool, detail: str = "") -> None:
    status = PASS if cond else FAIL
    results.append(cond)
    print(f"  [{status}] {label}  {detail}")


def main() -> int:
    N = 100000
    print("== Strumienie referencyjne (n=%d) ==" % N)
    good = csprng_bits(N)
    bias = biased_bits(N, 0.60)
    per = periodic_bits(N)
    const = constant_bits(N, 1)

    print("\n== 1. CSPRNG ma przechodzić wszystkie testy NIST ==")
    rg = T.analyze_stream("csprng", good)
    for k, v in rg.nist_pass_fail.items():
        check(f"CSPRNG NIST {k} PASS", v is True or v is None, f"p={rg.nist[k][0]:.4f}")
    # uwaga: entropia bajtowa skończonej próbki jest < 8.0 (bias próbkowania: ~256 symboli,
    # ~12500 bajtów -> ~48 zliczeń/symbol). To NIE bias generatora, lecz finite-sample.
    check("CSPRNG ent ~ 8.0 bit/bajt (finite-sample)", rg.ent.entropy_bits_per_byte > 7.98,
          f"={rg.ent.entropy_bits_per_byte:.4f}")
    check("CSPRNG H_shannon ~ 1.0", rg.shannon_bit > 0.9999, f"={rg.shannon_bit:.6f}")
    check("CSPRNG |scc| < 0.02", abs(rg.ent.serial_correlation) < 0.02,
          f"={rg.ent.serial_correlation:+.4f}")
    check("CSPRNG mean ~ 127.5", abs(rg.ent.arithmetic_mean - 127.5) < 1.5,
          f"={rg.ent.arithmetic_mean:.3f}")
    check("CSPRNG pi err < 3%", rg.ent.monte_carlo_pi_error_pct < 3.0,
          f"={rg.ent.monte_carlo_pi_error_pct:.2f}%")
    check("CSPRNG max|autocorr| mały", max(abs(x) for _, x in rg.autocorr) < 0.05,
          f"={max(abs(x) for _, x in rg.autocorr):.4f}")

    print("\n== 2. Strumień obciążony p(1)=0.6 ma OBLAĆ monobit/runs ==")
    rb = T.analyze_stream("biased", bias)
    check("biased monobit FAIL", rb.nist["monobit"][0] < T.ALPHA,
          f"p={rb.nist['monobit'][0]:.2e}")
    check("biased runs FAIL", rb.nist["runs"][0] < T.ALPHA, f"p={rb.nist['runs'][0]:.2e}")
    check("biased entropia < 8.0", rb.ent.entropy_bits_per_byte < 7.99,
          f"={rb.ent.entropy_bits_per_byte:.4f}")
    check("biased P(1) ~ 0.6", abs(rb.p_one - 0.6) < 0.02, f"={rb.p_one:.4f}")

    print("\n== 3. Strumień okresowy 0101... ma OBLAĆ runs/serial/autokorelacja ==")
    rp = T.analyze_stream("periodic", per)
    check("periodic monobit PASS (zbalansowany)", rp.nist["monobit"][0] >= T.ALPHA,
          f"p={rp.nist['monobit'][0]:.4f}")
    check("periodic runs FAIL", rp.nist["runs"][0] < T.ALPHA, f"p={rp.nist['runs'][0]:.2e}")
    check("periodic serial FAIL", rp.nist["serial"][0] < T.ALPHA,
          f"p={rp.nist['serial'][0]:.2e}")
    ac1 = dict(rp.autocorr)[1]
    check("periodic autocorr(lag1) ~ -1", ac1 < -0.95, f"={ac1:.4f}")

    print("\n== 4. Strumień stały (same 1) ma OBLAĆ wszystko, entropia=0 ==")
    rc = T.analyze_stream("const", const)
    check("const monobit FAIL", rc.nist["monobit"][0] < T.ALPHA,
          f"p={rc.nist['monobit'][0]:.2e}")
    check("const H_shannon = 0", rc.shannon_bit == 0.0, f"={rc.shannon_bit}")
    check("const entropia bajtowa = 0", rc.ent.entropy_bits_per_byte == 0.0,
          f"={rc.ent.entropy_bits_per_byte}")

    print("\n== 5. von Neumann usuwa bias (p=0.6 -> ~0.5) ==")
    vn = T.von_neumann(bias)
    p1_vn = float(np.count_nonzero(vn)) / len(vn)
    check("vN bias ~ 0.5", abs(p1_vn - 0.5) < 0.02, f"={p1_vn:.4f} (n={len(vn)})")
    check("vN zachowuje ~p*q*N par", len(vn) > N * 0.2, f"n_out={len(vn)}")

    print("\n== 6. XOR-combine redukuje bias (piling-up) ==")
    # 3 niezależne źródła p=0.6 -> bias wynikowy ~ 0.5 +- (2*0.1)^3/2
    s = [biased_bits(N, 0.60) for _ in range(3)]
    xc = T.xor_combine(s)
    p1_xc = float(np.count_nonzero(xc)) / len(xc)
    expected = 0.5 - 0.5 * (2 * 0.6 - 1) ** 3  # lemat o kopcu
    check("XOR-combine bias bliski przewidywanego", abs(p1_xc - expected) < 0.02,
          f"={p1_xc:.4f} (oczek. {expected:.4f})")

    print("\n== 7. Spójność p-value (CSPRNG p-value w [0,1]) ==")
    ok_range = all(0.0 <= rg.nist[k][0] <= 1.0 for k in rg.nist
                   if rg.nist[k][0] == rg.nist[k][0])
    check("wszystkie p-value w [0,1]", ok_range)

    npass = sum(1 for r in results if r)
    print(f"\n=== WYNIK: {npass}/{len(results)} asercji OK ===")
    return 0 if all(results) else 1


if __name__ == "__main__":
    sys.exit(main())
