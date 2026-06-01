# Przewodnik po projekcie — Async Ring Oscillator na FPGA

**Pełna dokumentacja techniczna. Aktualizowana na bieżąco, commitowana z projektem.**

Autorzy: Paweł Michalcewicz, Krzysztof Podoba · Prowadzący: dr inż. Jamro
Platforma: ZedBoard Zynq-7020 (`xc7z020clg484-1`), Vivado 2018.3 + Xilinx SDK

---

## 1. Czym jest projekt

Asynchroniczny generator częstotliwości (**ring oscillator**) zbudowany z elementów **innych niż LUT** (głównie CARRY4), porównany z synchronicznym licznikiem referencyjnym.

**Teza:** FPGA jest narzędziem dla układów synchronicznych. Łamiemy ten paradygmat — pętla bez zegara, której częstotliwość zależy od **fizyki krzemu** (opóźnienia bramek, temperatura, napięcie, wariacje produkcyjne). FPGA staje się sensorem własnego krzemu.

**Zastosowania:** TRNG (kryptografia), PUF (fingerprint krzemu), krzemowy termometr.

---

## 2. Architektura systemu

```
┌─────────────────────── PL (FPGA fabric) ────────────────────────┐
│  4 warianty oscylatora:                                          │
│   sync_baseline   (licznik 100MHz -- referencja)                 │
│   async_ro_carry  (64x CARRY4 ring + tap selector)               │
│   async_ro_loopback (petla przez Pmod -- F6, placeholder)        │
│   async_ro_lut    (15x LUT1 inverter ring)                       │
│           │                                                      │
│           ▼ sw_mode / osc_select                                 │
│        ┌──────┐    ┌────────────┐    ┌──────────────┐            │
│        │ MUX  │───▶│ prescaler  │───▶│ freq_counter │            │
│        └──────┘    │   /256     │    │  okno 1ms    │            │
│                    └────────────┘    │  + 2FF sync  │            │
│                                       └──────┬───────┘            │
│                                  freq_counter_axi (AXI-Lite slave)│
└───────────────────────────────────────────────┼─────────────────┘
                                                  │ AXI-Lite @ 0x43C00000
┌─────────────────────── PS (Zynq ARM) ──────────┼─────────────────┐
│  ARM Cortex-A9: czyta freq, steruje osc/tap     │                 │
│  main.c -> CSV przez UART (115200)              ▼                 │
└──────────────────────────────────────────── UART ────────────────┘
                                                  │
                                          PC: log_capture.py -> CSV
                                          analysis/*.py -> wykresy
```

---

## 3. Moduły Verilog (`oscillator.srcs/sources_1/new/`)

| Plik | Rola | Stan |
|---|---|---|
| `sync_baseline.v` | Licznik N-bit @ 100MHz, referencja | ✅ |
| `async_ro_carry.v` | 64× CARRY4 ring + 6-bit tap mux, dont_touch/keep | ✅ |
| `async_ro_lut.v` | 15× LUT1 inverter ring | ✅ |
| `async_ro_loopback.v` | Pętla przez Pmod (zewn. zworka) | placeholder (F6) |
| `freq_counter.v` | Okno 1ms + 2FF synchronizer + licznik zboczy | ✅ |
| `async_prescaler.v` | Ripple /2^N taktowany ringiem (pokonuje Nyquista) | ✅ |
| `freq_counter_axi.v` | AXI4-Lite slave, 4 rejestry, freq_counter w środku | ✅ |
| `osc_axi_system.v` | PL top dla BD: warianty+mux+prescaler+AXI | ✅ |
| `top_system.v` | Top standalone (bez PS) — ZedBoard | ✅ |
| `top_system_zybo.v` | Wariant Zybo Z7-10 (w pogotowiu) | ✅ |

### Walka z Vivado (kluczowe do obrony)
- `(* dont_touch="true", keep="true" *)` — na nodach loop closure, blokuje wycięcie pętli
- Jawna instancjacja prymitywów `CARRY4` / `LUT1` (nie inferencja z RTL)
- `set_false_path` — wyłączenie analizy timing pętli kombinacyjnej
- `ALLOW_COMBINATORIAL_LOOPS TRUE` — potwierdzenie zamierzonej pętli (inaczej DRC LUTLP-1 blokuje bitstream)
- LOC: próbowane (SLICE_X8) — okazało się że Vivado sam organizuje CARRY4 cascade

