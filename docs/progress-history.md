# Dziennik zmian — Async Ring Oscillator FPGA

Chronologiczna historia projektu. Dopisujemy na bieżąco po każdej sesji.

---

## Sesja 6 — 2026-06-15 (prezentacja końcowa + porządki + audyt)

**Cel:** domknąć prezentację końcową, posprzątać repo, uczciwy audyt stanu.

### Zrobione
- **Prezentacja końcowa** `prezka/prezentacja_wyniki.html` — 32 slajdy: teoria (paradygmat, 4 warianty, diagramy SVG) → pomiar (infra, BD/F5, walka z Vivado) → symulacje (7 waveformów, jeden na slajd) → wyniki realne. Screeny skalowane (`object-fit`, portretowe nie rozjeżdżają się).
- **Block Design odzyskany** — otwarty z `system_bd.tcl` w osobnym projekcie xc7z020, screen do prezki (slajd F5). Pliki BD cały czas były na dysku (wypięte z .xpr w sesji 4), nic nie zginęło.
- **Audyt + RAPORT_STANU.md** — zweryfikowane realne liczby ze skryptem (carry_16: 134.37 MHz/σ17.3/129ppm itd. — zgodne z prezką). Potwierdzono: zero mocków w danych, f(N) w prezce z realnego `real_fN.csv`.
- **Wielkie porządki w repo:**
  - `measurements/` — realne CSV z krzemu (było w `fpga_project/oscillator/`), drift do `measurements/drift/`, stare /256 do `measurements/past_versions/old_256/`
  - `analysis/figures/` — realne histogramy + f(N); legacy (syntetyczne skrypty/CSV/figi, UART) → `analysis/past_versions/`
  - `docs/past_versions/` — przestarzałe (HW_CHECKLIST ZedBoard, runbook 02.06, syntetyczne figi)
  - outer `files/` (stare planowanie) → `repo/past_versions/planning_docs/`
- **Aktualizacja docs** — `PROJECT_GUIDE.md`, `analysis/README.md`, `docs/README.md` przepisane na stan finalny (Zybo /16 ILA). Wcześniej opisywały stary ZedBoard /256 — sprzeczność z rzeczywistością naprawiona.

### Uczciwie niezrobione (w RAPORT_STANU.md)
- f(T) XADC (wymaga PS, Zybo standalone PL), phase locking, SDF-vs-HW (SDF wiesza XSim)
- AXI/ARM nie odpalony na Zybo (tylko bitstream ZedBoard)
- raport PDF (prezka zastępuje)

### Stan: ~95%. Rdzeń na krzemie, pomiary realne, dokumentacja spójna.

---

## Sesja 5 — 2026-06-10 (pomiary na krzemie + kampania)

**Cel:** realne pomiary przez ILA, loopback, pełna kampania.

### Zrobione
- **Loopback realny** — `async_ro_loopback.v`: inwerter+OBUF→pin→zworka→IBUF, pętla off-chip. Zworka JE1(V12)↔JE2(W16) kabelkiem M-M (lutowana prowizorka, przegwizdana). DZIAŁA: ~33 MHz.
- **ILA na freq_count** — mark_debug + Set Up Debug, capture przez JTAG. Long-path fix: `subst X:` (dbg_hub limit 146 znaków). MU_CNT=2 (capture control wymaga ≥2).
- **Storage qualification** — C_EN_STRG_QUAL + bufor 4096, capture freq_valid==1 → 4096 osobnych okien 1ms = jitter.
- **Pierwsze realne pomiary (zero mocków):**
  - carry tap15: 142 MHz → 134 MHz (DRIFT termiczny ~5%, chip się grzał — EXP_03 gratis)
  - loopback: 32.6 MHz
  - jitter: carry 862 ppm, loopback 3604 ppm (loopback 4× głośniejszy)
