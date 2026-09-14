# 04 — Methods audit / power check

Task 4 of 4. Metadata from Albaugh 2022 Table 1 (verbatim) + Cameron 2014 review + repo notes. Unknown = `?`.

| Study | N preg / ctrl | Design | Trimesters separated? | Matched ctrl? | Validated test? | Test odors food-salient? | Preregistered? |
|---|---|---|---|---|---|---|---|
| Gilbert & Wysocki 1991 | 13,610 / 277,278 | cross-sectional survey | N (unspecified) | N | custom scratch-and-sniff (6) | mixed | no |
| Laska 1996 | 20 / 20 | longitudinal | Y (1T-3T+PP) | Y | custom squeeze bottles (12) | mixed | no |
| Dastur 2000 (unpub.) | 19 / 18 | longitudinal | Y | Y | PEA staircase + UPSIT | N | no |
| Kölble 2001 | 53 / 59 | cross-sectional | N (1T only) | Y | Sniffin' Sticks 16 | N (n-butanol OT) | no |
| Savović 2002 | 20 / 20 | cross-sectional | N (1T) | Y | Fortunato–Niccolini olfactometer | N/mixed (anise, vanillin, PEA, citral, menthol, pyridine) | no |
| Olofsson 2005 | 15 / 15 | cross-sectional | N (2T) | Y | CSERP | ? | no |
| Cameron 2007 | 60 / 20 | cross-sectional | Y (20/trimester) | Y | UPSIT + 40-item | mixed | no |
| Ochsenbein-Kölble 2007 | 38 / 46 | longitudinal | Y | Y | Sniffin' Sticks 16 + VAS | N (n-butanol OT) | no |
| Cameron 2014a | 17 / 32 | cross-sectional | ? | Y | PEA staircase | N | no |
| Cameron 2014b | 20 / 22 | longitudinal | Y | Y | PEA + 75-trial signal detection | N | no |
| Kyung-yeon 2014 | 50 / 40 | longitudinal | partial (1T + PP) | Y | Korean SST | N | no |
| Şimşek 2015 | 92 / 30 | cross-sectional | Y | Y | Turkish B-SIT | N/mixed | no |
| Nwankwo 2017 | 70 / 70 | cross-sectional | ? | Y | SST (non-adapted) | N | no |
| Fornazieri 2019 | 124 / 50 | cross-sectional | Y | Y | Portuguese UPSIT + VAS | mixed | no |
| Luvara & Murizi 1961 | 47 (repeated) | cross-sectional/long | partial | Y | blast injection | N (anise, musk ketone, carnation, citral) | no |
| Hansen & Glass 1936 | 22 | longitudinal | N (end-preg + PP) | within-subject | Zwaardemaker olfactometer | N (rubber, rose, nitrobenzene) | no |
| Noferi & Giudizi 1946 | 15 / 15 / 15 | cross-sectional | N (late preg) | Y | blast injection | N (lemon) | no |
| Nordin 2004 | 144 / 76 | longitudinal self-report | Y | Y | questionnaire | n/a | no |
| Fessler 2005 | 496 | cross-sectional | Y (1T vs 2T/3T) | N (within-preg) | Disgust Scale | n/a | no |
| Albaugh 2022 | 523 / 365 (9 studies) | meta-analysis | collapsed + trimester subgroup | n/a | SST/UPSIT/PEA | N | no (PRISMA, not preregistered) |
| Muluh 2024 | 20 studies | meta-analysis | Y (meta-regression) | n/a | mixed | mixed | PROSPERO |

## Flag counts

- **(a) n<100 / trimester-collapsed:** Of 13 primary studies in Albaugh 2022, 12 have n<100 pregnant (all except Gilbert & Wysocki 1991). 6 of 13 were cross-sectional single-trimester (Kölble, Savović, Olofsson, Cameron 2014a, Şimşek, Nwankwo). **Prior confirmed** for the modern primary literature; exception is the 1991 Nat Geo survey.
- **(b) Unvalidated / ad-hoc tests:** Gilbert & Wysocki 1991 (custom scratch-and-sniff), Laska 1996 (custom squeeze bottles), Nwankwo 2017 (non-culturally-adapted SST), Şimşek 2015 (adapted B-SIT), Kyung-yeon 2014 (adapted SST). = 5/13 use non-standard or adapted instruments; 4 use SST, 3 use UPSIT, 2 use PEA staircase.
- **(c) No non-pregnant controls:** Gilbert & Wysocki 1991 has 277,278 non-pregnant comparators (not matched). Fessler 2005 compares trimesters within pregnant women only (no non-pregnant group). Others have controls.
- **(d) Ecologically irrelevant test odors:** Albaugh 2022 states the core issue verbatim — "the monomolecular odor stimuli used to assess odor detection thresholds are likely not contextually relevant to pregnant women... Both non-food odors, the pleasant rose-like odor PEA and the non-familiar 'sweet' alcohol n-butanol." All threshold studies use PEA or n-butanol; complaints name cooking/coffee/meat/spoiled food/cigarettes/perfume. Odor-relevance gap confirmed across the entire threshold literature.
- **Confounder screening gaps (Albaugh 2022):** only 6/13 explicitly excluded smokers; 3/13 only asked to refrain pre-test; **no study gathered depression data**; race/ethnicity and cognition not mentioned.

## Minimal preregistered protocol (fixes a/b/c/d)

1. **Odors:** parallel arms — (i) standard PEA/n-butanol threshold, (ii) ecologically relevant food/spoilage odors (coffee, meat, spoiled food, cigarette smoke, perfume) with established pleasantness/intensity ratings. Predicts the null pattern if odor-relevance explains it.
2. **Measures:** Sniffin' Sticks TDI + odor hedonics (VAS) + intensity + trigeminal (lateralization) + rhinitis score + cognitive battery (verbal fluency, semantic memory) to separate sensory from cognitive.
3. **Hormones:** concurrent hCG, estradiol, progesterone at each session (weeks 5–12 repeated), within-subject; postpartum retest. Directly addresses H4 and the "no concomitant hormone + psychophysics" gap (Albaugh 2022 future direction: "measuring olfactory performance and hormone levels concomitantly").
