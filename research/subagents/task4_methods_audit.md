# Task 4 (subagent) — Methods audit / power check

Agent run 2026-09-14. Note: Fornazieri 2019's exact enrolled N not confirmed (grant abstract says "fifty pregnant women"; published N unknown).

## Methods table

| Study | N preg / N ctrl | Design | Trimesters separated? | Controls matched? | Validated test? | Test odors (food-salient) | Prereg? |
|---|---|---|---|---|---|---|---|
| Luvara & Murizi 1961 | 47 total (14–21/session; repeated) / 0 NP ctrl | Cross-sectional + within-subject longitudinal, postpartum | Y (across pregnancy + postpartum) | N (no non-pregnant controls) | Custom (blast-injection olfactometer) | Anise, musk ketone, carnation, citral (partial) | Unknown (pre-reg era) |
| Gilbert & Wysocki 1991 | 13,610 / 277,228 | Cross-sectional survey (National Geographic Smell Survey) | N (gestational age not specified) | No matching reported; huge NP reference | Survey + 6 "scratch-and-sniff" odors; self-rated olfaction | Isoamyl acetate, eugenol(clove), rose, mercaptans, galaxolide, androstenone (partial) | N |
| Laska 1996 | 20 / 20 | Longitudinal (all 3 trimesters + postpartum) | Y | Not reported as matched | Custom: n-butanol ascending staircase; 12-odor ID/intensity/hedonics | n-butanol, clove, aniseed, perfume, citronelle, peanut, Chanel No.5, linalool, etc. (some food) | N |
| Kölble 2001 | 53 / 59 | Cross-sectional (1st trimester only) | N (first trimester only) | Not reported matched | Sniffin' Sticks (SST) OT/OD/OID + VAS | SST standard (n-butanol) + 10 common odors (deodorant, bacon, clove, coffee, androstenone, acetic acid, rum, peanut butter, chocolate) (yes) | N |
| Savovic 2002 | 20 / 20 | Cross-sectional (1st trimester) | N | Not reported matched | Custom (Fortunato–Niccolini air-dilution olfactometer) | Anethol, vanillin, PEA, citral, menthol, pyridine (partial) | N |
| Nordin 2004 | 144 / 76 | Longitudinal questionnaire | Y (gw 13–16 & 31–34 + postpartum) | Yes — NP women with corresponding time intervals | Survey (self-report only) | 14 odors incl. cooking, cigarette smoke, spoiled food, perfume, spices, coffee (yes) | N |
| Fessler, Eng & Navarrete 2005 | 496 / 0 NP | Cross-sectional (disgust, not olfaction) | Y (T1 vs T2/T3 compared) | N (pregnant-only sample) | Disgust Scale (validated psychometric, not olfactory) | None (no odors) | N |
| Olofsson 2005 | 15 / 15 | Cross-sectional (ERP) | N (single session) | Not reported matched | Custom chemosensory ERP + psychophysics | Pyridine (mixed olfactory/trigeminal) | N |
| Cameron 2014 (Chem Senses) | 20 long. / 22 NP long.; 17 / 32 cross-sec. | Longitudinal + cross-sectional | Y | Partly (NP women + men) | Custom PEA staircase (Doty 2000 protocol) + 75-trial signal detection | PEA (rose) — non-food | N |
| Kwon 2025 (w/ Fessler) | 58 / 0 NP | Cohort (early preg 5–17 wk), questionnaire + plasma cytokines | Y (early pregnancy) | N (no non-pregnant controls) | Custom structured questionnaire (validated aversion/NVP items); no olfactory test | Tobacco smoke, meat (food-salient aversion list) (yes) | Not stated |
| Muluh 2024 (meta) | 20 studies pooled; per-study Ns vary | Meta-analysis (PROSPERO) | Y (by trimester + postpartum, meta-regression) | Not applicable | Mixed tools (SST, UPSIT, PEA, custom) | Mixed (standard + some food) | Y (PROSPERO) |
| Fornazieri 2019 (doi 10.1007/s12078-019-09259-7) | Unknown | Longitudinal (12/24/36 wk + postpartum) per FAPESP abstract | Y (per protocol) | Unknown | UPSIT + OT + VAS | UPSIT 40-odor set (some food) | Not stated |
| Albaugh 2022 (meta) | 13 studies; 9 pooled = 523 preg / 365 ctrl | Meta-analysis (PRISMA) | Partly (collapsed-trimester subgroup + trimester moderator) | Not applicable | Mixed (SST, UPSIT, PEA, B-SIT, custom) | Mixed; PEA/n-butanol noted as non-food by authors | N (PRISMA, not preregistered) |
| Sabiniewicz 2024 / trigeminal (PMC11219288) | 14 / 13 | Cross-sectional (ERP + psychophysics) | N (2nd trimester only, gw 13–27) | Partly (older preg group; group age diff p=.006) | Sniffin' Sticks (TDI) + lateralization test | PEA (olfactory), CO2 (trigeminal), eucalyptol — non-food | N |
| Wohlgemuth 2008 (context) | 93 (3 parity groups) / 0 NP | Prospective cross-sectional | N (post-pregnancy only) | N (parity comparison) | Sniffin' Sticks | SST standard — non-food | N |
| Nordin 2005 (context) | 44 / 44 | Cross-sectional (questionnaire) | N (gw 21–23) | Yes (age-matched NP) | Survey (Chemical Sensitivity Scale) | None (no odors) | N |

