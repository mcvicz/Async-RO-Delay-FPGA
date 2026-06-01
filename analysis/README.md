# Analiza danych pomiarowych (F7-F9)

Skrypty Python do analizy strumienia CSV z ring oscillatora i generacji
wykresow do dokumentacji/prezentacji.

## Schema CSV
```
sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c
```
- `edges` — zbocza zliczone w oknie 1ms (po prescalerze /256)
- `freq_khz` = edges * 256 / 1ms (realna czestotliwosc)
- `variant` — sync | carry | lut | loopback

## Workflow

### Bez plytki (teraz) -- dane syntetyczne
```bash
python3 gen_sample_data.py     # generuje exp0*.csv (model + szum)
python3 plot_fN.py             # EXP_01 krzywa f(N)
python3 plot_jitter.py         # EXP_02 histogram jitteru
python3 plot_drift.py          # EXP_03 drift termiczny
python3 plot_fT.py             # EXP_04 f(T) termometr
python3 compare_sync_async.py  # EXP_07 tabela porownawcza
```

### Z plytka -- realne dane z UART
```bash
python3 log_capture.py --port COM5 --out exp01_fN.csv   # przechwyc CSV
python3 plot_fN.py exp01_fN.csv                          # ten sam skrypt
```
Skrypty plotujace przyjmuja plik jako argument -> dzialaja na danych
syntetycznych I realnych bez zmian.

## Pliki
| Skrypt | Eksperyment | Wynik |
|---|---|---|
| `gen_sample_data.py` | -- | syntetyczne CSV (model fizyczny) |
| `log_capture.py` | -- | przechwytywanie UART (pyserial) |
| `plot_fN.py` | EXP_01 | krzywa f(N), opoznienie stopnia t_d |
| `plot_jitter.py` | EXP_02 | histogram + Gauss, sigma jitteru |
| `plot_drift.py` | EXP_03 | f(t), stala czasowa tau |
| `plot_fT.py` | EXP_04 | wsp. temperaturowy [kHz/C] |
| `compare_sync_async.py` | EXP_07 | tabela sync vs async + wykres |

## Wymagania
```
pip install numpy matplotlib pandas scipy pyserial
```

## UWAGA
Dane z `gen_sample_data.py` sa SYNTETYCZNE (model + szum, staly seed).
Sluzy do testu skryptow i przykladowych wykresow PRZED pomiarami na HW.
Realne pomiary zastapia je gdy bedzie ZedBoard (przez log_capture.py).
Wygenerowane CSV/PNG sa w .gitignore (regenerowalne 1 komenda).
