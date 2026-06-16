# Raport TRNG — ring oscillator (jitter freq_count)

Pipeline: `analysis/trng/run_trng.py` + `trng_lib.py`. Dane wejściowe: `measurements/*.csv` (read-only).

Poziom istotności NIST: **alpha = 0.01** (PASS gdy p ≥ alpha; FAIL gdy p < alpha).


## 1. Źródło entropii

Jitter RO ujawnia się w **najmłodszym bicie (LSB, bit0)** `freq_count`. Starsze bity kodują wartość średnią częstości i są mocno spolaryzowane (patrz `figures/01_bit_bias_per_position.png`) — nie są używane.


### Bias LSB per źródło

| źródło | n | P(1) | klasa |
|---|---:|---:|---|
| `carry_16` | 4096 | 0.4902 | good |
| `carry_32` | 4096 | 0.5054 | good |
| `carry_48` | 4096 | 0.4868 | good |
| `carry_64` | 4096 | 0.4912 | good |
| `loop` | 4096 | 0.8347 | poor |
| `lut` | 4096 | 0.4946 | good |
| `sync` | 4096 | 0.2812 | poor |
| `drift__carry_16_cold` | 4096 | 0.4995 | good |
| `drift__carry_16_warm` | 4096 | 0.4890 | good |
| `drift__carry_16_warm_longer` | 4096 | 0.5007 | good |

Źródła **good** (|P(1)-0.5| ≤ 0.02) użyte do puli i XOR-combine: `carry_16`, `carry_32`, `carry_48`, `carry_64`, `lut`.


> **Uwaga:** klasa „good” to przesiew **wyłącznie po biasie I rzędu** (P(1)). NIE gwarantuje braku korelacji strukturalnej — patrz testy strukturalne w sekcji 3 (niektóre źródła „good” oblewają block_frequency/approx_entropy/serial). Pełna kwalifikacja źródła TRNG (NIST SP800-90B) ocenia też zależności szeregowe.


## 2. Strumienie i wyniki testów

Metryki ent (ideały): entropia 8.0 bit/bajt, średnia 127.5, korelacja szeregowa 0.0, błąd π → 0%.


> **UWAGA o entropii bajtowej.** Dla krótkich strumieni entropia bajtowa idealnego źródła jest **< 8.0** z powodu biasu próbkowania (256 symboli, mało zliczeń/symbol) — to NIE jest bias generatora. Dlatego w tabeli podaję kolumnę `ent_id@n` = oczekiwana entropia IDEALNEGO CSPRNG dla tej samej liczby bajtów (baseline; `trng_lib.expected_byte_entropy`). Oceniaj `ent` względem `ent_id@n`, nie względem 8.0. Bias generatora widać w **P(1)/monobit**, nie w entropii bajtowej krótkiej próbki.


