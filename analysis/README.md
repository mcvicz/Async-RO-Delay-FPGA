# Analiza danych pomiarowych (realne, z ILA)

Skrypty Python do analizy realnych eksportów ILA z ring oscillatora i generacji
wykresów. **Zero mocków — wszystko z krzemu (Zybo Z7-10).**

Dane wejściowe: `../measurements/` (surowe CSV z Hardware Manager).
Wykresy wyjściowe: `figures/`.

---

## Skąd dane

Pomiar: ILA na sygnale `freq_count` przez JTAG, storage-qualified (`freq_valid==1`),
4096 okien po 1 ms. Export z Vivado Hardware Manager: **Export ILA Data → Format CSV**.

Format surowego CSV ILA: kolumny `freq_count`, `freq_valid`, `dbg_sw_mode`,
`dbg_sw_tap` (wartości **hex**). **Realna f = `freq_count × 16 kHz`** (prescaler /16).

> Uwaga: `freq_count` bywa np. `000001e8` — pandas próbuje czytać jako scientific
> notation (1e8). Dlatego skrypty czytają `dtype=str` i konwertują z hex ręcznie.

---

## Skrypty (aktualne)

| Skrypt | Co robi | Wynik |
|---|---|---|
| `ila_jitter.py <csv> [etykieta]` | statystyka rozkładu freq_count = jitter | `figures/fig_jitter_<etykieta>.png` + σ/ppm na stdout |
| `ila_collect.py <csv1> <csv2> ...` | zbiera punkty f(N) z wielu captów | `real_fN.csv` (przecinki) + `real_fN_excelPL.csv` (PL Excel) |
| `ila_to_freq.py <csv>` | parser pojedynczego captu, szybki podgląd f | stdout |
| `plot_fN.py real_fN.csv` | krzywa f(N) + linearyzacja t_d | `figures/fig_exp01_fN.png` |

`real_fN.csv` ma schema analizy (`sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c`),
więc `plot_fN.py` czyta go wprost.

---

## Workflow (od zera)

```bash
cd analysis

# 1. krzywa f(N) z 4 captów carry (16/32/48/64 stopni)
python3 ila_collect.py ../measurements/carry_16.csv ../measurements/carry_32.csv \
                       ../measurements/carry_48.csv ../measurements/carry_64.csv
python3 plot_fN.py real_fN.csv

# 2. histogram jitteru per wariant
python3 ila_jitter.py ../measurements/carry_16.csv carry_16
python3 ila_jitter.py ../measurements/sync.csv     sync
python3 ila_jitter.py ../measurements/loop.csv     loop
python3 ila_jitter.py ../measurements/lut.csv      lut

# 3. drift termiczny (te same skrypty, dane z measurements/drift/)
python3 ila_jitter.py ../measurements/drift/carry_16_cold.csv        cold
python3 ila_jitter.py ../measurements/drift/carry_16_warm.csv        warm
python3 ila_jitter.py ../measurements/drift/carry_16_warm_longer.csv longer
```

---

## Wyniki (`figures/`)

| Plik | Pokazuje |
|---|---|
| `fig_exp01_fN.png` | krzywa f(N): 134→67 MHz, t_d ≈ 82 ps/stopień |
| `fig_jitter_carry_16/32/48/64.png` | jitter carry per tap (129–148 ppm) |
| `fig_jitter_sync.png` | sync referencja (jitter poniżej rozdzielczości) |
| `fig_jitter_loop.png` | loopback 32 MHz |
| `fig_jitter_lut.png` | LUT ring 113 MHz |
| `fig_jitter_cold/warm/longer.png` | drift termiczny (Δf poniżej szumu) |

Te same PNG (skopiowane) są w prezce: `prezka/figures/`.

---

## `past_versions/` — legacy (NIE używać do wyników)

Stary flow z **danych syntetycznych** + UART (sprzed pivotu na ILA):
- `scripts/` — `gen_sample_data.py`, `plot_jitter.py`, `plot_drift.py`, `plot_fT.py`,
  `compare_sync_async.py`, `log_capture.py`
- `synthetic_csv/` — `exp0*.csv` (model + szum, NIE realne)
- `synthetic_fig/` — `fig_exp0*.png` (z danych syntetycznych)
- `old_figures/` — zdublowane/stare histogramy (/256, inne nazwy)

Trzymane tylko jako historia. Realne wyniki = `figures/` + `../measurements/`.