- **Excel PL fix** — `ila_collect.py` daje CSV ze średnikami + przecinkiem dziesiętnym (polski Excel czyta kolumny). Plus `ila_jitter.py` (histogram).
- **Upgrade rozdzielczości** — prescaler /256→/16 (DIV_BITS=4) + sync_baseline WIDTH 24→4 (7.8MHz, mierzalny). Wszystkie 4 warianty mierzalne, jitter finer.

### Nowe skrypty analizy
`ila_to_freq.py`, `ila_collect.py` (Excel PL + f(N)), `ila_jitter.py` (histogram σ).

### Lekcje
- ILA dbg_hub: ścieżka temp <146 znaków → `subst X:` na repo
- Capture control: MU_CNT≥2, C_EN_STRG_QUAL true, Capture Setup (nie Trigger) = storage qualifier
- Export MUSI być Format=CSV (nie .ila natywny binarny)
- /256 dawało LSB-limited jitter (2 wartości) → /16 dla finer

### Stan: realne pomiary z krzemu. Kampania w toku.

---

## Sesja 4 — 2026-06-09 (Zybo na żywo)

**Cel:** uruchomienie na fizycznej płytce. Jamro dał **Zybo Z7-10 (xc7z010clg400-1)** — inny chip niż ZedBoard (xc7z020).

### Zrobione
- **Pivot na Zybo Z7-10** — zmiana części xc7z020→xc7z010, top = `top_system_zybo` (standalone PL, bez PS)
- **`zybo_pins.xdc`** — piny Zybo (clk 125MHz L16, SW0-3, LED0-3, Pmod JE) + `ALLOW_COMBINATORIAL_LOOPS`
- **Bitstream `top_system_zybo.bit`** wygenerowany, 0 errors, 77 CARRY4
- **FLASH NA PŁYTCE — DZIAŁA** ✓ Ring oscillator na realnym krzemie:
  - LD0 miga ~2Hz (alive, PL żyje)
  - SW0/SW1 → mux wariantu (LD1/LD2 echo)
  - LD3 = wybrany oscylator: **miga dla sync (00), ciągły dla async** (ring setki MHz, za szybki dla oka) — wizualny dowód różnicy sync vs async
  - SW2/SW3 = strojenie tap CARRY4

### Walka z Vivado (lekcja)
- Multi-top ambiguity (top_system / top_system_zybo / osc_axi_system) → Vivado auto-top ciągle nadpisywał. Popup "auto pick top" + tryb hierarchii.
- BD (system.bd) pod ZedBoard zablokowany po zmianie części → psuł walidację hierarchii, IP locked errors.
- **Rozwiązanie:** usunięto z PROJEKTU (nie z dysku/git): system.bd + wrapper + osc_axi_system.v + freq_counter_axi.v + top_system.v. Został top_system_zybo jako jedyny top → czysto. Re-add świeży top_system_zybo.v dobił indeksowanie.
- BD/ZedBoard wszystko bezpieczne w git `fad7a58` + backup `../_backup_zybo/`.

### Stan: ring DZIAŁA na krzemie. ~78%.
Brakuje: twarde pomiary (CSV/UART wymaga BD+PS pod Zybo — odłożone), F6 loopback (zworka), raport.

---

## Sesja 3 — 2026-06-02

**Cel:** F5 (Block Design + ARM) na całość + F9 prep + audyt.

