# docs/ — dokumentacja projektu

## Pliki

| Plik | Zawartość |
|---|---|
| `PROJECT_GUIDE.md` | Główny dokument techniczny — architektura, moduły, tor pomiarowy, eksperymenty, errata. |
| `MEASUREMENT_PLAN.md` | Matryca pomiarów ILA — ustawienia przełączników, nazwy plików CSV, oczekiwane wartości. |
| `progress-history.md` | Chronologia prac (dziennik zmian). |
| `presentation/` | Prezentacja końcowa (HTML) — źródło GitHub Pages. |

## Struktura repozytorium

```
Async-RO-Delay-FPGA/
  docs/                       dokumentacja + źródło GitHub Pages
    index.html                  landing (przekierowanie do prezentacji)
    presentation/               prezentacja końcowa (prezentacja_koncowa.html)
  analysis/                   skrypty analizy (ILA) + wykresy (figures/) + TRNG (trng/)
  measurements/               dane pomiarowe z krzemu (CSV z ILA), drift/
  arm_zybo/                   tor PS+PL: ARM czyta ring przez AXI4-Lite (skrypty + opis)
  fpga_project/oscillator/    projekt Vivado (RTL, XDC, Block Design, bitstream)
```

Starsze/nieaktualne wersje plików przechowywane są w podkatalogach `past_versions/`.

## GitHub Pages

Prezentacja hostowana: **https://mcvicz.github.io/Async-RO-Delay-FPGA/**
(źródło: gałąź `mcvicz`, katalog `/docs`, `.nojekyll`).
