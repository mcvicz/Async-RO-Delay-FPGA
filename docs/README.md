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
  docs/                       <- ta dokumentacja
    past_versions/            <- przestarzałe (ZedBoard plan, stary runbook, syntetyczne figi)
  analysis/                   <- skrypty ILA + realne wykresy
    figures/                  <- realne histogramy + f(N)
    past_versions/            <- legacy: syntetyczne skrypty/CSV/figi, UART
  measurements/               <- REALNE dane z krzemu (CSV z ILA)
    drift/                    <- pomiary driftu (cold/warm/longer)
    past_versions/old_256/    <- stare pomiary /256
  fpga_project/oscillator/    <- projekt Vivado (RTL, XDC, bitstream)

(poza repo git, w repo/):
  prezka/                     <- prezentacja końcowa (prezentacja_wyniki.html, 32 slajdy)
  past_versions/planning_docs <- stare planowanie (PLAN, STATUS, FAZA_1, instrukcje...)
  _backup_zybo/               <- backup BD/topów sprzed pivotu
```

## Zasada
- Po każdej sesji: wpis do `progress-history.md`
- Zmiany architektury/modułów: aktualizuj `PROJECT_GUIDE.md`
- Realne dane → `measurements/`, wykresy → `analysis/figures/`
- Co stare/nieaktualne, a szkoda wyrzucić → `past_versions/` (nie kasujemy historii)

## Uwaga: prezka poza gitem
`prezka/` i outer foldery są POZA repo git (repo = `Async-RO-Delay-FPGA/`).
Prezentacja jest na dysku, ale niewersjonowana w tym repo.
