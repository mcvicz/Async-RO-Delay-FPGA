#!/usr/bin/env python3
"""
plot_fN.py -- EXP_01: krzywa strojenia czestotliwosci f(N).

f vs dlugosc petli (tap). Krotsza petla = wyzsza f.
Wylicza srednie opoznienie pojedynczego stopnia t_d.

Uzycie: python3 plot_fN.py [plik.csv]  (domyslnie exp01_fN.csv)
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

HERE = os.path.dirname(os.path.abspath(__file__))
csv_file = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "exp01_fN.csv")

df = pd.read_csv(csv_file)
df = df[df["variant"] == "carry"].sort_values("tap")

tap = df["tap"].to_numpy()
f_mhz = df["freq_khz"].to_numpy() / 1000.0
stages = tap + 1

# Fit: f = 1/(2*stages*td) -> 1/f = 2*td*stages (liniowy)
inv_f = 1.0 / (f_mhz * 1e6)
coef = np.polyfit(stages, inv_f, 1)
td_ps = coef[0] / 2.0 * 1e12   # opoznienie stopnia [ps]

fig, ax = plt.subplots(1, 2, figsize=(12, 5))

ax[0].plot(tap, f_mhz, "o-", color="#4a9eff", ms=5)
ax[0].set_xlabel("tap (dlugosc petli)")
ax[0].set_ylabel("f [MHz]")
ax[0].set_title("EXP_01: Krzywa strojenia f(N)")
ax[0].grid(alpha=0.3)

ax[1].plot(stages, inv_f * 1e9, "o", color="#ff8c42", ms=5, label="pomiar")
ax[1].plot(stages, np.polyval(coef, stages) * 1e9, "-", color="#5dd39e",
           label=f"fit: t_d = {td_ps:.1f} ps/stopien")
ax[1].set_xlabel("liczba stopni")
ax[1].set_ylabel("1/f [ns]")
ax[1].set_title("Linearyzacja -> opoznienie stopnia")
ax[1].legend()
ax[1].grid(alpha=0.3)

plt.tight_layout()
out = os.path.join(HERE, "fig_exp01_fN.png")
plt.savefig(out, dpi=130)
print(f"Zapisano {out}")
print(f"Opoznienie pojedynczego stopnia t_d = {td_ps:.1f} ps")
print(f"Zakres f: {f_mhz.min():.1f} - {f_mhz.max():.1f} MHz")
