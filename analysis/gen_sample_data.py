#!/usr/bin/env python3
"""
gen_sample_data.py -- generator syntetycznych danych pomiarowych.

Tworzy realistyczne CSV (model fizyczny ring oscillatora) zanim mamy
realne pomiary z plytki. Pozwala przetestowac skrypty analizy i wygenerowac
przykladowe wykresy do prezentacji.

Schema CSV (kanoniczna, zgodna z PLAN sekcja 5):
  sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c

UWAGA: to dane SYNTETYCZNE (model + szum). Realne przyjda z UART przez
log_capture.py gdy bedzie ZedBoard. Skrypty plotujace dzialaja na obu.
"""
import numpy as np
import csv
import os

OUT = os.path.dirname(os.path.abspath(__file__))
rng = np.random.default_rng(42)   # staly seed -> powtarzalne dane

PRESCALER = 256
WINDOW_MS = 1

def freq_model_khz(tap, temp_c=42.0):
    """Model f(N): krotsza petla (maly tap) = wyzsza f.
    f ~ 1/(stopnie). Plus wspolczynnik temperaturowy (f maleje z T)."""
    stages = tap + 1
    # nominalne opoznienie ~200ps/CARRY4 blok, f = 1/(2*stages*td)
    td_ns = 0.20 * (1.0 + 0.0018 * (temp_c - 42.0))   # +0.18%/stopien
    f_mhz = 1.0 / (2.0 * stages * td_ns) * 1000.0       # MHz
    return f_mhz * 1000.0                                 # kHz

def khz_to_edges(f_khz):
    """Odwrotnosc pomiaru: edges = f / (prescaler * (1/window))."""
    # f_khz = edges * PRESCALER / WINDOW_MS  ->  edges = f_khz * WINDOW_MS / PRESCALER
    return int(round(f_khz * WINDOW_MS / PRESCALER))

def write_csv(name, rows):
    path = os.path.join(OUT, name)
    with open(path, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["sample", "timestamp_ms", "variant", "tap", "edges", "freq_khz", "temp_c"])
        w.writerows(rows)
    print(f"  zapisano {name} ({len(rows)} probek)")

# --- EXP_01: f(N) sweep ---
def gen_fN():
    rows, s, t = [], 0, 0
    for tap in range(2, 64, 2):
        f = freq_model_khz(tap)
        f_noisy = f * (1 + rng.normal(0, 0.003))   # 0.3% jitter
        rows.append([s, t, "carry", tap, khz_to_edges(f_noisy), round(f_noisy, 1), 42.0])
        s += 1; t += 100
    return rows

# --- EXP_02: histogram jitteru (staly tap, 1000 probek) ---
def gen_jitter():
    rows, t = [], 0
    f_mean = freq_model_khz(32)
    for s in range(1000):
        f = f_mean * (1 + rng.normal(0, 0.004))    # 0.4% sigma -> Gauss
        rows.append([s, t, "carry", 32, khz_to_edges(f), round(f, 1), 42.0])
        t += 1
    return rows

# --- EXP_03: drift termiczny f(t) ---
def gen_drift():
    rows = []
    f0 = freq_model_khz(32, 25.0)      # zimny start
    f_inf = freq_model_khz(32, 55.0)   # stan ustalony (cieply)
    tau = 60.0                          # stala czasowa [s]
    for s in range(300):               # 5 minut, co 1s
        t_s = s
        f = f_inf + (f0 - f_inf) * np.exp(-t_s / tau)
        f_noisy = f * (1 + rng.normal(0, 0.003))
        temp = 25.0 + 30.0 * (1 - np.exp(-t_s / tau))
        rows.append([s, t_s * 1000, "carry", 32, khz_to_edges(f_noisy),
                     round(f_noisy, 1), round(temp, 1)])
    return rows

# --- EXP_04: korelacja f(T) ---
def gen_fT():
    rows, s, t = [], 0, 0
    for temp in np.arange(25, 75, 2.5):
        f = freq_model_khz(32, temp)
        f_noisy = f * (1 + rng.normal(0, 0.003))
        rows.append([s, t, "carry", 32, khz_to_edges(f_noisy),
                     round(f_noisy, 1), round(float(temp), 1)])
        s += 1; t += 5000
    return rows

# --- EXP_07: porownanie wariantow ---
def gen_compare():
    rows, s = [], 0
    variants = {"sync": 6000.0, "carry": None, "lut": None, "loopback": None}
    for v in variants:
        for _ in range(200):
            if v == "sync":
                f = 6000.0 * (1 + rng.normal(0, 0.00001))   # krysztal, znikomy jitter
                temp = 42.0
            elif v == "carry":
                f = freq_model_khz(32) * (1 + rng.normal(0, 0.004))
                temp = 42.0
            elif v == "lut":
                f = freq_model_khz(32) * 1.4 * (1 + rng.normal(0, 0.007))  # szybszy, wiekszy jitter
                temp = 42.0
            else:  # loopback
                f = 8000.0 * (1 + rng.normal(0, 0.012))     # wolny (PCB), duzy jitter
                temp = 42.0
            rows.append([s, 0, v, 32, khz_to_edges(f), round(f, 1), temp])
            s += 1
    return rows

if __name__ == "__main__":
    print("Generowanie syntetycznych danych pomiarowych...")
    write_csv("exp01_fN.csv", gen_fN())
    write_csv("exp02_jitter.csv", gen_jitter())
    write_csv("exp03_drift.csv", gen_drift())
    write_csv("exp04_fT.csv", gen_fT())
    write_csv("exp07_compare.csv", gen_compare())
    print("Gotowe. Uruchom skrypty plot_*.py aby wygenerowac wykresy.")
