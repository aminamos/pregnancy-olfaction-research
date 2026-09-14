# pregnancy-olfaction-research

Centralized notes + open-access PDFs on pregnancy and olfaction.

## Central finding

Psychophysical and clinical research shows a discrepancy between subjective reports and objective testing:

- **Subjective hyperosmia vs objective thresholds:** up to ~2/3 report heightened acuity, but absolute detection thresholds do not decrease (Cameron, 2014). Perceived enhancement is driven by hedonic shift (odors rated less pleasant), increased disgust sensitivity, and altered cognitive processing of volatiles.
- **Evolutionary context:** hedonic shift toward aversion (meats, coffee, perfumes, spoiled food) hypothesized as embryo-protective mechanism against teratogens / toxins during organogenesis.
- **Trimester variation:** estrogen / progesterone fluctuations + pregnancy rhinitis contribute to variable performance and congestion (Dikici et al., 2017).

## PDFs in repo (`pdfs/`)

1. Cameron, E. L. (2014). Pregnancy and olfaction: a review. *Frontiers in Psychology*, 5. https://doi.org/10.3389/fpsyg.2014.00067
   - File: `pdfs/Cameron2014_Pregnancy_and_olfaction_a_review.pdf`
   - Scope: psychophysical measures, detection thresholds, hedonic shifts, nausea triggers.
2. Dikici, O., Bayar Muluk, N., Şahin, E., & Altıntoprak, N. (2017). Effects of pregnancy on olfaction. *ENT Updates*, 7, 104–107. https://doi.org/10.2399/jmu.2017002009
   - File: `pdfs/Dikici2017_Effects_of_pregnancy_on_olfaction.pdf`
   - Scope: mucosa changes, congestion / rhinitis, discrimination variation across pregnancy and postpartum.

Additional key reference for follow-up (not yet in `pdfs/` due to access):
- Changes in Olfactory Function in Pregnancy and Postpartum – longitudinal threshold / discrimination / identification vs non-pregnant controls. Indexed via Ovid / Obstetric Anesthesia.
- Albaugh et al. 2022 meta-analysis: 506 cases / 333 controls, worse identification in pregnancy, no detection difference.

## References

- Cameron, E. L. (2014). Pregnancy and olfaction: a review. *Frontiers in Psychology*, 5. https://doi.org/10.3389/fpsyg.2014.00067 – Cited by: 144
- Dikici, O., Bayar Muluk, N., Şahin, E., & Altıntoprak, N. (2017). Effects of pregnancy on olfaction. *ENT Updates*, 7, 104–107. https://doi.org/10.2399/jmu.2017002009 – Cited by: 12

## What can be brute-forced now, no lab needed

1. Updated systematic review 2014-2026. Cameron stops at 2014. Albaugh et al. 2022 meta-analysis (506 cases / 333 controls, worse identification, no detection difference) needs update. Brute force: PubMed / PMC / Ovid forward search, screen all, re-extract.
2. Odor-specific frequency count. Brute force text-mine all papers + abstracts for trigger odors. Test if aversion is odor-specific (unpleasant / potentially teratogenic) vs general hedonic shift.
3. Trimester curve reconstruction. Brute force extract every trimester-specific datapoint (T1 vs T2 vs T3 vs postpartum week 7-12) and plot threshold / ID / hedonics separately. Dikici, Ochsenbein-Kölble 2007, Savovic 2002, Nordin 2004 all have fragments.
4. Citation distortion check. Track how "hyperosmia" is cited vs what Cameron actually concluded (no evidence for general hyperosmia). Common failure mode.
5. Preregistered replication protocol. LM can draft Sniffin' Sticks + hedonic ratings + rhinitis score + hormone panel protocol ready to run.

LM limit: cannot resolve estrogen -> aversion mechanism causally. Can list proposed paths (olfactory mucosa ER expression, limbic amplification, trigeminal decrease, nausea conditioning) and mark each as correlational in humans. Requires paired assay + psychophysics to move further.

## Literature synthesis from those 2 seeds + their citation graphs

- Cameron 2014 cited by 144. Dikici 2017 cited by 12. Extract: N, trimester, test (threshold / discrimination / identification / hedonics), result direction, effect size.
- Output: claim-evidence matrix separating subjective hyperosmia vs objective threshold vs hedonics vs disgust.

2. Contradiction mapping.

- Example already in your notes: 67% report hyperosmia early, no threshold decrease on PEA / Sniffin' Sticks. LM can tag every paper as supports / null / opposite for that specific claim.

3. Hypothesis audit.

- Embryo-protection, hormonal (estrogen/progesterone/hCG), pregnancy rhinitis/congestion, cognitive/high-level processing, Garcia-effect conditioning. LM can score each for evidence strength and falsifiability.

4. Methods audit / power check.

- Extract sample sizes, controls, validated vs ad-hoc tests, longitudinal vs cross-sectional. Most pregnancy olfaction studies are n<100, trimester-collapsed. LM can flag underpowered designs.

## License

Notes: MIT. PDFs retain original publisher licenses (Frontiers open-access, DergiPark).
