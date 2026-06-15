#!/usr/bin/env python3
"""
plot_fT.py -- EXP_04: korelacja f(T), krzemowy termometr.

f vs temperatura (z XADC). Regresja liniowa -> wspolczynnik temperaturowy [Hz/C].
To podstawa zastosowania "RO jako czujnik temperatury krzemu".

Uzycie: python3 plot_fT.py [plik.csv]
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

HERE = os.path.dirname(os.path.abspath(__file__))
csv_file = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "exp04_fT.csv")

df = pd.read_csv(csv_file)
temp = df["temp_c"].to_numpy()
f = df["freq_khz"].to_numpy() / 1000.0   # MHz

# Regresja liniowa f = a*T + b
a, b = np.polyfit(temp, f, 1)
coef_khz_per_c = a * 1000.0
r = np.corrcoef(temp, f)[0, 1]

fig, ax = plt.subplots(figsize=(9, 5.5))
ax.plot(temp, f, "o", color="#5dd39e", ms=6, label="pomiary")
tt = np.linspace(temp.min(), temp.max(), 100)
ax.plot(tt, a * tt + b, "-", color="#ff8c42", lw=2.5,
        label=f"fit: {coef_khz_per_c:.1f} kHz/$\\degree$C  (r={r:.3f})")
ax.set_xlabel("temperatura [$\\degree$C]")
ax.set_ylabel("f [MHz]")
ax.set_title("EXP_04: Korelacja f(T) -- krzemowy termometr")
ax.legend()
ax.grid(alpha=0.3)

plt.tight_layout()
out = os.path.join(HERE, "fig_exp04_fT.png")
plt.savefig(out, dpi=130)
print(f"Zapisano {out}")
print(f"Wspolczynnik temperaturowy = {coef_khz_per_c:.2f} kHz/C")
print(f"Korelacja r = {r:.4f}")
print(f"Czulosc: {abs(coef_khz_per_c/(f.mean()*1000)*1e6):.0f} ppm/C")
