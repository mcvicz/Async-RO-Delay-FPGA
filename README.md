# Asynchroniczny Ring Oscillator na FPGA

Projekt i charakterystyka asynchronicznych generatorów częstotliwości (**ring oscillator**)
zbudowanych z elementów **innych niż LUT** (głównie `CARRY4`), porównanych z synchronicznym
licznikiem referencyjnym — **uruchomionych i zmierzonych na realnym krzemie**.

**Platforma:** Digilent Zybo Z7-10 (Xilinx Zynq-7010, `xc7z010clg400-1`) · Vivado 2018.3
**Autorzy:** Paweł Michalcewicz, Krzysztof Podoba · **Prowadzący:** dr inż. Jamro

📊 **Prezentacja (GitHub Pages):** https://mcvicz.github.io/Async-RO-Delay-FPGA/

---

## O co chodzi

FPGA to maszyna synchroniczna — wszystko w rytm zegara. Ten projekt łamie ten paradygmat:
budujemy **pętlę kombinacyjną bez zegara**, która oscyluje sama z siebie. Jej częstotliwość
zależy od **fizyki krzemu** (opóźnienia bramek, temperatura, napięcie, wariacje produkcyjne) —
FPGA staje się sensorem własnego krzemu.

Zastosowania: **TRNG** (kryptografia), **PUF** (fingerprint krzemu), **krzemowy termometr**.

## Co jest w środku

**4 warianty oscylatora** (wybór przełącznikami):
- `sync_baseline` — synchroniczny licznik (referencja)
- `async_ro_carry` — 64× CARRY4 ring + tap selector (rdzeń projektu)
- `async_ro_lut` — 15× LUT1 inverter ring
- `async_ro_loopback` — pętla zamknięta fizycznie przez Pmod (zworka off-chip)

**Tor pomiarowy:** prescaler /16 (omija Nyquista) → freq_counter (okno 1 ms, TDC) →
ILA przez JTAG (4096 okien, storage-qualified) → analiza w Pythonie.

## Wyniki (z krzemu, zero mocków)

| Pomiar | Wynik |
|---|---|
| f(N) — krzywa strojenia CARRY4 | 134 → 67 MHz (16→64 stopni) |
| Opóźnienie na stopień (linearyzacja) | t_d ≈ 82 ps |
| Jitter (carry) | 129–148 ppm, rośnie z długością pętli |
| IO-loopback przez Pmod | 32.1 MHz |
| LUT ring | 112.7 MHz |
| Zasoby | 77× CARRY4, 0 LUT w pętli (cel osiągnięty) |

## Jak używać

### Otworzyć i zbudować (Vivado 2018.3)
```
fpga_project/oscillator/oscillator.xpr   <- otwórz w Vivado
# top: top_system_zybo, constraints: zybo_pins.xdc
# Generate Bitstream -> Program Device (Zybo Z7-10)
```

### Zmierzyć (ILA)
1. Open Hardware Manager → Program Device
2. Ustaw przełączniki (wariant SW0/SW1, tap SW2/SW3) — patrz `docs/MEASUREMENT_PLAN.md`
3. Run Trigger → 4096 próbek → **Export ILA Data → Format CSV** → zapisz do `measurements/`

### Przeanalizować (Python: pandas, numpy, matplotlib)
```bash
cd analysis
# krzywa f(N):
python3 ila_collect.py ../measurements/carry_16.csv ../measurements/carry_32.csv \
                       ../measurements/carry_48.csv ../measurements/carry_64.csv
python3 plot_fN.py real_fN.csv
# histogram jitteru:
python3 ila_jitter.py ../measurements/carry_16.csv carry_16
```
Wykresy → `analysis/figures/`.

## Struktura repo

```
fpga_project/oscillator/   projekt Vivado (RTL, XDC, Block Design, bitstream)
measurements/              realne dane z krzemu (CSV z ILA) + drift/
analysis/                  skrypty ILA + realne wykresy (figures/)
docs/                      dokumentacja + prezentacja (GitHub Pages)
  PROJECT_GUIDE.md           pełna dokumentacja techniczna
  MEASUREMENT_PLAN.md        matryca pomiarów
  RAPORT_STANU.md            uczciwy status (co zrobione/nie)
  presentation/              prezentacja końcowa (HTML, 32 slajdy)
*/past_versions/           archiwum (stare wersje, nie kasujemy historii)
```

Pełny opis techniczny: **[`docs/PROJECT_GUIDE.md`](docs/PROJECT_GUIDE.md)**.
Status i uczciwy bilans: **[`docs/RAPORT_STANU.md`](docs/RAPORT_STANU.md)**.

## Stack

Verilog · Vivado 2018.3 (synteza, implementacja, ILA) · Xilinx SDK (ścieżka AXI/ARM, F5) ·
Python (pandas, numpy, matplotlib) · HTML/CSS (prezentacja)

## Licencja

[MIT](LICENSE) © 2026 Paweł Michalcewicz, Krzysztof Podoba
