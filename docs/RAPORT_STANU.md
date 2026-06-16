# Raport stanu projektu — Async Ring Oscillator FPGA

**Data:** 2026-06-15 · Autorzy: Paweł Michalcewicz, Krzysztof Podoba · Prowadzący: dr inż. Jamro
**Cel raportu:** uczciwa ocena co zrobione, co udokumentowane, co NIE — bez ściemniania.

---

## 1. Co DZIAŁA i jest zweryfikowane (twarde fakty)

| Element | Stan | Dowód |
|---|---|---|
| CARRY4 ring na krzemie | ✅ działa | bitstream Zybo, LED demo, ILA capture |
| LUT1 ring | ✅ działa | zmierzone 112.7 MHz |
| IO-loopback przez Pmod | ✅ działa | zmierzone 32.1 MHz, kabelek JE1↔JE2 |
| sync baseline (referencja) | ✅ działa | 7.81 MHz |
| prescaler /16 (pokonanie Nyquista) | ✅ działa | sym + realny pomiar |
| freq_counter (TDC, okno 1 ms) | ✅ działa | sym + ILA |
| Pomiar przez ILA over JTAG | ✅ działa | 4096 okien × 7 wariantów |
| Symulacje behawioralne (4 tb) | ✅ działa | 7 waveformów |
| Block Design AXI4-Lite + ARM | ✅ **działa na Zybo** | ARM czyta freq_count przez AXI (XSCT), tap/osc_select sterują ringiem |
| TRNG + testy NIST | ✅ działa | surowe LSB 5/9; XOR+von Neumann → NIST 9/9 (`analysis/trng/`) |

### Realne liczby (zweryfikowane ze skryptem na CSV 2026-06-15)
| Wariant | f [MHz] | σ [kHz] | jitter |
|---|---|---|---|
| carry 16 stopni | 134.374 | 17.3 | 129 ppm |
| carry 32 | 116.778 | 16.1 | 137 ppm |
| carry 48 | 83.815 | 11.8 | 141 ppm |
| carry 64 | 66.600 | 9.8 | 148 ppm |
| sync | 7.812 | 7.2 | (kwantyzacja, nie ppm) |
| loopback | 32.142 | 6.2 | — |
| lut | 112.689 | 16.7 | 149 ppm |

Każda liczba w prezentacji **zgadza się** z tymi danymi. Wszystkie z 4096 okien po 1 ms.

---

## 2. Co zrobione przez fazy

| Faza | Zadanie | Stan |
|---|---|---|
| F1 | sync baseline | ✅ DONE |
| F2 | CARRY4 ring + tap | ✅ DONE |
| F2.5 | LUT ring | ✅ DONE |
| F3 | symulacje behawioralne | ✅ DONE (mock, bo SDF wiesza XSim) |
| F4 | freq_counter + prescaler | ✅ DONE (sym + krzem) |
| F5 | Block Design AXI + ARM | ✅ DONE na Zybo (ARM czyta ring przez AXI, XSCT; UART display glitch pominięty) |
| F6 | IO loopback | ✅ DONE (na krzemie) |
| F7 | pomiary f(N), jitter | ✅ DONE (kampania ILA) |
| TRNG | entropia jitteru + NIST | ✅ DONE (raw 5/9 → XOR/von Neumann 9/9; strumienie krótkie → orientacyjnie) |
| F8 | drift termiczny | ⚠️ CZĘŚCIOWO (kierunek OK, efekt poniżej szumu — uczciwie w prezce) |
| F8 | f(T) z XADC | ❌ NIE zrobione (XADC = PS, na Zybo standalone PL brak) |
| F8 | phase locking | ❌ NIE zrobione |
| EXP_06 | walidacja SDF vs HW | ❌ NIE zrobione (SDF wiesza XSim) |
| F9 | raport końcowy PDF | ❌ NIE ma (prezentacja = deliverable) |

---

## 3. Prezentacja — `docs/presentation/prezentacja_koncowa.html` (36 slajdów)

**Stan: kompletna, spójna z danymi, 0 placeholderów. Na GitHub Pages: https://mcvicz.github.io/Async-RO-Delay-FPGA/**

Struktura: Teoria → Architektura → Pomiar+BD → Symulacje → Wyniki z krzemu → **F5 ARM na żywo (12-14)** → **TRNG+NIST (30-31)** → tabela/wnioski.

Pokrycie:
- ✅ wszystkie 4 warianty oscylatora opisane + zdiagramowane
- ✅ wszystkie 4 testbenche pokazane (7 waveformów, jeden na slajd)
- ✅ realne wyniki: f(N), jitter, drift, sync-vs-async, loopback
- ✅ ILA capture na żywo + foto płytki + Device View + Block Design
- ✅ uczciwe noty: drift poniżej szumu, ppm myli przy niskim freq_count, AXI nie odpalony na Zybo

**Uwaga (uczciwie):** prezka leży POZA repo git (`repo/prezka/`, repo = `Async-RO-Delay-FPGA/`). NIE jest wersjonowana. Bezpieczna na dysku.

