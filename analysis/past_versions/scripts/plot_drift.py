#!/usr/bin/env python3
"""
plot_drift.py -- EXP_03: drift dlugoterminowy f(t).

f(t) przez 5 minut od startu. Chip sie nagrzewa -> f spada -> stan ustalony.
Fit eksponentialny -> stala czasowa termicznego ustalenia tau.

Uzycie: python3 plot_drift.py [plik.csv]
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

HERE = os.path.dirname(os.path.abspath(__file__))
csv_file = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "exp03_drift.csv")

df = pd.read_csv(csv_file)
t = df["timestamp_ms"].to_numpy() / 1000.0   # s
f = df["freq_khz"].to_numpy() / 1000.0        # MHz

def settle(t, f_inf, df0, tau):
    return f_inf + df0 * np.exp(-t / tau)

p0 = [f.min(), f.max() - f.min(), 60.0]
popt, _ = curve_fit(settle, t, f, p0=p0)
f_inf, df0, tau = popt

fig, ax = plt.subplots(figsize=(10, 5.5))
ax.plot(t, f, ".", color="#4a9eff", alpha=0.5, ms=4, label="pomiary")
ax.plot(t, settle(t, *popt), "-", color="#ff8c42", lw=2.5,
        label=f"fit: $\\tau$ = {tau:.0f} s")
ax.axhline(f_inf, color="#5dd39e", ls="--", alpha=0.7,
           label=f"f_stable = {f_inf:.2f} MHz")
ax.set_xlabel("czas [s]")
ax.set_ylabel("f [MHz]")
ax.set_title("EXP_03: Drift termiczny f(t)")
ax.legend()
ax.grid(alpha=0.3)

plt.tight_layout()
out = os.path.join(HERE, "fig_exp03_drift.png")
plt.savefig(out, dpi=130)
print(f"Zapisano {out}")
print(f"Stala czasowa tau = {tau:.1f} s")
print(f"Drift calkowity = {df0*1000:.1f} kHz ({df0/f_inf*1e6:.0f} ppm)")
print(f"f ustalone = {f_inf:.3f} MHz")
