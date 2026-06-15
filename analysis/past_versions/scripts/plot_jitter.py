#!/usr/bin/env python3
"""
plot_jitter.py -- EXP_02: histogram jitteru + dopasowanie Gaussa.

1000 pomiarow przy stalym tap. Rozklad wokol sredniej = szum termiczny RO.
Sigma jitteru = podstawa pod TRNG (im wiekszy, tym wiecej entropii).

Uzycie: python3 plot_jitter.py [plik.csv]
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import norm

HERE = os.path.dirname(os.path.abspath(__file__))
csv_file = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "exp02_jitter.csv")

df = pd.read_csv(csv_file)
f = df["freq_khz"].to_numpy() / 1000.0   # MHz

mu, sigma = f.mean(), f.std()
sigma_ppm = sigma / mu * 1e6

fig, ax = plt.subplots(figsize=(9, 5.5))
n, bins, _ = ax.hist(f, bins=40, density=True, color="#4a9eff", alpha=0.7,
                     edgecolor="#131826", label="pomiary (N=%d)" % len(f))
x = np.linspace(f.min(), f.max(), 300)
ax.plot(x, norm.pdf(x, mu, sigma), color="#ff8c42", lw=2.5,
        label=f"Gauss: $\\mu$={mu:.2f} MHz, $\\sigma$={sigma*1000:.1f} kHz")
ax.axvline(mu, color="#5dd39e", ls="--", alpha=0.7)
ax.set_xlabel("f [MHz]")
ax.set_ylabel("gestosc prawdopodobienstwa")
ax.set_title(f"EXP_02: Histogram jitteru ($\\sigma$ = {sigma_ppm:.0f} ppm)")
ax.legend()
ax.grid(alpha=0.3)

plt.tight_layout()
out = os.path.join(HERE, "fig_exp02_jitter.png")
plt.savefig(out, dpi=130)
print(f"Zapisano {out}")
print(f"Srednia f = {mu:.3f} MHz")
print(f"Sigma jitteru = {sigma*1000:.2f} kHz ({sigma_ppm:.0f} ppm)")
print(f"Peak-to-peak = {(f.max()-f.min())*1000:.1f} kHz")