---

## 4. PROBLEM: dokumentacja .md NIESPÓJNA

To największy realny mankament. Część docs opisuje STARY stan (ZedBoard, /256, ~65%) jakby był aktualny:

| Plik | Stan | Problem |
|---|---|---|
| `docs/progress-history.md` | ✅ AKTUALNY | pełna chronologia do sesji 5 |
| `docs/MEASUREMENT_PLAN.md` | ✅ AKTUALNY | Zybo, /16, kampania ILA |
| `docs/PROJECT_GUIDE.md` | ❌ PRZESTARZAŁY | mówi ZedBoard, prescaler /256, ~65%, F6 placeholder, AXI @0x43C00000 jako główny tor |
| `docs/HW_CHECKLIST.md` | ❌ PRZESTARZAŁY | procedura ZedBoard/SDK/UART która się NIE wydarzyła (poszło Zybo+ILA) |
| `docs/README.md` | ❌ PRZESTARZAŁY | mówi że figury są syntetyczne, t_d≈200ps |
| `analysis/README.md` | ❌ PRZESTARZAŁY | schema CSV `sample,timestamp,variant...` + UART; realny flow ILA jest inny |
| `docs/runbook_02_06_2026.md` | 🕓 HISTORYCZNY | runbook na spotkanie 02.06, ~65% — OK jako datowany |

**Skutek:** ktoś czytający PROJECT_GUIDE pomyśli że projekt jest na ZedBoard z /256 na 65%. Realnie: Zybo, /16, pomiary zrobione. **Sprzeczność.**

---

## 5. Bałagan w `analysis/` (kosmetyka)

Współistnieją dwa komplety:
- **STARE syntetyczne:** `exp01_fN.csv`...`exp07_*.csv`, `fig_exp0*.png`, `gen_sample_data.py`, `plot_*.py` (schema /256, dane z modelu+szum)
- **NOWE realne:** `carry_*.csv`, `sync/loop/lut.csv`, `real_fN*.csv`, `fig_jitter_*.png`, `ila_*.py`

Prezka używa REALNYCH. Stare syntetyczne leżą obok — mylące, ale nieszkodliwe. Też sporo `fig_jitter_*` duplikatów z różnych przebiegów (test_16, cold, warm, longer, tap15...).

---

## 6. Co bym poprawił przed obroną (priorytety)

1. **[WAŻNE] Zaktualizować `PROJECT_GUIDE.md`** na stan finalny (Zybo, /16, ILA, pomiary done, ~95%). Inaczej dokumentacja kłamie względem prezki.
2. **[WAŻNE] Zaktualizować `analysis/README.md`** — opisać realny flow ILA (CSV hex freq_count, ila_jitter.py, /16), oznaczyć stare skrypty jako „syntetyczne/legacy".
3. **[ŚREDNIE] `HW_CHECKLIST.md` i `docs/README.md`** — albo update na Zybo/ILA, albo oznaczyć „[ARCHIWALNE — ZedBoard plan]".
4. **[OPCJA] Posprzątać `analysis/`** — przenieść syntetyczne `exp0*` + stare figi do `_legacy/`.
5. **[OPCJA] Wersjonować prezkę** — `git init` w `repo/` albo skopiować do repo projektu.
6. **[OPCJA] f(T) z XADC** — wymaga PS na Zybo (port BD) → realnie odpuścić, jest uczciwie opisane jako niezrobione.

---

## 7. Werdykt całościowy — szczerze

**Mocne:**
- Rdzeń projektu (async ring bez LUT) **działa na realnym krzemie** — to jest sedno i jest zrobione.
- Pomiary realne, zweryfikowane, zero mocków w danych. Liczby się zgadzają.
- **F5 ARM/AXI uruchomiony na Zybo** — ARM czyta ring przez AXI4-Lite na krzemie (XSCT). Wcześniej tylko zaprojektowany.
- **TRNG + testy NIST** — entropia z jitteru, uczciwa analiza (raw 5/9 → XOR/von Neumann 9/9).
- Prezentacja solidna (36 slajdów), kompletna, uczciwa, na GitHub Pages.

**Słabe (uczciwie):**
- f(T) / phase locking / SDF-vs-HW — niezrobione (część niemożliwa: SDF wiesza, XADC wymaga PL XADC).
- Drift termiczny słabo widoczny (poniżej szumu) — przyznane.
- **UART display nie działał** (glitch sprzętowy płytki) — pełny tor PS+PL działa, weryfikacja przez XSCT zamiast terminala.
- ARM uruchomiony w osobnym buildzie (inny placement/zegar niż ILA) → liczby ARM ≠ liczby f(N); pokazywane względnie, nie zestawiane.
- TRNG: strumienie krótkie (1k–28k bit ≪ NIST ~10⁶) → p-value orientacyjne, nie rozstrzygające.
- Brak raportu końcowego PDF (prezka go zastępuje).

**Czy coś „oszukane":** NIE. Dane realne, ograniczenia opisane wprost — także na slajdach. Dokumentacja zaktualizowana do stanu finalnego (06-16).