| strumień | n_bits | P(1) | H_shannon | H_min | ent[b/B] | ent_id@n | χ² p | scc | π err% | NIST PASS |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `raw_lsb__carry_16` | 4096 | 0.4902 | 0.9997 | 0.9721 | 7.5239 | 7.5854 | 0.007 | -0.0625 | 1.86 | 9/9 |
| `raw_lsb__carry_32` | 4096 | 0.5054 | 0.9999 | 0.9846 | 7.6239 | 7.5854 | 0.857 | -0.0465 | 9.35 | 9/9 |
| `raw_lsb__carry_48` | 4096 | 0.4868 | 0.9995 | 0.9625 | 7.5611 | 7.5854 | 0.352 | +0.0739 | 0.36 | 8/9 |
| `raw_lsb__carry_64` | 4096 | 0.4912 | 0.9998 | 0.9749 | 7.5439 | 7.5854 | 0.118 | +0.1274 | 8.63 | 5/9 |
| `raw_lsb__loop` | 4096 | 0.8347 | 0.6468 | 0.2606 | 4.8630 | 7.5854 | 0.000 | +0.1478 | 86.52 | 0/9 |
| `raw_lsb__lut` | 4096 | 0.4946 | 0.9999 | 0.9846 | 7.6037 | 7.5854 | 0.594 | -0.0081 | 10.12 | 9/9 |
| `raw_lsb__sync` | 4096 | 0.2812 | 0.8571 | 0.4764 | 2.0000 | 7.5854 | 0.000 | -0.4371 | 27.32 | 0/9 |
| `raw_lsb__drift__carry_16_cold` | 4096 | 0.4995 | 1.0000 | 0.9986 | 7.6165 | 7.5854 | 0.679 | +0.0159 | 6.35 | 9/9 |
| `raw_lsb__drift__carry_16_warm` | 4096 | 0.4890 | 0.9997 | 0.9686 | 7.6149 | 7.5854 | 0.594 | -0.0018 | 10.85 | 8/9 |
| `raw_lsb__drift__carry_16_warm_longer` | 4096 | 0.5007 | 1.0000 | 0.9979 | 7.6112 | 7.5854 | 0.784 | -0.0999 | 3.36 | 9/9 |
| `pool_good_raw` | 20480 | 0.4937 | 0.9999 | 0.9818 | 7.9194 | 7.9251 | 0.184 | +0.0186 | 0.77 | 6/9 |
| `pool_all_raw` | 28672 | 0.5120 | 0.9996 | 0.9657 | 7.4655 | 7.9471 | 0.000 | +0.2374 | 7.44 | 0/9 |
| `xor_combine_good` | 4096 | 0.5049 | 0.9999 | 0.9860 | 7.5840 | 7.5854 | 0.453 | -0.0618 | 7.85 | 9/9 |
| `vn_pool_good` | 5084 | 0.5108 | 0.9997 | 0.9691 | 7.6442 | 7.6743 | 0.169 | -0.0629 | 9.05 | 9/9 |
| `vn_xor_good` | 1038 | 0.5154 | 0.9993 | 0.9562 | 6.4820 | 6.5576 | 0.250 | -0.1017 | 3.07 | 9/9 |
| `xorw_pool_good` ⭐ | 10240 | 0.4965 | 1.0000 | 0.9899 | 7.8738 | 7.8457 | 0.969 | -0.0054 | 4.01 | 9/9 |

## 3. Szczegóły NIST per strumień (p-value)

| strumień | monobit | block_frequency | runs | longest_run | dft_spectral | approx_entropy | cusum_fwd | cusum_bwd | serial |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `raw_lsb__carry_16` | 0.211✓ | 0.597✓ | 0.667✓ | 0.557✓ | 0.039✓ | 0.642✓ | 0.422✓ | 0.229✓ | 0.650✓ |
| `raw_lsb__carry_32` | 0.492✓ | 0.320✓ | 0.135✓ | 0.048✓ | 0.841✓ | 0.173✓ | 0.601✓ | 0.251✓ | 0.180✓ |
| `raw_lsb__carry_48` | 0.092✓ | 0.000✗ | 0.216✓ | 0.341✓ | 0.931✓ | 0.014✓ | 0.094✓ | 0.067✓ | 0.014✓ |
| `raw_lsb__carry_64` | 0.261✓ | 0.000✗ | 0.218✓ | 0.554✓ | 0.510✓ | 0.000✗ | 0.073✓ | 0.003✗ | 0.000✗ |
| `raw_lsb__loop` | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ |
| `raw_lsb__lut` | 0.492✓ | 0.294✓ | 0.386✓ | 0.877✓ | 0.606✓ | 0.778✓ | 0.546✓ | 0.507✓ | 0.772✓ |
| `raw_lsb__sync` | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ |
| `raw_lsb__drift__carry_16_cold` | 0.950✓ | 0.962✓ | 0.248✓ | 0.857✓ | 0.510✓ | 0.833✓ | 0.984✓ | 0.962✓ | 0.836✓ |
| `raw_lsb__drift__carry_16_warm` | 0.160✓ | 0.046✓ | 0.826✓ | 0.008✗ | 0.528✓ | 0.068✓ | 0.166✓ | 0.292✓ | 0.069✓ |
| `raw_lsb__drift__carry_16_warm_longer` | 0.925✓ | 0.602✓ | 0.617✓ | 0.675✓ | 0.931✓ | 0.865✓ | 0.858✓ | 0.775✓ | 0.867✓ |
| `pool_good_raw` | 0.069✓ | 0.000✗ | 0.045✓ | 0.046✓ | 1.000✓ | 0.000✗ | 0.091✓ | 0.099✓ | 0.000✗ |
| `pool_all_raw` | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ | 0.000✗ |
| `xor_combine_good` | 0.532✓ | 0.758✓ | 0.233✓ | 0.513✓ | 0.218✓ | 0.733✓ | 0.587✓ | 0.601✓ | 0.736✓ |
| `vn_pool_good` | 0.123✓ | 0.891✓ | 0.469✓ | 0.178✓ | 0.153✓ | 0.238✓ | 0.239✓ | 0.045✓ | 0.244✓ |
| `vn_xor_good` | 0.321✓ | 0.549✓ | 0.367✓ | 0.877✓ | 0.159✓ | 0.712✓ | 0.344✓ | 0.579✓ | 0.683✓ |
| `xorw_pool_good` | 0.477✓ | 0.088✓ | 0.809✓ | 0.266✓ | 0.468✓ | 0.290✓ | 0.333✓ | 0.510✓ | 0.290✓ |