### Zrobione
- **F4 freq_counter** — testbench `tb_freq_counter`, pomiar działa: 25 MHz → 249 zbocz/10µs (oczek. 250). Pokazany limit Nyquista (tap=15 → aliasing). Commit `0bd4e2e`.
- **F4+ async_prescaler** — ripple /2^N taktowany ringiem. `tb_prescaler_chain`: 320 MHz → /16 → freq_counter → odzysk 318 MHz. **Nyquist pokonany** (licznik 100 MHz mierzy 320 MHz ring). Commit `50d471a`.
- **F5 Block Design** — `freq_counter_axi` (AXI4-Lite slave) + `osc_axi_system` (PL top). BD: Zynq PS7 + AXI Interconnect, adres 0x43C00000. Fix DRC LUTLP-1 przez `ALLOW_COMBINATORIAL_LOOPS`. **Bitstream wygenerowany, 0 errors.** Commit `fad7a58`.
- **F5 kod C** — `sw/main.c`, bare-metal ARM: czyta freq przez AXI, sweep f(N), CSV przez UART. Build OK w SDK (`.elf`). Commit `d8dc0cd`.
- **F9 prep** — pakiet `analysis/`: gen_sample_data, log_capture (UART), plot_fN/jitter/drift/fT, compare_sync_async. 5 wykresów z danych syntetycznych. Commit `2af8d10`.
- **Audyt** — naprawiony mismatch schema CSV (main.c 5-kol → 7-kol kanoniczne, zgodne z analizą). Utworzony folder `docs/`.
- **F8 prep — XADC** — `main.c` czyta temperaturę krzemu przez PS XADC (driver `xadcps`, `XPAR_XADCPS_0`). Realny `temp_c` w CSV zamiast placeholder → EXP_04 f(T) ruszy od razu na płytce. Zero zmian RTL/BD (PS XADC, nie PL).

### Ustalenia techniczne
- 2018.3 używa **SDK** (nie Vitis), Export = `.hdf`
- XDC nie wspiera `for`/`foreach`/`if` → combined get_nets z `||`
- prescaler osc-jako-zegar → warningi gated-clock (benign dla wewn. ringu)

### Procent: ~65%

---

## Sesja 2 — 2026-05-19 (popołudnie/wieczór)

**Cel:** F2 rdzeń (CARRY4 ring) + decyzje Jamro.

### Zrobione
- **F2 CARRY4 ring** — `async_ro_carry`: 64× CARRY4 + LUT1 inverter. Walka z optymalizatorem (dont_touch/keep). Pierwsze podejście bez LOC → 64× DRC DXSTAT-3. Po fixach: Implementation Complete, 7.6 ns slack, 77 CARRY4 routed.
- **F2.5 LUT-ring** — `async_ro_lut` 15 inwerterów (sugestia Jamro), 4-ty wariant.
- **Sym oscylacji** — SDF post-impl hangował XSim (comb loop). Plan B: `ring_osc_mock` + `tb_ring_mock` behavioral → pokazuje oscylację + tap scaling + 2 warianty.
- Git: .gitignore, cleanup artifacts.

### Spotkanie Jamro (19.05)
- Deadline 26.05: działająca sym ✅
- CARRY4 lub LUT obojętne → zostajemy CARRY4 + LUT jako bonus
- IO loopback w scope (F6), AXI-Lite "fajnie" (F5), ARM > MicroBlaze
- 1 MHz nie twardy cel → prescaler

### Commit: `06cdd90` (tydzien 2)

---

## Sesja 1 — 2026-05-19 (start)

**Cel:** Setup + F1 baseline.

### Zrobione
- Projekt Vivado, ZedBoard part, struktura plików
- `sync_baseline.v` + szkielety + `top_system.v` + XDC
- F1: synth/impl/bitstream OK, behavioral sim sync_baseline PASS (1.28µs okres)
- **Errata E1:** ZedBoard ma 8 DIP → sw_tap 6-bit, piny M14/G15 usunięte

### Commit: `07c221c` (v1)

---

## Backlog (do zrobienia)

| Faza | Zadanie | Blokada |
|---|---|---|
| F5-HW | Run na płytce, CSV na żywo przez UART | płytka |
| F6 | IO Loopback (zworka Pmod) | płytka |
| F7 | Pomiary podstawowe (f(N), jitter) | płytka |
| F8 | Drift, f(T) z XADC, phase locking | płytka + XADC |
| F9 | Raport końcowy PDF | — (można pisać) |

## Konwencja commitów
- Bez `Co-Authored-By` (wymóg uczelni)
- Prefix fazą: `F4:`, `F5:`, `F9:`
- Branch roboczy: `mcvicz`
- Po fazie: commit + push origin mcvicz
