# docs/ — dokumentacja i dziennik projektu

Folder na bieżąco aktualizowany, commitowany z projektem.

## Pliki (aktualne)

| Plik | Co |
|---|---|
| `PROJECT_GUIDE.md` | **Główny dokument** — architektura, moduły, tor pomiarowy, eksperymenty, errata. Stan finalny (Zybo + ILA). |
| `RAPORT_STANU.md` | Uczciwy raport: co zrobione / udokumentowane / nie. Realne liczby zweryfikowane z CSV. |
| `MEASUREMENT_PLAN.md` | Matryca pomiarów ILA — które switche, jakie nazwy CSV, oczekiwane wartości. |
| `progress-history.md` | Dziennik zmian — chronologia sesji, commity, decyzje. Dopisujemy po każdej sesji. |

## Struktura repo (gdzie co)

```
Async-RO-Delay-FPGA/          <- repo git
  docs/                       <- ta dokumentacja + ZRODLO GitHub Pages
    index.html                <- landing (redirect na prezentacje)
    presentation/             <- PREZENTACJA koncowa (prezentacja_koncowa.html, 32 slajdy)
      figures/                <- 14 uzywanych obrazow
      past_versions/          <- stara koncepcja (zapowiedz)
    past_versions/            <- przestarzałe (ZedBoard plan, stary runbook, syntetyczne figi)
  analysis/                   <- skrypty ILA + realne wykresy
    figures/                  <- realne histogramy + f(N)
    past_versions/            <- legacy: syntetyczne skrypty/CSV/figi, UART
  measurements/               <- REALNE dane z krzemu (CSV z ILA)
    drift/                    <- pomiary driftu (cold/warm/longer)
    past_versions/old_256/    <- stare pomiary /256
  fpga_project/oscillator/    <- projekt Vivado (RTL, XDC, bitstream)

(poza repo git, w repo/ — historia, nie wersjonowane):
  prezka/                     <- stara robocza kopia prezki (kanon jest w docs/presentation/)
  past_versions/planning_docs <- stare planowanie (PLAN, STATUS, FAZA_1, instrukcje...)
  _backup_zybo/               <- backup BD/topów sprzed pivotu
```

## GitHub Pages
Prezentacja hostowana: **https://mcvicz.github.io/Async-RO-Delay-FPGA/**
(źródło: branch `mcvicz`, folder `/docs`, `.nojekyll`). Edycja → `docs/presentation/`.

## Zasada
- Po każdej sesji: wpis do `progress-history.md`
- Zmiany architektury/modułów: aktualizuj `PROJECT_GUIDE.md`
- Realne dane → `measurements/`, wykresy → `analysis/figures/`
- Prezentacja → `docs/presentation/` (NIE stara `repo/prezka/`)
- Co stare/nieaktualne, a szkoda wyrzucić → `past_versions/` (nie kasujemy historii)