## Flag counts (a–d)

Using the 14 core studies (Luvara, G&W, Laska, Kölble, Savovic, Nordin2004, Fessler, Olofsson, Cameron, Kwon, Muluh, Fornazieri, Albaugh, Sabiniewicz):

- **(a) n<100, trimester-collapsed** — N_preg < 100: Luvara(47), Laska(20), Kölble(53), Savovic(20), Olofsson(15), Cameron(20/17), Sabiniewicz(14), Kwon(58), Fornazieri(unknown) → **~8–9 studies n<100**. Of those, single-trimester/collapsed: Kölble(1T), Savovic(1T), Olofsson(single session), Sabiniewicz(2T), Kwon(early only) → **~4 clearly collapsed; ~4 more single-trimester** = **~6–7**. Not n<100: Gilbert & Wysocki (13,610), Nordin 2004 (144), Albaugh meta, Muluh meta, Fessler (496).
- **(b) Unvalidated/ad-hoc tests** — Luvara(blast), Savovic(Fortunato–Niccolini), Laska(squeeze bottles/staircase), Cameron(PEA custom staircase, well-validated protocol), trigeminal(PEA/CO2 custom ERP), Kwon/Fessler/Nordin2004/Nordin2005/Olofsson(questionnaire/ERP custom), Gilbert&Wysocki(scratch-and-sniff) → **~9–10**. Validated: Kölble(SST), Ochsenbein-Kölble/Wohlgemuth(SST), Fornazieri(UPSIT), Sabiniewicz(SST+lateralization) → **~4**.
- **(c) No non-pregnant controls** — Fessler 2005, Kwon 2025, Luvara 1961, Wohlgemuth 2008 (parity instead) → **4**.
- **(d) Ecologically irrelevant odors** — Laska, Kölble(SST n-butanol), Savovic, Cameron(PEA), Sabiniewicz(PEA/CO2), Olofsson(pyridine), Wohlgemuth, Albaugh/Muluh pools — all use rose PEA or n-butanol or CO2, not the complained-about coffee/meat/spoilage. Food-salient tests exist only in Nordin2004, Kwon, Kölble(VAS), Gilbert&Wysocki(partial), Cameron's free-list. → **~8–9 studies use non-food test odors**.

## Confirm/refute prior: "most studies are n<100, trimester-collapsed"

**Partially confirmed.** Across the 14 core studies:
- n<100 pregnant: **~9/14 (64%)**
- Trimester-collapsed or single-trimester: **~6–7/14 (~46%)**
- Neither: Laska, Cameron, Nordin2004, G&W, Albaugh, Muluh, Fessler = **~7/14**.

"Most n<100" holds (~2/3). "Most trimester-collapsed" does **not** — roughly half, and designs that separate trimesters tend to be the small-N ones. Accurate statement: **most studies are n<100 with either collapsed or single-trimester sampling; only the surveys/meta-analyses exceed n=100, and those are self-report or pooled.**

## Minimal preregistered protocol (fixes top gaps)

- **Design:** Prospective longitudinal cohort, n≥120 pregnant (≥40 per trimester) + n≥120 non-pregnant age-matched controls (menstrual-phase-controlled), pre-registered on OSF/PROSPERO with primary outcome = Sniffin' Sticks TDI threshold subscore; powered a priori (G*Power) for f=0.25, α=.05, power=.90.
- **Measures:** At each trimester + 6–12 wk postpartum, Sniffin' Sticks (T, D, I; n-butanol standard) **plus** a food-salient hedonic battery — coffee, cooked meat, fish/spoilage (trimethylamine), cigarette smoke — with intensity and pleasantness VAS, plus a validated rhinitis/nasal-patency measure to covary congestion.
- **Covariates:** Concurrent serum/urine hCG and estradiol/progesterone at each visit (mechanism + timing anchor), validated nausea/vomiting (PUQE), depression screen, smoking exclusion; analyze trimester as a within-subject factor (not collapsed) with mixed-effects models and FDR correction.

Notes: Fessler 2005 N=496 is pregnant-only; Olofsson 2005 = 15/15; trigeminal 2024 = 14/13 second-trimester-only; Fornazieri 2019 enrolled N unknown. Counts use the 14 core studies; context rows (Wohlgemuth, Nordin 2005) excluded from primary counts.
