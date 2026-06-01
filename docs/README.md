# docs/ — dokumentacja i dziennik projektu

Folder na bieżąco aktualizowany, commitowany z projektem.

## Pliki

| Plik | Co |
|---|---|
| `PROJECT_GUIDE.md` | Pełna dokumentacja techniczna — architektura, moduły, rejestry AXI, flow budowania, eksperymenty. Główny dokument "jak to działa". |
| `progress-history.md` | Dziennik zmian — chronologia sesji, commity, decyzje. Dopisujemy po każdej sesji. |
| `runbook_02_06_2026.md` | Runbook na spotkanie z Jamro (02.06) — co pokazać, co mówić, pytania. |
| `figures/` | Wykresy (PNG) — przykładowe z danych syntetycznych, do prezentacji/raportu. Zastąpią je realne gdy będą pomiary. |

## Zasada
- Po każdej sesji: dopisz wpis do `progress-history.md`
- Zmiany architektury/modułów: aktualizuj `PROJECT_GUIDE.md`
- Nowy runbook per spotkanie: `runbook_DD_MM_YYYY.md`
- Wykresy/screeny: wrzucaj do `figures/`

## Figures — opis

| Plik | Eksperyment | Pokazuje |
|---|---|---|
| `fig_exp01_fN.png` | EXP_01 | krzywa f(N) 1/N + linearyzacja (t_d≈200ps) |
| `fig_exp02_jitter.png` | EXP_02 | histogram jitteru + dopasowanie Gaussa |
| `fig_exp03_drift.png` | EXP_03 | drift termiczny f(t), stała czasowa τ |
| `fig_exp04_fT.png` | EXP_04 | korelacja f(T), współczynnik temperaturowy |
| `fig_exp07_compare.png` | EXP_07 | jitter sync vs async (skala log) |

**UWAGA:** wykresy z danych SYNTETYCZNYCH (model + szum). Realne pomiary
zastąpią je po uruchomieniu na płytce (`analysis/log_capture.py` → `plot_*.py`).
