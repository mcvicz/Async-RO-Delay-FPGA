# Dziennik zmian — Async Ring Oscillator FPGA

Chronologiczny przebieg prac, aktualizowany po każdym etapie.

---

## 2026-06-16 — Tor PS+PL (ARM) na krzemie + TRNG

- **F5 — tor AXI4-Lite + ARM uruchomiony na Zybo Z7-10** (wcześniej zaprojektowany, bitstream na ZedBoard):
  doinstalowano board files Digilent (Zybo), zbudowano świeży projekt (PS7 preset Zybo + AXI Interconnect
  + `osc_axi_system`), bitstream i aplikację SDK. ARM odczytuje `freq_count` przez AXI (@0x43C00000);
  zapis `tap`/`osc_select` zmienia odczyt (tap63→162, tap15→291, lut→279) — krótszy ring daje wyższy
  odczyt. Weryfikacja przez konsolę XSCT. Wyświetlanie przez UART pominięte (usterka sprzętowa portu);
  pełny tor PS+PL potwierdzony odczytem rejestrów. Skrypty: `arm_zybo/`.
- **TRNG + testy losowości** (`analysis/trng/`): ekstrakcja LSB z `freq_count` → strumienie bitów →
  testy (monobit, runs, entropia, autokorelacja, NIST SP800-22). Surowe LSB wykazują korelację
  strukturalną (carry_64 → 5/9); po post-processingu (XOR-combine, von Neumann) → 9/9. Strumienie krótkie
  (1k–28k bitów wobec ~10⁶ zalecanych przez NIST), więc p-value traktowane orientacyjnie.
- **Prezentacja** rozszerzona o slajdy TRNG i ARM; opublikowana na GitHub Pages.

## 2026-06-15 — Prezentacja końcowa, uporządkowanie repozytorium

- Prezentacja końcowa (HTML): teoria → architektura → tor pomiarowy → symulacje → wyniki z krzemu.
- Odtworzenie Block Design ze skryptu `system_bd.tcl` w osobnym projekcie (xc7z020) — materiał do dokumentacji.
- Weryfikacja wartości pomiarowych skryptem (carry_16: 134.37 MHz, σ 17.3 kHz, 129 ppm — zgodne z prezentacją).
- Reorganizacja repozytorium: `measurements/` (dane z krzemu), `analysis/figures/` (wykresy),
  starsze wersje przeniesione do `past_versions/`. Dokumentacja zaktualizowana do stanu finalnego.

## 2026-06-10 — Pomiary na krzemie (kampania ILA)

- **Loopback** (`async_ro_loopback.v`): pętla off-chip przez Pmod (JE1↔JE2), ~32 MHz.
- **ILA na `freq_count`**: capture przez JTAG; storage qualification (`freq_valid==1`) → 4096 osobnych
  okien 1 ms = rozkład do analizy jittera. Obejście limitu długości ścieżki dbg_hub (subst dysku).
- **Zwiększenie rozdzielczości**: prescaler /256 → /16 (DIV_BITS=4), sync WIDTH 24→4 (7.8 MHz, mierzalny).
  Wszystkie cztery warianty mierzalne; rozkład jittera w pełni rozdzielony (carry: 129 ppm).
- Skrypty analizy: `ila_to_freq.py`, `ila_collect.py` (krzywa f(N) + eksport CSV dla Excela),
  `ila_jitter.py` (histogramy, σ).

## 2026-06-09 — Uruchomienie na Zybo Z7-10

- Zmiana platformy na Zybo Z7-10 (xc7z010clg400-1); top `top_system_zybo` (standalone PL).
- `zybo_pins.xdc` (zegar 125 MHz, SW0-3, LED0-3, Pmod JE) + `ALLOW_COMBINATORIAL_LOOPS`.
- Bitstream wygenerowany (0 errors, 77 CARRY4); konfiguracja na płytce potwierdzona.
- Demonstracja: LD3 miga dla wariantu sync, świeci ciągle dla async (oscylacja setki MHz).
- Rozwiązano konflikt wielu topów / zablokowanego BD po zmianie części (BD zachowany w git i kopii zapasowej).

## 2026-06-02 — Tor pomiarowy i Block Design

- `freq_counter` (testbench `tb_freq_counter`): 25 MHz → 249 zboczy/okno; pokazany limit Nyquista.
- `async_prescaler` (ripple /2^N taktowany ringiem): `tb_prescaler_chain` 320 MHz → /16 → odzysk 318 MHz.
- **F5 Block Design**: `freq_counter_axi` (slave AXI4-Lite) + `osc_axi_system`, Zynq PS7 + AXI Interconnect,
  adres 0x43C00000; bitstream 0 errors.
- Aplikacja bare-metal ARM (`main.c`): odczyt freq przez AXI, eksport CSV przez UART; build w SDK.
- Pakiet analizy w Pythonie (przygotowany wstępnie na danych syntetycznych — później zastąpiony danymi z krzemu).

## 2026-05-19 — Rdzeń CARRY4 + baseline

- `sync_baseline` (referencja synchroniczna): synteza/implementacja/bitstream, symulacja behawioralna OK.
- **`async_ro_carry`**: ring 64× CARRY4 + inwerter LUT1; dyrektywy `dont_touch`/`keep` przeciw optymalizacji.
  Implementacja zakończona, 77 CARRY4.
- `async_ro_lut`: wariant ringu z 15 inwerterów LUT1.
- Symulacja oscylacji: model behawioralny (`ring_osc_mock`/`tb_ring_mock`), ponieważ symulacja
  post-implementation z SDF zawiesza XSim na pętli kombinacyjnej.
- Ustalenia narzędziowe: Vivado 2018.3 = SDK (Export `.hdf`); XDC bez `for`/`foreach`/`if`.
