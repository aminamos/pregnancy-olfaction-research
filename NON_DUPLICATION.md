# Non-duplication / landscape check — 2026-09-14

Goal: ensure `aminamos/pregnancy-olfaction-research` does not duplicate existing work.

## GitHub code search (via `gh search repos`, 2026-09-14)

- Query: `pregnancy olfaction` → 1 hit: `aminamos/pregnancy-olfaction-research` (this repo, 0 stars). No competing repo.
- Query: `pregnancy smell hyperosmia` → 0 hits.
- Conclusion: no GitHub repo duplication. This repo is notes + open-access PDFs, not code.

## Existing reviews / meta-analyses (do NOT redo verbatim)

### 1. Albaugh et al. 2022 — Olfaction in pregnancy: systematic review and meta-analysis
- *Chemical Senses*, doi:10.1093/chemse/bjac035 / PMC9780746 / PMID 36469055. Cited by ~15.
- PRISMA, search to Feb 2022.
- 13 studies qualitative; 9 in meta-analysis: 523 pregnant / 365 controls.
- Measures: identification (n=11 articles), threshold (n=8), discrimination (n=5), hedonics (n=6), intensity (n=5).
- Result: worse odor identification in pregnancy vs controls, random-effects SMD -0.32 [95% CI -0.54 to -0.09], p=0.05, I2=48.88%, k=8, n=506 cases / 333 controls.
- No difference: discrimination SMD 0.004 [-0.19 to 0.19], p=0.96, k=4; threshold / hedonics / intensity null (limited k).
- Conclusion: hyposmia for identification, not hyperosmia. Gaps noted: odors not pregnancy-relevant (except coffee, 2 studies 1 group), no race/ethnicity or cognition covariates, screening for rhinitis/URI inconsistent.

### 2. Muluh et al. 2024 — Gustatory and olfactory shifts during pregnancy and postpartum
- *Physiology & Behavior* 273:114388, doi:10.1016/j.physbeh.2023.114388. PMID 37890603. PROSPERO pre-registered. Cited by ~16-17.
- 20 studies in meta-analysis (olfaction + gustation).
- Result: poorer odour identification regardless of trimester; no postpartum vs control difference (recovery).
- T2+T3: higher intensity ratings. T2: slight pleasantness decline. Meta-regression: stage predicts intensity effect, not identification effect.
- T1: increased sweet pleasantness (gustation). Otherwise gustation null.
- This supersedes Albaugh for scope (adds postpartum + gustation + trimester meta-regression).

### 3. Cameron 2014 — Pregnancy and olfaction: a review
- *Frontiers in Psychology* 5, doi:10.3389/fpsyg.2014.00067 / PMC3915141. In repo `pdfs/`.
- Narrative review, all extant data to 2014. Conclusion: no general hyperosmia on thresholds; idiosyncratic hedonics / hyperreactivity; suggests odor-specificity and cognition vs sensation distinction.

### 4. Cameron 2014b — Pregnancy Does Not Affect Human Olfactory Detection Thresholds
- *Chemical Senses* 39(2):143-150, doi:10.1093/chemse/bjt063.
- PEA thresholds + signal detection, pregnant vs non-pregnant vs men, + longitudinal. Null on sensitivity despite T1 self-rated hyperosmia.

### 5. Fornazieri et al. 2019 — Olfaction During Pregnancy and Postpartum Period (Springer, doi:10.1007/s12078-019-09259-7)
- Quantified function gestational vs puerperal vs controls, rhinitis influence. Conclusion: idiosyncratic, odor-specific, rhinitis-modulated.

### 6. Trigeminal 2024 — Pregnant women exhibit decreased trigeminal sensitivity (PMC11219288)
- Confirms Albaugh + Muluh on olfaction; adds decreased trigeminal lateralization + lower intensity/painfulness ratings, reduced chemosensory ERP P2 amplitude. Progesterone hypothesis.

### 7. Kwon et al. 2025 — Of scents and cytokines
- *Evolution, Medicine, and Public Health* 13(1):269-280, doi:10.1093/emph/eoaf016.
- NVP / aversion linked to Th1 shift early pregnancy. Revises compensatory prophylaxis hypothesis.

### 8. Nordin et al. 2004 — Longitudinal self-report (Chemical Senses 29:391-402, cited by 159)
- 76% report abnormal smell/taste; 67% increased sensitivity early, 17% distortions, 14% phantoms; fades late/postpartum. Basis for 67% figure.

## What this repo is (non-duplicative)

- Curated notes + 2 open-access PDFs (Cameron 2014 Frontiers, Dikici 2017 ENT Updates).
- No new meta-analysis, no new data collection. No overlap with code repos (none exist).

## What WOULD duplicate if done naively — do deltas only

1. Full systematic review 2014-2026 → duplicates Albaugh 2022 + Muluh 2024. Do 2023-2026 delta only (post-Muluh search, postpartum + intensity/pleasantness focus, COVID/post-viral as confounder per PMC12199236).
2. Odor-specific frequency count → partially done in Albaugh (coffee). Gap remains: systematic trigger-odor extraction (meat/coffee/perfume/smoke/spoiled) across qualitative studies — not meta-analyzed. Allowed as novel.
3. Trimester curve reconstruction → Muluh did meta-regression for intensity/ID. Gap: threshold/discrimination/hedonics by trimester + postpartum week 7-12 with raw means/SDs table. Allowed if building open dataset, not re-publishing same forest plots.
4. Citation distortion check (hyperosmia cited vs null thresholds) → not done in above reviews. Novel.
5. Methods audit / power table (Sniffin' Sticks / UPSIT / PEA, n, controls, longitudinal) → mentioned as limitation in Albaugh/Muluh but no open machine-readable table exists. Novel if released as CSV.
6. Preregistered replication protocol (Sniffin' Sticks + hedonics + rhinitis + hormone panel) → not in reviews. Novel.

## Rule

- Cite Albaugh 2022 + Muluh 2024 as baseline in README. Any new synthesis must start from their included-study lists and add only new studies / new columns.
- Keep PDFs to open-access only; link paywalled (Cameron thresholds 2014, Nordin 2004, Muluh 2024) via DOI, do not vendor.

## Sources checked

- `gh search repos` 2026-09-14, web search for systematic review/meta-analysis 2022-2025, PMC9780746, PMID 36469055, PMID 37890603, PMC11219288, doi:10.1093/emph/eoaf016, PMC12199236.
