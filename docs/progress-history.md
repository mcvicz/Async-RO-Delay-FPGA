# Dziennik zmian — Async Ring Oscillator FPGA

Chronologiczna historia projektu. Dopisujemy na bieżąco po każdej sesji.

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
