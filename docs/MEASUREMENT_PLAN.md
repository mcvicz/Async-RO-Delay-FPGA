# Matryca pomiarów — kampania ILA (Zybo Z7-10)

**Konfiguracja:** prescaler /16, sync WIDTH=4 (7.8MHz), okno 1ms, bufor ILA 4096.
**Realna f = freq_count × 16 kHz.**

Każdy pomiar: ustaw switche → **Run Trigger** (▶) → poczekaj 4096 próbek →
**Export ILA → Format CSV** → zapisz nazwą z tabeli (folder `fpga_project/oscillator/`).

Zapis pozycji: **SW3 SW2 SW1 SW0** (SW1,SW0=wariant; SW3,SW2=tap).

---

## A. f(N) — krzywa strojenia CARRY4 (RDZEŃ, pokazuje że ring działa + tuning)

| # | SW3210 | wariant | tap | stopnie | nazwa CSV | oczekiwane |
|---|--------|---------|-----|---------|-----------|------------|
| 1 | `0001` | carry | 0 | 16 | `carry_16.csv` | f najwyższa (~134 MHz) |
| 2 | `0101` | carry | 1 | 32 | `carry_32.csv` | f spada |
| 3 | `1001` | carry | 2 | 48 | `carry_48.csv` | f spada |
| 4 | `1101` | carry | 3 | 64 | `carry_64.csv` | f najniższa |

→ krzywa f(N): f maleje z liczbą stopni. **+ jitter per tap (każdy ma 4096 próbek).**

## B. Porównanie 4 wariantów (tap=00)

| # | SW3210 | wariant | nazwa CSV | oczekiwane |
|---|--------|---------|-----------|------------|
| 5 | `0000` | sync | `sync.csv` | 7.8 MHz, jitter ~0 (krzysztal) |
| 6 | `0010` | loopback | `loop.csv` | ~33 MHz, jitter wysoki (kabel/IO) |
| 7 | `0011` | lut | `lut.csv` | ring LUT, f i jitter do porównania |

→ tabela EXP_07: sync (stabilny) vs async (carry/lut/loop) — jitter, f.

## C. Drift termiczny (opcja, EXP_03)

| # | SW3210 | kiedy | nazwa CSV |
|---|--------|-------|-----------|
| 8 | `0001` | zaraz po zimnym starcie | `carry_16_cold.csv` |
| 9 | `0001` | po ~5 min pracy | `carry_16_warm.csv` |

→ f spada gdy chip się grzeje (widzieliśmy 142→134 MHz).

---

## Workflow per pomiar
1. Ustaw switche (patrz SW3210)
2. **Run Trigger** (▶ w Status/Waveform)
3. Czekaj "Window sample 4096 of 4096"
4. Waveform → prawym → **Export ILA Data** → **Format: CSV** → nazwa z tabeli
5. (opcja) screenshot zoomu freq_count dla prezentacji

## Po zebraniu — analiza (ja robię)
- `ila_collect.py carry_16.csv carry_32.csv carry_48.csv carry_64.csv` → krzywa f(N) + Excel PL
- `ila_jitter.py <plik> <etykieta>` per wariant → histogramy jitteru
- Tabela porównawcza sync/carry/lut/loop
- Wszystko realne, zero mocków

## Minimum na mocną obronę
A (4 carry) + B (sync+loop+lut) = 7 captów. To daje: f(N) krzywa, jitter wszystkich wariantów, porównanie sync vs async. Drift (C) = bonus.
