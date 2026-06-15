#!/usr/bin/env python3
"""
compare_sync_async.py -- EXP_07: tabela porownawcza wariantow.

Zestawia sync vs async (carry/lut/loopback): srednia f, jitter (sigma),
stabilnosc. Generuje tabele + wykres slupkowy jitteru.

Uzycie: python3 compare_sync_async.py [plik.csv]
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

HERE = os.path.dirname(os.path.abspath(__file__))
csv_file = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "exp07_compare.csv")

df = pd.read_csv(csv_file)

rows = []
for v in ["sync", "carry", "lut", "loopback"]:
    sub = df[df["variant"] == v]
    if len(sub) == 0:
        continue
    f = sub["freq_khz"].to_numpy() / 1000.0
    mu, sigma = f.mean(), f.std()
    rows.append({
        "wariant": v,
        "f_sred_MHz": round(mu, 3),
        "sigma_kHz": round(sigma * 1000, 2),
        "jitter_ppm": round(sigma / mu * 1e6, 1) if mu > 0 else 0,
    })

tab = pd.DataFrame(rows)
print("\n=== EXP_07: Porownanie sync vs async ===")
print(tab.to_string(index=False))

# zapis tabeli CSV
tab_out = os.path.join(HERE, "exp07_summary.csv")
tab.to_csv(tab_out, index=False)
print(f"\nZapisano tabele: {tab_out}")

# wykres slupkowy jitteru (log skala -- sync znikomy)
fig, ax = plt.subplots(figsize=(9, 5.5))
colors = {"sync": "#5dd39e", "carry": "#4a9eff", "lut": "#ff8c42", "loopback": "#ff5e5e"}
bars = ax.bar(tab["wariant"], tab["jitter_ppm"],
              color=[colors[v] for v in tab["wariant"]], alpha=0.8)
ax.set_yscale("log")
ax.set_ylabel("jitter [ppm] (skala log)")
ax.set_title("EXP_07: Jitter -- sync vs async")
for b, val in zip(bars, tab["jitter_ppm"]):
    ax.text(b.get_x() + b.get_width()/2, val, f"{val:.0f}",
            ha="center", va="bottom", fontsize=9)
ax.grid(alpha=0.3, axis="y")

plt.tight_layout()
out = os.path.join(HERE, "fig_exp07_compare.png")
plt.savefig(out, dpi=130)
print(f"Zapisano wykres: {out}")
