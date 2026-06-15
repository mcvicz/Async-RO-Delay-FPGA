#!/usr/bin/env python3
"""
ila_collect.py -- zbieranie punktow pomiarowych z eksportow ILA + fix Excel PL.

Czyta jeden lub wiele plikow iladata*.csv (eksport Vivado Hardware Manager),
wyciaga unikalne punkty robocze (mode, tap, freq_count), liczy realna f,
i zapisuje DWA pliki:

  1. real_fN.csv          -- przecinki, schema analizy -> wprost do plot_fN.py
  2. real_fN_excelPL.csv  -- SREDNIKI + przecinek dziesietny -> polski Excel
                             otwiera czysto w kolumnach (bez recznego separowania)

PROBLEM EXCEL PL: ILA eksportuje z przecinkami jako separator pol, a polski
Excel traktuje przecinek jako separator dziesietny -> wszystko w 1 kolumnie.
Fix: separator ';' + liczby z przecinkiem dziesietnym.

Uzycie:
  python3 ila_collect.py iladata.csv
  python3 ila_collect.py cap_tap15.csv cap_tap31.csv cap_tap47.csv cap_tap63.csv
  python3 ila_collect.py *.csv          (wszystkie capty)
"""
import sys, os, csv, glob

PRESCALER = 16    # dzielnik /16 (DIV_BITS=4)
WINDOW_MS = 1
TAP2STAGES = {0: 16, 1: 32, 2: 48, 3: 64}
MODE_NAME = {0: "sync", 1: "carry", 2: "loopback", 3: "lut"}

def ph(s):  # parse hex (freq_count 8-cyfr)
    return int(s.strip(), 16)

def pi(s):  # parse maly int (tap/mode) -- dec lub hex
    s = s.strip()
    try: return int(s, 10)
    except ValueError: return int(s, 16)

def find_col(cols, key):
    for c in cols:
        if c.replace(" ", "").lower().startswith(key):
            return c
    return None

def collect(files):
    points = {}   # (mode,tap) -> freq_count (ostatnia stabilna)
    total = 0
    for path in files:
        with open(path, newline="") as f:
            rows = list(csv.DictReader(f))
        if not rows:
            continue
        cols = list(rows[0].keys())
        c_fc   = find_col(cols, "freq_count")
        c_tap  = find_col(cols, "dbg_sw_tap")
        c_mode = find_col(cols, "dbg_sw_mode")
        if not (c_fc and c_tap and c_mode):
            print(f"  POMIJAM {path}: brak kolumn freq_count/tap/mode")
            continue
        for r in rows:
            try:
                fc = ph(r[c_fc]); tap = pi(r[c_tap]); mode = pi(r[c_mode])
            except (ValueError, KeyError):
                continue
            points[(mode, tap)] = fc   # nadpisuje -> ostatnia wartosc dla pary
            total += 1
        print(f"  wczytano {os.path.basename(path)} ({len(rows)} probek)")
    return points, total

def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    if not args:
        # domyslnie iladata.csv obok lub w sim_1/new
        cand = glob.glob("iladata*.csv") + glob.glob(
            "../fpga_project/oscillator/oscillator.srcs/sim_1/new/iladata*.csv")
        args = cand[:1]
    files = []
    for a in args:
        files += glob.glob(a) if any(c in a for c in "*?") else [a]
    if not files:
        print("Brak plikow. Uzycie: python3 ila_collect.py <iladata.csv> ...")
        return

    points, total = collect(files)
    if not points:
        print("Brak punktow pomiarowych.")
        return

    HERE = os.path.dirname(os.path.abspath(__file__))
    rows_out = []
    print(f"\n{'variant':9} {'stopnie':8} {'tap':4} {'freq_count':11} {'f_MHz':>10}")
    for i, ((mode, tap), fc) in enumerate(sorted(points.items())):
        stages = TAP2STAGES.get(tap, 0)
        f_khz = fc * PRESCALER / WINDOW_MS
        f_mhz = f_khz / 1000.0
        variant = MODE_NAME.get(mode, "?")
        print(f"{variant:9} {stages:<8} {tap:<4} {fc:<11} {f_mhz:>7.2f} MHz")
        rows_out.append((i, variant, stages, stages-1, fc, int(f_khz), f_mhz))

    # 1) CSV dla plot_fN.py (przecinki, schema analizy)
    p1 = os.path.join(HERE, "real_fN.csv")
    with open(p1, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["sample","timestamp_ms","variant","tap","edges","freq_khz","temp_c"])
        for (i,variant,stages,tapn,fc,fkhz,fmhz) in rows_out:
            w.writerow([i, 0, variant, tapn, fc, fkhz, 0])

    # 2) CSV dla polskiego Excela (sredniki + przecinek dziesietny)
    p2 = os.path.join(HERE, "real_fN_excelPL.csv")
    with open(p2, "w", newline="", encoding="utf-8-sig") as f:
        f.write("variant;stopnie_CARRY4;freq_count;f_MHz\n")
        for (i,variant,stages,tapn,fc,fkhz,fmhz) in rows_out:
            f.write(f"{variant};{stages};{fc};{str(round(fmhz,2)).replace('.',',')}\n")

    print(f"\nZapisano:")
    print(f"  {p1}        -> python3 plot_fN.py real_fN.csv")
    print(f"  {p2}  -> otwórz w polskim Excelu (kolumny OK)")
    if len(rows_out) < 2:
        print(f"\nUWAGA: tylko {len(rows_out)} pkt. Dla krzywej f(N) zbierz wiecej")
        print("       taps (SW3SW2 = 00/01/10/11 przy carry), eksportuj kazdy capt.")

if __name__ == "__main__":
    main()
