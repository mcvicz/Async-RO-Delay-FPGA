# Matryca pomiarów — kampania ILA (Zybo Z7-10)

**Konfiguracja:** prescaler /16, sync WIDTH=4 (7.8 MHz), okno 1 ms, bufor ILA 4096.
**Częstotliwość rzeczywista: f = freq_count × 16 kHz.**

Procedura pojedynczego pomiaru: ustawienie przełączników → **Run Trigger** → odczekanie na 4096 próbek
→ **Export ILA → Format CSV** → zapis pod nazwą z tabeli (`measurements/`, drift w `measurements/drift/`).

Konwencja pozycji przełączników: **SW3 SW2 SW1 SW0** (SW1,SW0 = wariant; SW3,SW2 = tap).

---

## A. f(N) — krzywa strojenia CARRY4

| # | SW3210 | wariant | tap | stopnie | plik CSV | oczekiwane |
|---|--------|---------|-----|---------|----------|------------|
| 1 | `0001` | carry | 0 | 16 | `carry_16.csv` | f najwyższa (~134 MHz) |
| 2 | `0101` | carry | 1 | 32 | `carry_32.csv` | f maleje |
| 3 | `1001` | carry | 2 | 48 | `carry_48.csv` | f maleje |
| 4 | `1101` | carry | 3 | 64 | `carry_64.csv` | f najniższa (~67 MHz) |

Wynik: krzywa f(N) malejąca z liczbą stopni; dodatkowo jitter per tap (każdy capture = 4096 próbek).

## B. Porównanie czterech wariantów (tap=00)

| # | SW3210 | wariant | plik CSV | oczekiwane |
|---|--------|---------|----------|------------|
| 5 | `0000` | sync | `sync.csv` | 7.8 MHz, jitter na granicy rozdzielczości (kryształ) |
| 6 | `0010` | loopback | `loop.csv` | ~32 MHz, jitter wyższy (kabel/IO) |
| 7 | `0011` | lut | `lut.csv` | ~113 MHz, do porównania jittera i f |

Wynik: tabela EXP_07 — sync (stabilny) vs async (carry/lut/loop): f, σ, rozrzut.

## C. Drift termiczny (EXP_03)

| # | SW3210 | moment | plik CSV |
|---|--------|--------|----------|
| 8 | `0001` | zaraz po zimnym starcie | `carry_16_cold.csv` |
| 9 | `0001` | po ~5 min pracy | `carry_16_warm.csv` |

Wynik: kierunek zmiany f z temperaturą (przy lekkim obciążeniu Δf mieści się w jitterze — patrz analiza).

---

## Procedura per pomiar
1. Ustawienie przełączników (kolumna SW3210).
2. **Run Trigger** (w oknie Status/Waveform).
3. Oczekiwanie na "Window sample 4096 of 4096".
4. Waveform → prawy przycisk → **Export ILA Data** → **Format: CSV** → nazwa z tabeli.
5. Opcjonalnie: zrzut ekranu zoomu `freq_count` do dokumentacji.

## Analiza zebranych danych
- `ila_collect.py ../measurements/carry_16.csv ../measurements/carry_32.csv ../measurements/carry_48.csv ../measurements/carry_64.csv` → krzywa f(N) + CSV dla Excela (PL)
- `ila_jitter.py ../measurements/<plik>.csv <etykieta>` → histogram jittera per wariant (do `figures/`)
- Tabela porównawcza sync / carry / lut / loop

## Minimalny zestaw pomiarów
A (4× carry) + B (sync + loop + lut) = 7 captures. Daje: krzywą f(N), jitter wszystkich wariantów,
porównanie sync vs async. Drift (C) jest rozszerzeniem.
