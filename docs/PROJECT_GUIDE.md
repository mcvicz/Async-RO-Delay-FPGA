# Przewodnik po projekcie — Async Ring Oscillator na FPGA

**Pełna dokumentacja techniczna — stan FINALNY (na krzemie).**

Autorzy: Paweł Michalcewicz, Krzysztof Podoba · Prowadzący: dr inż. Jamro
Platforma finalna: **Digilent Zybo Z7-10 — Zynq-7010 (`xc7z010clg400-1`)**, Vivado 2018.3

> Uwaga historyczna: projekt zaczynał na ZedBoard (xc7z020). Prowadzący dał Zybo Z7-10 —
> pivot na inny chip, standalone PL, pomiar przez ILA. Stare dokumenty ZedBoard:
> `docs/past_versions/`.

---

## 1. Czym jest projekt

Asynchroniczny generator częstotliwości (**ring oscillator**) zbudowany z elementów **innych niż LUT** (głównie CARRY4), porównany z synchronicznym licznikiem referencyjnym — **uruchomiony i zmierzony na realnym krzemie**.

**Teza:** FPGA jest narzędziem dla układów synchronicznych. Łamiemy ten paradygmat — pętla bez zegara, której częstotliwość zależy od **fizyki krzemu** (opóźnienia bramek, temperatura, napięcie, wariacje). FPGA staje się sensorem własnego krzemu.

**Zastosowania:** TRNG (kryptografia), PUF (fingerprint krzemu), krzemowy termometr.

---

## 2. Architektura systemu (stan finalny — standalone PL + ILA)

```
┌─────────────────────── PL (FPGA fabric, Zybo Z7-10) ─────────────────────┐
│  4 warianty oscylatora (wybór SW0/SW1):                                   │
│   sync_baseline      (licznik clk/16 @125MHz -- referencja 7.8 MHz)       │
│   async_ro_carry     (64x CARRY4 ring + tap selector SW2/SW3)             │
│   async_ro_loopback  (petla przez Pmod JE1<->JE2 -- F6, kabelek)          │
│   async_ro_lut       (15x LUT1 inverter ring)                             │
│           │                                                               │
│           ▼ osc_selected                                                  │
│        ┌──────┐    ┌────────────┐    ┌──────────────┐                     │
│        │ MUX  │───▶│ prescaler  │───▶│ freq_counter │                     │
│        └──────┘    │   /16      │    │  okno 1ms    │                     │
│                    │ (ripple,   │    │  + 2FF sync  │                     │
│                    │  async)    │    └──────┬───────┘                     │
│                    └────────────┘    freq_count[31:0] (* mark_debug *)    │
│                                              │                            │
│                                       ┌──────▼───────┐                    │
│                                       │  rdzen ILA   │ bufor 4096         │
│                                       │ storage qual │ (freq_valid==1)    │
│                                       └──────┬───────┘                    │
└──────────────────────────────────────────────┼──────────────────────────┘
                                                │ JTAG
                                        PC: Hardware Manager
                                        Export CSV -> analysis/ila_*.py -> wykresy
```

**Realna f = `freq_count × 16 kHz`** (prescaler /16, okno 1 ms).

### Tor PS+PL (F5) — DZIAŁA na Zybo (2026-06-16)
Block Design: Zynq PS7 + AXI Interconnect + `osc_axi_system` (AXI4-Lite slave @0x43C00000) → ARM Cortex-A9. **Uruchomiony na realnym Zybo Z7-10** (board files Digilent; skrypty budujące w `arm_zybo/`): ARM czyta `freq_count` przez AXI, zapis `tap`/`osc_select` zmienia odczyt (tap63→162, tap15→291, lut→279 — krótszy ring = wyższa f, ARM steruje ringiem). Weryfikacja przez konsolę XSCT (`mrd 0x43C00000`). UART jako wyświetlanie pominięty (glitch sprzętowy płytki) — pełny tor PS+PL działa. Wcześniej tylko zaprojektowany + bitstream ZedBoard. Opis: `arm_zybo/README.md`.

---

## 3. Moduły Verilog (`oscillator.srcs/sources_1/new/`)

| Plik | Rola | Stan |
|---|---|---|
| `sync_baseline.v` | Licznik WIDTH=4 @125MHz, referencja 7.8 MHz | ✅ na krzemie |
| `async_ro_carry.v` | 64× CARRY4 ring + tap mux, dont_touch/keep | ✅ na krzemie |
| `async_ro_lut.v` | 15× LUT1 inverter ring | ✅ na krzemie |
| `async_ro_loopback.v` | Pętla przez Pmod (zewn. zworka JE1↔JE2) | ✅ na krzemie |
| `freq_counter.v` | Okno 1ms + 2FF synchronizer + licznik zboczy | ✅ |
| `async_prescaler.v` | Ripple /16 (DIV_BITS=4) taktowany ringiem | ✅ |
| `top_system_zybo.v` | **TOP finalny** — warianty+mux+prescaler+counter+ILA hooks | ✅ |
| `freq_counter_axi.v` | AXI4-Lite slave (BD/F5) | ✅ działa na Zybo (ARM/AXI) |
| `osc_axi_system.v` | PL top dla BD (BD/F5) | ✅ działa na Zybo (ARM/AXI) |
| `top_system.v` | Stary top standalone (ZedBoard) | 🕓 archiwum |