---

## 4. Mapa rejestrów AXI-Lite (baza 0x43C00000)

| Offset | Rejestr | R/W | Opis |
|---|---|---|---|
| 0x00 | freq_count | RO | zbocza w oknie 1ms (po /256) |
| 0x04 | control | RW | [1:0] osc_select, [2] enable |
| 0x08 | status | RO | [0] valid (nowy pomiar) |
| 0x0C | tap_select | RW | [5:0] długość pętli CARRY4 |

`osc_select`: 0=sync, 1=carry, 2=loopback, 3=lut
Realna f = `freq_count × 256 / 1ms` = `freq_count × 256 kHz`

---

## 5. Tor pomiarowy — dlaczego tak (TDC)

Sygnał async (setki MHz) nie da się odczytać bezpośrednio. Kwantyzujemy:
1. **Prescaler /256** dzieli f w domenie async (ripple counter taktowany ringiem) → wolny sygnał. Bez tego licznik 100MHz mierzy max ~50MHz (Nyquist).
2. **Okno 1ms** zegarem 100MHz, **2FF synchronizer** chroni przed metastabilnością.
3. Liczymy zbocza w oknie → liczba = częstotliwość. To **Time-to-Digital Conversion**.

---

## 6. Flow budowania

### Symulacja (bez płytki)
```tcl
# Ring oscylacja (mock, bo SDF hanguje XSim na comb loop):
set_property top tb_ring_mock [get_filesets sim_1]
launch_simulation -mode behavioral
# Pomiar freq:
set_property top tb_freq_counter [get_filesets sim_1]
launch_simulation -mode behavioral
# Prescaler (pomiar >Nyquist):
set_property top tb_prescaler_chain [get_filesets sim_1]
launch_simulation -mode behavioral
```

### Bitstream + ARM (Block Design flow)
```tcl
source files/create_bd.tcl              # buduje BD Zynq+AXI
# przelacz XDC na bd_pins.xdc, launch_runs impl_1 -to_step write_bitstream
# File -> Export Hardware (include bitstream)
# File -> Launch SDK -> New App -> wklej sw/main.c -> Build
```

### Analiza (Python)
```bash
cd analysis
python3 gen_sample_data.py    # dane syntetyczne (bez plytki)
python3 plot_fN.py            # + plot_jitter/drift/fT, compare_sync_async
# Z plytka: log_capture.py --port COMx --out X.csv, potem plot_X.py X.csv
```

---

## 7. Eksperymenty (deliverables)

| # | Eksperyment | Skrypt | Wymaga |
|---|---|---|---|
| EXP_01 | f(N) krzywa strojenia | plot_fN.py | płytka/sym |
| EXP_02 | histogram jitteru | plot_jitter.py | płytka |
| EXP_03 | drift termiczny f(t) | plot_drift.py | płytka |
| EXP_04 | korelacja f(T) | plot_fT.py | płytka + XADC |
| EXP_05 | phase locking | — | płytka (opc.) |
| EXP_06 | walidacja SDF vs HW | — | płytka |
| EXP_07 | tabela sync vs async | compare_sync_async.py | płytka |

Skrypty przetestowane na danych syntetycznych — gotowe na realne.

---

## 8. Errata / decyzje

- **E1:** ZedBoard ma 8 DIP (nie więcej) → sw_mode[1:0] + sw_tap[5:0], piny M14/G15 usunięte
- **E2:** SDF post-impl sim hanguje XSim (comb loop) → mock model behavioral
- **E3:** XDC nie wspiera `for`/`foreach`/`if` → combined get_nets z `||`
- **E4:** 2018.3 = SDK nie Vitis; Export = .hdf
- **E5:** prescaler osc-jako-zegar → warningi gated-clock (benign, nie w pętli loopback przez pmod→BUFG)

---

## 9. Status: ~65%
F1-F5 + F9-prep DONE (sym + bitstream + ARM C + analiza). Brakuje: fizyczne pomiary F6-F8 (płytka), raport końcowy.
