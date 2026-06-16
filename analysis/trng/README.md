# TRNG z jitteru ring oscillatora (freq_count)

Pipeline ekstrakcji bitów losowych z **realnych pomiarów jitteru** asynchronicznego ring
oscillatora (kolumna `freq_count[31:0]` w `../../measurements/*.csv`) + zestaw testów losowości.

`measurements/` jest traktowane jako **read-only** — pipeline tylko z niego czyta.

## Skąd entropia

Częstość RO mierzona przez bramkowany licznik (`freq_count`) fluktuuje z pomiaru na pomiar wskutek
**jitteru fazowego/termicznego**. Fluktuacja jest rzędu 1 LSB, więc losowy jest **najmłodszy bit
(bit0)** `freq_count`. Starsze bity kodują wartość średnią częstości (mocno spolaryzowane) i nie są
źródłem entropii — patrz `figures/01_bit_bias_per_position.png`.

## Pliki

| plik | rola |
|---|---|
| `trng_lib.py` | biblioteka: ładowanie CSV, ekstraktory bitów, wszystkie testy losowości |
| `run_trng.py` | pełny pipeline end-to-end → `bits/`, `figures/`, `REPORT.md`, `results.json` |
| `validate_tests.py` | kalibracja known-answer baterii testów (CSPRNG/biased/periodic/const) |
| `REPORT.md` | wygenerowany raport z wynikami |
| `results.json` | pełne wyniki maszynowe |
| `bits/*.bin` | wygenerowane strumienie bitów (spakowane bajty) |
| `bits/*.bits.txt` | podgląd ASCII (pierwsze 4096 bitów) |
| `figures/*.png` | wykresy: bias, jitter, autokorelacja, entropia, heatmapa NIST |

## Uruchomienie

```bash
cd analysis/trng
python3 run_trng.py        # pełny pipeline (wymaga numpy, scipy, matplotlib)
python3 validate_tests.py  # sanity-check implementacji testów (exit 0 = OK)
```

## Ekstraktory bitów

- **raw LSB** — bit0 każdej próbki (surowy, drobny bias).
- **von Neumann** — usuwa bias *dowodliwie* (pary 01→0, 10→1, 00/11→odrzuć); koszt ~75% bitów.
- **XOR-combine** — XOR równoległy bit0 z N niezależnych RO na tym samym indeksie (piling-up:
  resztkowy bias ~ (2p−1)^N).
- **XOR-whitening** — XOR rozłącznych par/grup w jednym strumieniu.

## Testy losowości

Brak zewn. `ent` i NIST STS w środowisku → zaimplementowane w `trng_lib.py`:

- **ent-clone**: entropia bit/bajt, χ² (df=255), średnia arytm., Monte-Carlo π, szeregowy wsp. korelacji.
- **NIST SP800-22 (9)**: monobit, block-frequency, runs, longest-run-of-ones, DFT/spectral,
  approximate-entropy, cumulative-sums (fwd/bwd), serial.
- **własne**: entropia Shannona/bit, min-entropia/bit, autokorelacja (lag 1..32).

p-value liczone `scipy.special` (`erfc`, `gammaincc`=igamc). Konwencja: PASS gdy p ≥ alpha (0.01).

### Uwaga metodyczna

- Strumienie są **krótkie** (RO × 4096 próbek). Pełny NIST STS wymaga ~10⁶ bitów/strumień —
  tutaj wyniki są **orientacyjne** (pola `n/a` gdy n za małe na dany test).
- Entropia bajtowa krótkiej próbki jest **< 8.0** nawet dla idealnego źródła (bias próbkowania).
  Raport podaje kolumnę `ent_id@n` (baseline idealnego CSPRNG dla tej samej liczby bajtów) —
  porównuj `ent` z `ent_id@n`, nie z 8.0. Bias generatora widać w **P(1)/monobit**.
- Do produkcji: dłuższa akwizycja (ciągły zrzut przez AXI/UART zamiast bufora ILA) + conditioner
  kryptograficzny (hash/CBC-MAC, NIST SP800-90B).