### Walka z Vivado (kluczowe do obrony)
- `(* dont_touch="true", keep="true" *)` — na nodach pętli, blokuje wycięcie
- Jawna pętla (`assign feedback = enable & ~pmod_in`) — nie inferencja
- `set_false_path` — wyłączenie analizy timing pętli kombinacyjnej
- `ALLOW_COMBINATORIAL_LOOPS TRUE` — inaczej DRC LUTLP-1 blokuje bitstream
- `CLOCK_DEDICATED_ROUTE FALSE` — pin→BUFG dla loopback/prescalera
- ILA dbg_hub: ścieżka temp <146 znaków → `subst X:` na repo
- Storage qualification (`C_EN_STRG_QUAL`, `MU_CNT≥2`) — capture tylko `freq_valid==1`
- Prescaler /256→/16 — finer rozdzielczość jitteru (8 poziomów zamiast 2)

---

## 4. Tor pomiarowy — dlaczego tak (TDC)

Sygnał async (setki MHz) nie da się odczytać bezpośrednio. Kwantyzujemy:
1. **Prescaler /16** dzieli f w domenie async (ripple taktowany ringiem) → wolny sygnał. Bez tego licznik 125 MHz mierzy max ~62 MHz (Nyquist).
2. **Okno 1 ms** zegarem 125 MHz, **2FF synchronizer** chroni przed metastabilnością.
3. Liczymy zbocza w oknie → liczba = częstotliwość. To **Time-to-Digital Conversion**.
4. **ILA** czyta `freq_count` przez JTAG, 4096 okien (storage-qualified) = pełny rozkład → jitter.

---

## 5. Pomiary i analiza

**Dane:** `measurements/` (realne CSV z ILA). **Skrypty:** `analysis/`.

```bash
cd analysis
# krzywa f(N) + Excel PL (z surowych eksportów ILA):
python3 ila_collect.py ../measurements/carry_16.csv ../measurements/carry_32.csv \
                       ../measurements/carry_48.csv ../measurements/carry_64.csv
python3 plot_fN.py real_fN.csv                      # wykres f(N) + t_d
# histogram jitteru per wariant:
python3 ila_jitter.py ../measurements/carry_16.csv carry_16
python3 ila_jitter.py ../measurements/loop.csv loop
# ... sync, lut, drift (measurements/drift/)
```

Wykresy lądują w `analysis/figures/`. Szczegóły: `analysis/README.md`, plan: `docs/MEASUREMENT_PLAN.md`.

---

## 6. Eksperymenty (deliverables)

| # | Eksperyment | Stan | Wynik |
|---|---|---|---|
| EXP_01 | f(N) krzywa strojenia | ✅ DONE | 134→67 MHz, t_d ≈ 82 ps/stopień |
| EXP_02 | histogram jitteru | ✅ DONE | carry 129–148 ppm |
| EXP_03 | drift termiczny | ⚠️ CZĘŚCIOWO | kierunek OK, efekt poniżej szumu (uczciwie) |
| EXP_04 | f(T) z XADC | ❌ NIE | XADC=PS, Zybo standalone PL — brak |
| EXP_05 | phase locking | ❌ NIE | nie robione |
| EXP_06 | walidacja SDF vs HW | ❌ NIE | SDF wiesza XSim |
| EXP_07 | sync vs async | ✅ DONE | tabela: f, σ, rozrzut LSB |
| F5 | ARM/AXI na Zybo | ✅ DONE | ARM czyta ring przez AXI (XSCT), na krzemie |
| F6 | IO loopback | ✅ DONE | 32.1 MHz przez Pmod |
| TRNG | entropia z jitteru + NIST | ✅ DONE | surowe LSB 5/9; XOR+von Neumann → NIST 9/9 |

Realne liczby pomiarów: `measurements/` + `analysis/`. TRNG: `analysis/trng/REPORT.md`.

---

## 7. Errata / decyzje

- **E1:** Zybo Z7-10 ma 4 SW + 4 LED → SW1:0 = wariant, SW3:2 = tap; piny w `zybo_pins.xdc`
- **E2:** SDF post-impl sim wiesza XSim (comb loop) → mock model behavioral (`tb_ring_mock`)
- **E3:** XDC nie wspiera `for`/`foreach`/`if` → combined get_nets z `||`
- **E4:** 2018.3 = SDK nie Vitis; Export = .hdf
- **E5:** sync 921 ppm to artefakt kwantyzacji (niski freq_count → ±1 LSB), NIE realny jitter → raportujemy σ[kHz] + rozrzut LSB
- **E6:** drift Δf≈30 kHz mieści się w jitterze (σ≈19 kHz) — chip słabo się grzeje przy lekkim obciążeniu

---

## 8. Zakres zrealizowany

Wszystkie warianty oscylatora (CARRY4, LUT, IO-loopback, sync) **działają na krzemie** Zybo Z7-10.
Zrealizowano pełny łańcuch: RTL → bitstream → krzem → pomiar (ILA) → analiza (Python). Dodatkowo
**tor PS+PL z ARM** (odczyt ringu przez AXI4-Lite, `arm_zybo/`) oraz **TRNG z jitteru + testy NIST**
(`analysis/trng/`). Charakterystyki EXP_01 (f(N)), EXP_02 (jitter), EXP_07 (sync vs async) — zmierzone.
Prezentacja: `docs/presentation/prezentacja_koncowa.html` (GitHub Pages: https://mcvicz.github.io/Async-RO-Delay-FPGA/).

### Kierunki rozwoju (możliwe rozszerzenia)
- f(T) z wymuszonym grzaniem (komora termiczna / workload) — kalibracja jako termometr
- PUF na wielu egzemplarzach FPGA (wariacja produkcyjna)
- TRNG z dłuższą akwizycją (pełny NIST STS, ~10⁶ bitów/strumień)
- Phase/injection locking dwóch ringów
