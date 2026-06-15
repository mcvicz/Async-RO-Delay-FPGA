# Checklist — dzień z płytką (ZedBoard)

Co robić krok po kroku gdy dostaniesz ZedBoard. Wszystko przygotowane —
bitstream + .elf + skrypty gotowe. To tylko wgranie + zebranie danych.

Szacowany czas: 1 wieczór (~2-3h) na F5-run + F6 + F7. F8 osobno.

---

## 0. Przed startem — sprawdź że masz

- [ ] ZedBoard + zasilacz + 2× kabel microUSB (PROG + UART)
- [ ] Zworka/kabelek do Pmod JA (do F6 loopback) — pin JA1↔JA2 (Y11↔AA11)
- [ ] Projekt otwarty w Vivado 2018.3 (lub bitstream `system_wrapper.bit`)
- [ ] SDK z aplikacją `osc_freq_read` (.elf zbudowany)
- [ ] Terminal serial: PuTTY / TeraTerm / Vitis SDK Terminal — **115200 8N1**

---

## 1. Podłączenie sprzętu (5 min)

1. ZedBoard: kabel microUSB do portu **PROG** (J17, obok zasilania) → PC
2. Drugi microUSB do portu **UART** (J14) → PC
3. **Boot mode jumpers**: ustaw na **JTAG** (MIO config — kaskada jumperow przy SD)
   - Dla samego JTAG/SDK debug: JTAG mode wystarczy (nie potrzeba SD/QSPI boot)
4. Przełącznik **POWER → ON**
5. Sprawdź w Menedzerze urzadzen (Windows) który COM to UART (np. COM5)
   - Dwa porty COM się pojawią (PROG silicon labs + UART). UART = ten do danych.

---

## 2. Wgranie bitstreamu + programu (SDK, 10 min)

### Wariant A: z SDK (najprościej, JTAG)
1. SDK → **Xilinx → Program FPGA**
   - Bitstream: `system_wrapper.bit` (auto)
   - **Program** → FPGA skonfigurowany (DONE LED zapala się na płytce)
2. Otwórz terminal serial (COM UART, 115200) ZANIM uruchomisz program
3. SDK → prawym na `osc_freq_read` → **Run As → Launch on Hardware (System Debugger)**
4. Na terminalu pojawi się:
   ```
   === Async Ring Oscillator -- pomiar f ===
   sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c
   0,0,carry,4,...,...,42.3
   ```

### Co sprawdzić od razu
- [ ] Nagłówek CSV się pojawia
- [ ] `temp_c` ma realną wartość (~40-50°C) → XADC działa
- [ ] freq rośnie gdy tap maleje (krótsza pętla = wyższa f)
- [ ] `freq_khz` dla carry: setki tysięcy kHz (setki MHz × prawdziwa pętla)
- [ ] LED LD3 (led_osc) miga/świeci

### Diagnostyka jak nie działa
- Brak CSV na terminalu → zły COM (spróbuj drugi) lub baud ≠ 115200
- `temp_c = 0` → XADC init fail (sprawdź czy BSP ma driver xadcps)
- freq = 0 dla wszystkich → mux/prescaler, sprawdź osc_select w control reg
- DONE LED nie świeci → bitstream nie wgrany, powtórz Program FPGA

---

## 3. F5 zamknięcie — capture danych (15 min)

Program wypisuje CSV w pętli. Przechwyć do pliku:

### Opcja A: log_capture.py (zalecane)
```bash
cd analysis
python3 log_capture.py --port COM5 --out exp01_fN.csv --max 50
```
(--max 50 = pierwsze 50 linii = sweep f(N) + porównanie wariantów)

### Opcja B: terminal save
PuTTY: Session → Logging → All session output → plik. Potem ręcznie wytnij CSV.

- [ ] Plik CSV zapisany z realnymi danymi
- [ ] **F5 DONE** — pełny stack PL→PS→PC zadziałał na żywo

---

## 4. F7 — pomiary podstawowe (30 min)

