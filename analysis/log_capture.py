#!/usr/bin/env python3
"""
log_capture.py -- przechwytywanie strumienia CSV z UART (ZedBoard -> PC).

Czyta linie CSV wysylane przez ARM (main.c), zapisuje do pliku.
Uzywane gdy plytka dostepna. Bez plytki -> uzyj gen_sample_data.py.

Uzycie:
  python3 log_capture.py --port COM5 --out pomiar.csv      (Windows)
  python3 log_capture.py --port /dev/ttyUSB1 --out pomiar.csv  (Linux)

Domyslnie 115200 8N1 (PS UART ZedBoard). Ctrl+C konczy.
"""
import argparse
import sys
import serial   # pyserial

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", required=True, help="port szeregowy (COM5 / /dev/ttyUSB1)")
    ap.add_argument("--baud", type=int, default=115200)
    ap.add_argument("--out", default="pomiar.csv")
    ap.add_argument("--max", type=int, default=0, help="max linii (0 = bez limitu)")
    args = ap.parse_args()

    print(f"Otwieram {args.port} @ {args.baud}...")
    ser = serial.Serial(args.port, args.baud, timeout=2)

    n = 0
    with open(args.out, "w", newline="") as f:
        print(f"Zapis do {args.out}. Ctrl+C aby zakonczyc.")
        try:
            while True:
                line = ser.readline().decode("ascii", errors="ignore").strip()
                if not line:
                    continue
                print(line)
                # zapisuj tylko linie wygladajace na CSV (cyfry/przecinki) + naglowek
                if line[0].isdigit() or line.lower().startswith("sample"):
                    f.write(line + "\n")
                    f.flush()
                    n += 1
                    if args.max and n >= args.max:
                        break
        except KeyboardInterrupt:
            print(f"\nPrzerwano. Zapisano {n} linii do {args.out}.")
        finally:
            ser.close()

if __name__ == "__main__":
    main()
