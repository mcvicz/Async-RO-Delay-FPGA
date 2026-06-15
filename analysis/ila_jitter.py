#!/usr/bin/env python3
"""
ila_jitter.py -- analiza jitteru z REALNEGO eksportu ILA (4096 okien 1ms).

Czyta pelny eksport ILA CSV (storage-qualified freq_valid==1 -> kazda probka
to osobne okno pomiarowe 1ms). Liczy statystyki rozkladu freq_count = jitter.

Realna f = freq_count * 256 kHz (prescaler /256, okno 1ms).

Uzycie: python3 ila_jitter.py <iladata.csv> [etykieta]
Generuje: fig_jitter_<etykieta>.png + statystyki na stdout.
"""
import sys, os
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

PRESCALER = 16    # dzielnik /16 (DIV_BITS=4)
MODE = {0:"sync",1:"carry",2:"loopback",3:"lut"}
TAP2ST = {0:16,1:32,2:48,3:64}

HERE = os.path.dirname(os.path.abspath(__file__))
path = sys.argv[1]
label = sys.argv[2] if len(sys.argv) > 2 else os.path.splitext(os.path.basename(path))[0]

df = pd.read_csv(path, dtype=str)   # dtype=str: nie pozwol pandas zinterpretowac np. 000001e8 jako 1e8 (float)
fc_col   = [c for c in df.columns if c.startswith("freq_count")][0]
mode_col = [c for c in df.columns if c.startswith("dbg_sw_mode")][0]
tap_col  = [c for c in df.columns if c.startswith("dbg_sw_tap")][0]

fc = df[fc_col].apply(lambda s: int(str(s), 16)).to_numpy()
mode = int(str(df[mode_col].iloc[0]), 16) if any(c in str(df[mode_col].iloc[0]).lower() for c in "abcdef") else int(df[mode_col].iloc[0])
tap  = int(df[tap_col].iloc[0])

# usun ewentualne zera/glitche na poczatku (przed pierwszym waznym oknem)
fc = fc[fc > 0]

f_mhz = fc * PRESCALER / 1000.0   # freq_count * 256 kHz -> MHz
mean, std = f_mhz.mean(), f_mhz.std()
cmean, cstd = fc.mean(), fc.std()
sigma_ppm = std/mean*1e6 if mean else 0
variant = MODE.get(mode,"?")
stages = TAP2ST.get(tap,"?")

print(f"=== {label}  ({variant}, tap={tap} -> {stages} stopni) ===")
print(f"  probki: {len(fc)}")
print(f"  freq_count: srednia={cmean:.2f}  sigma={cstd:.3f}  min={fc.min()}  max={fc.max()}")
print(f"  f realna:   srednia={mean:.3f} MHz  sigma={std*1000:.1f} kHz")
print(f"  jitter:     {sigma_ppm:.0f} ppm   peak-peak={ (fc.max()-fc.min())*PRESCALER } kHz")
print(f"  unikalne freq_count: {sorted(set(fc.tolist()))[:12]}{' ...' if len(set(fc))>12 else ''}")

# histogram
fig, ax = plt.subplots(figsize=(9,5.5))
vals, counts = np.unique(fc, return_counts=True)
ax.bar([v*PRESCALER/1000.0 for v in vals], counts,
       width=PRESCALER/1000.0*0.9, color="#4a9eff", edgecolor="#131826", alpha=0.85)
ax.axvline(mean, color="#ff8c42", ls="--", lw=2, label=f"srednia {mean:.2f} MHz")
ax.set_xlabel("f [MHz]")
ax.set_ylabel("liczba okien (z 4096)")
ax.set_title(f"EXP_02 Jitter -- {variant} (tap={tap}): "
             f"$\\sigma$={std*1000:.1f} kHz ({sigma_ppm:.0f} ppm), N={len(fc)}")
ax.legend()
ax.grid(alpha=0.3, axis="y")
plt.tight_layout()
out = os.path.join(HERE, f"fig_jitter_{label}.png")
plt.savefig(out, dpi=130)
print(f"  -> {out}")
