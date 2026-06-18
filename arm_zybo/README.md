# Tor PS+PL — ARM czyta ring przez AXI4-Lite (F5)

Druga ścieżka odczytu oscylatora: procesor **ARM Cortex-A9** (Zynq PS) czyta licznik
częstotliwości ringu przez magistralę **AXI4-Lite**, na realnym **Zybo Z7-10**. Pierwotnie
Block Design powstał na ZedBoard (xc7z020); tutaj przeniesiony i uruchomiony na Zybo (xc7z010).

> Pomiary f(N)/jitter w głównym projekcie idą przez ILA-over-JTAG (prościej, bez PS).
> Ten folder to wariant z procesorem — pokazuje integrację PS+PL i sterowanie ringiem z ARM.

## Pliki

| Plik | Co |
|---|---|
| `build_zybo_arm.tcl` | Buduje od zera projekt Vivado: Zynq PS7 (preset Zybo) + AXI Interconnect + `osc_axi_system` + reset. Walidacja BD, wrapper jako top. |
| `zybo_bd_pins.xdc` | Constraints Zybo (LED, Pmod JE loopback) + `set_false_path` + `ALLOW_COMBINATORIAL_LOOPS`. |
| `main.c` | Bare-metal ARM: czyta `freq_count` przez AXI, sweep tap/wariant, wypluwa CSV na UART. |

Źródła RTL (`osc_axi_system.v`, `freq_counter_axi.v`, ring/prescaler) — w głównym projekcie:
`../fpga_project/oscillator/oscillator.srcs/sources_1/new/`.

## Jak działa

```
ARM Cortex-A9 (PS) ──AXI4-Lite──> osc_axi_system (PL)
                     @0x43C00000   ├─ mux 4 wariantów (sync/carry/lut/loopback)
                                   ├─ prescaler (dzielnik w domenie async)
                                   └─ freq_counter (okno 1 ms, TDC)
```

Mapa rejestrów (baza `0x43C00000`):

| Offset | Rejestr | R/W | Opis |
|---|---|---|---|
| 0x00 | `freq_count` | RO | zbocza zliczone w oknie 1 ms (po prescalerze) |
| 0x04 | `control` | RW | [1:0] osc_select, [2] enable |
| 0x08 | `status` | RO | [0] valid (nowy pomiar gotowy) |
| 0x0C | `tap_select` | RW | długość pętli CARRY4 |

ARM zapisuje `control`/`tap_select` → steruje ringiem; czyta `freq_count` → mierzy.
Skrócenie pętli (mniejszy tap) podnosi odczytaną częstotliwość.

## Budowanie

1. Zainstaluj board files Digilent `zybo-z7-10`, **zrestartuj Vivado**.
2. Tcl Console: dostosuj `set base` w `build_zybo_arm.tcl` do swojej ścieżki, potem
   `source .../arm_zybo/build_zybo_arm.tcl` → powstaje BD + wrapper.
3. Generate Bitstream → Export Hardware (include bitstream) → Launch SDK.
4. SDK: nowy app, wklej `main.c`, ustaw `stdout` BSP na `ps7_uart_1` (Zybo prowadzi USB-UART
   na UART1, MIO48-49), zbuduj.
5. Program FPGA + Run on ARM. Odczyt rejestrów AXI również wprost przez konsolę XSCT
   (`mwr 0x43C0000C ...; mrd 0x43C00000`).

## Uwagi

- Wartości freq_count w tym wariancie nie są wprost porównywalne z pomiarami ILA z głównego
  projektu — to osobna kompilacja (inny placement/zegar/prescaler). Pokazuje **relację**
  (krótsza pętla → wyższy odczyt) i **działający most PS↔PL**, nie bezwzględne MHz.
- Pełny projekt Vivado nie jest wersjonowany (regenerowalny z `build_zybo_arm.tcl`).