## 4. Rekomendacja

Najwięcej PASS przy największej przepływności: **`xorw_pool_good`** (NIST 9/9, H_min=0.9899 bit/bit, ent=7.8738 bit/bajt, n=10240 bitów).


> **Do zastosowań kryptograficznych** rekomenduję jednak **`vn_pool_good` / `vn_xor_good` (von Neumann)** — daje *dowodliwie* nieobciążone wyjście niezależnie od wyniku testów empirycznych, kosztem ~75% bitów. `xorw_*`/`xor_combine_*` (wybielanie/piling-up) przechodzą testy i są wydajniejsze, ale gwarancja jest statystyczna, nie strukturalna. Najlepsza praktyka produkcyjna: **XOR-combine niezależnych RO → von Neumann → (opcjonalnie) hash/CBC-MAC jako conditioner** (NIST SP800-90B).


**Wnioski metodyczne:**

- **Bias vs struktura.** Wszystkie źródła „good” **przechodzą monobit** (P(1)≈0.49–0.50, brak istotnego biasu I rzędu przy n=4096). Słabość surowych LSB jest **strukturalna**, nie biasowa: 
  `carry_48` oblewa block_frequency; `carry_64` oblewa block_frequency, approx_entropy, serial → resztkowa **korelacja krótkozasięgowa** (autokorelacja), a NIE bias.
  Najwyższa autokorelacja wśród źródeł good: `carry_64` (max|r|=0.104).

- **Post-processing usuwa OBA defekty.** **XOR-combine** niezależnych RO dekoreluje (różne fizycznie oscylatory) i redukuje bias (piling-up ~(2p−1)^N); **von Neumann** usuwa bias *dowodliwie* (koszt ~75% bitów). Stąd `xor_combine_*`/`vn_*` → NIST 9/9, podczas gdy surowe `carry_64` ma 5/9.

- **Konkatenacja nie naprawia struktury.** `pool_good_raw` (zwykłe sklejenie źródeł good) daje NIST 6/9 — gorzej niż XOR/von Neumann. Łączenie źródeł wymaga **conditioningu** (XOR/dekorelacja), nie prostej konkatenacji.

- **Mała liczba bitów.** Strumienie mają 1k–28k bitów; twarde minima per-test w kodzie (np. longest_run n≥128, DFT n≥100) są spełnione przez wszystkie strumienie, więc nie pojawia się `n/a`. Jednak **wszystkie** są daleko poniżej zalecanych przez NIST STS ~10^6 bitów/strumień → **p-value są orientacyjne, nie rozstrzygające**. Do produkcji: dłuższa akwizycja (ciągły zrzut przez AXI/UART zamiast bufora ILA).

- `loop` i `sync` mają zbyt mały jitter (range 1–2 LSB) → odrzucone jako źródła.


## 5. Pliki

- `bits/*.bin` — spakowane strumienie (binarnie), `bits/*.bits.txt` — podgląd ASCII.

- `figures/01..05_*.png` — wykresy (bias, jitter, autokorelacja, entropia, heatmapa NIST).

- `results.json` — pełne wyniki maszynowe.

