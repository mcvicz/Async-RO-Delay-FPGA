#!/usr/bin/env python3
"""
ila_to_freq.py -- parser eksportu ILA (Vivado) -> realna czestotliwosc.

ILA CSV (Vivado Hardware Manager export) ma kolumny:
  Sample in Buffer, Sample in Window, TRIGGER, dbg_sw_tap[1:0],
  freq_count[31:0], dbg_sw_mode[1:0], freq_valid

freq_count to zbocza w oknie 1ms (po prescalerze /256).
Realna f ringu = freq_count * 256 / 1ms = freq_count * 256 kHz.

Wyciaga unikalne punkty robocze (tap, mode, freq_count) z capture.
Mapowanie tap_short -> liczba stopni CARRY4:
  0->16, 1->32, 2->48, 3->64

Uzycie: python3 ila_to_freq.py <iladata.csv> [--append real_fN.csv]
"""
import sys, os, csv

PRESCALER = 16    # dzielnik /16 (DIV_BITS=4)
WINDOW_MS = 1
TAP2STAGES = {0: 16, 1: 32, 2: 48, 3: 64}
MODE_NAME = {0: "sync", 1: "carry", 2: "loopback", 3: "lut"}

def parse_int(s):
    s = s.strip()
    try:
        return int(s, 16) if any(c in s.lower() for c in "abcdef") or len(s) == 8 else int(s)
    except ValueError:
        return int(s, 16)

def main():
    if len(sys.argv) < 2:
        print("uzycie: python3 ila_to_freq.py <iladata.csv> [--append <out.csv>]")
        return
    path = sys.argv[1]
    rows = list(csv.DictReader(open(path)))
    # znajdz nazwy kolumn (moga miec [31:0] itp)
    cols = rows[0].keys()
    def col(key):
        for c in cols:
            if c.startswith(key):
                return c
        return None
    c_fc = col("freq_count")
    c_tap = col("dbg_sw_tap")
    c_mode = col("dbg_sw_mode")

    # unikalne punkty (tap,mode,freq_count)
    seen = {}
    for r in rows:
        fc = parse_int(r[c_fc])
        tap = parse_int(r[c_tap])
        mode = parse_int(r[c_mode])
        seen[(tap, mode, fc)] = seen.get((tap, mode, fc), 0) + 1

    print(f"Plik: {path}  ({len(rows)} probek)")
    print(f"{'mode':9} {'tap_stopnie':12} {'freq_count':12} {'f_real':>12}")
    out_points = []
    for (tap, mode, fc), n in sorted(seen.items()):
        stages = TAP2STAGES.get(tap, 0)
        f_khz = fc * PRESCALER / WINDOW_MS
        f_mhz = f_khz / 1000.0
        print(f"{MODE_NAME.get(mode,'?'):9} {stages:<12} {fc:<12} {f_mhz:>9.2f} MHz  ({n} probek)")
        out_points.append((mode, tap, stages, fc, f_khz))

    # opcjonalny zapis do CSV w formacie analysis (do plot_fN)
    if "--append" in sys.argv:
        out = sys.argv[sys.argv.index("--append") + 1]
        exists = os.path.exists(out)
        with open(out, "a", newline="") as f:
            w = csv.writer(f)
            if not exists:
                w.writerow(["sample","timestamp_ms","variant","tap","edges","freq_khz","temp_c"])
            for i,(mode,tap,stages,fc,f_khz) in enumerate(out_points):
                # tap kolumna = liczba stopni-1 (zgodnie z modelem N+1)
                w.writerow([i, 0, MODE_NAME.get(mode,"?"), stages-1, fc, int(f_khz), 0])
        print(f"\nDopisano {len(out_points)} pkt do {out}")

if __name__ == "__main__":
    main()