### EXP_01: krzywa f(N)
Program robi sweep tap 4→63 automatycznie na starcie. Capture → plot:
```bash
python3 log_capture.py --port COM5 --out exp01_fN.csv --max 20
python3 plot_fN.py exp01_fN.csv
```
- [ ] Wykres f(N) z REALNYCH danych → realne t_d [ps/stopień]

### EXP_02: histogram jitteru
Program po sweepach wchodzi w monitoring CARRY4 tap=32 (pętla). Zbierz ~1000 próbek:
```bash
python3 log_capture.py --port COM5 --out exp02_jitter.csv --max 1000
python3 plot_jitter.py exp02_jitter.csv
```
- [ ] Histogram + Gauss → realna σ jitteru (podstawa TRNG)

---

## 5. F6 — IO Loopback (20 min)

1. **Wyłącz zasilanie** ZedBoard
2. Załóż zworkę na Pmod JA: **JA1 (Y11) ↔ JA2 (AA11)**
3. Włącz, wgraj ponownie
4. W monitorze ustaw wariant loopback: edytuj main.c `measure(2, ...)` (variant=2)
   LUB dodaj odczyt dla v=2 w pętli porównania
5. Capture loopback freq
- [ ] osc_loopback oscyluje (wolniejszy — PCB delay, ~MHz nie setki MHz)
- [ ] **F6 DONE**

UWAGA: `async_ro_loopback.v` to placeholder! Przed F6 trzeba dopisać realną
pętlę OBUF→pin→IBUF. Daj znać AI — wygeneruję realny moduł (5 min).

---

## 6. F8 — drift + f(T) (45 min, osobna sesja)

### EXP_03: drift termiczny
Od zimnego startu, monitoring 5 min:
```bash
python3 log_capture.py --port COM5 --out exp03_drift.csv --max 600
python3 plot_drift.py exp03_drift.csv
```
- [ ] f(t) spada gdy chip się grzeje → τ [s]

### EXP_04: f(T) — krzemowy termometr
Wymuś grzanie: workload na ARM albo suszarka/palec na chip. Zbieraj freq+temp:
```bash
python3 log_capture.py --port COM5 --out exp04_fT.csv --max 300
python3 plot_fT.py exp04_fT.csv
```
- [ ] Korelacja f(T), współczynnik [kHz/°C]
temp_c już jest w CSV (XADC) → plot_fT zadziała od razu.

---

## 7. EXP_07 — tabela sync vs async (10 min)

Program robi porównanie 4 wariantów przy starcie (tap=63). Capture + analiza:
```bash
python3 log_capture.py --port COM5 --out exp07_compare.csv --max 30
python3 compare_sync_async.py exp07_compare.csv
```
- [ ] Tabela: sync (mały jitter) vs carry/lut/loopback (duży) → wniosek główny

---

## 8. Po pomiarach

- [ ] Skopiuj realne wykresy do `docs/figures/` (zastąp syntetyczne)
- [ ] Wpis do `docs/progress-history.md` (sesja pomiarowa, daty, wyniki)
- [ ] Commit: `git add ... && git commit -m "F7-F8: realne pomiary"` (bez co-author!)
- [ ] Push origin mcvicz
- [ ] Update STATUS — procent skacze do ~85%+

---

## Priorytety jak mało czasu z płytką

1. **F5 run + EXP_01 f(N)** — dowód że cały stack działa na żywo (must)
2. **EXP_07 sync vs async** — wniosek główny (must)
3. EXP_02 jitter — mocne (nice)
4. F6 loopback — wymaga zworki + realnego modułu (nice)
5. F8 drift/f(T) — osobna sesja, grzanie (later)

Minimum na obronę z płytką: F5 run + EXP_01 + EXP_07 = ~45 min.

---

## Czego AI potrzebuje od Ciebie po pomiarach
- Wklej kilka linii realnego CSV → sprawdzę czy sensowne
- Screeny wykresów → ocena + interpretacja do raportu
- Realne liczby (t_d, σ jitteru, współczynnik f(T)) → wpiszemy do raportu/prezki

**Przed F6: poproś AI o realny async_ro_loopback.v (teraz placeholder).**
