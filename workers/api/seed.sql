-- Seed from repo sources only (LITERATURE_REVIEW.md, NON_DUPLICATION.md, README.md).
-- Numbers below appear verbatim in those files.

INSERT INTO papers (cite_key, authors, year, journal, doi, pmc, pmid, kind, design, n_pregnant, n_controls, scope, open_access, r2_key) VALUES
('Cameron2014-FrontPsychol', 'Cameron, E. L.', 2014, 'Frontiers in Psychology', '10.3389/fpsyg.2014.00067', 'PMC3915141', NULL, 'review', 'narrative review', NULL, NULL, 'psychophysics, thresholds, hedonics, nausea triggers', 1, 'Cameron2014_Pregnancy_and_olfaction_a_review.pdf'),
('Dikici2017-ENTUpdates', 'Dikici, O.; Bayar Muluk, N.; Sahin, E.; Altintoprak, N.', 2017, 'ENT Updates', '10.2399/jmu.2017002009', NULL, NULL, 'review', 'narrative review', NULL, NULL, 'mucosa, rhinitis/congestion, discrimination across pregnancy/postpartum', 1, 'Dikici2017_Effects_of_pregnancy_on_olfaction.pdf'),
('Albaugh2022-ChemSenses', 'Albaugh et al.', 2022, 'Chemical Senses', '10.1093/chemse/bjac035', 'PMC9780746', '36469055', 'meta-analysis', 'PRISMA to Feb 2022', 523, 365, 'threshold, identification, discrimination, hedonics, intensity', 1, NULL),
('Muluh2024-PhysiolBehav', 'Muluh et al.', 2024, 'Physiology & Behavior', '10.1016/j.physbeh.2023.114388', NULL, '37890603', 'meta-analysis', 'PROSPERO, 20 studies, trimester + postpartum meta-regression', NULL, NULL, 'olfaction + gustation across trimesters and postpartum', 0, NULL),
('Nordin2004-ChemSenses', 'Nordin et al.', 2004, 'Chemical Senses', '10.1093/chemse/bjh040', NULL, NULL, 'primary', 'longitudinal self-report', 144, NULL, 'abnormal smell/taste perception weeks 13-16, 31-34 vs postpartum', 0, NULL),
('GilbertWysocki1991', 'Gilbert & Wysocki', 1991, 'National Geographic Smell Study', NULL, NULL, NULL, 'primary', 'large survey self-rating', 13610, NULL, 'self-rated smell lower in pregnancy (counterpoint)', 0, NULL),
('Cameron2014-ChemSenses-thresholds', 'Cameron, E. L.', 2014, 'Chemical Senses', '10.1093/chemse/bjt063', NULL, NULL, 'primary', 'PEA thresholds + 75-trial signal detection, longitudinal', NULL, NULL, 'detection thresholds vs self-report', 0, NULL),
('Olofsson2005-ERP', 'Olofsson et al.', 2005, NULL, NULL, NULL, NULL, 'primary', 'chemosensory ERP', NULL, NULL, 'N1/P1 sensory vs P3 cognitive locus', 0, NULL),
('Trigeminal2024-PMC11219288', NULL, 2024, NULL, NULL, 'PMC11219288', NULL, 'primary', 'EEG/ERP + lateralization', NULL, NULL, 'olfactory ERP unchanged; trigeminal sensitivity decreased', 1, NULL),
('Kwon2025-cytokines', 'Kwon et al.', 2025, 'Evolution, Medicine, and Public Health', '10.1093/emph/eoaf016', NULL, NULL, 'primary', 'cytokine panel weeks 5-17', 58, NULL, 'aversions track plasma cytokines (Th1 shift)', 1, NULL),
('FlaxmanSherman-synthesis', 'Flaxman & Sherman; Sherman & Flaxman', 2000, 'Q Rev Biol; AJOG; Am Nat', NULL, NULL, NULL, 'synthesis', 'comparative + epidemiological', NULL, NULL, 'NVP organogenesis timing, miscarriage 9/9, meat-staple correlation', 0, NULL),
('Fessler2005-disgust', 'Fessler et al.', 2005, NULL, NULL, NULL, NULL, 'primary', 'Disgust Scale', 496, NULL, 'first-trimester disgust highest', 0, NULL),
('RodentNeurogenesis', 'Shingo et al.; Science abo5199', 2003, NULL, NULL, NULL, NULL, 'animal', 'mouse SVZ/OB', NULL, NULL, 'prolactin-driven SVZ neurogenesis; human OB neurogenesis disputed', 0, NULL),
('Heinrichs2002', 'Heinrichs', 2002, NULL, NULL, NULL, NULL, 'cited', NULL, NULL, NULL, 'congenital anosmics nearly NVP-free', 0, NULL),
('Hummel2002', 'Hummel', 2002, NULL, NULL, NULL, NULL, 'cited', NULL, NULL, NULL, 'no threshold-NVP correlation', 0, NULL),
('Swallow2005a', 'Swallow', 2005, NULL, NULL, NULL, NULL, 'cited', NULL, NULL, NULL, 'direct embryo-protection test failed', 0, NULL),
('Brown1997-n549', 'Brown', 1997, NULL, NULL, NULL, NULL, 'cited', NULL, 549, NULL, 'direct embryo-protection test failed', 0, NULL),
('LuvaraMurizi1961', 'Luvara & Murizi', 1961, NULL, NULL, NULL, NULL, 'cited', 'blast-injection thresholds', NULL, NULL, 'sole pro-hyperosmia threshold result, confounded by engorgement', 0, NULL);

-- Findings (verbatim numbers from repo sources)
INSERT INTO findings (paper_id, domain, trimester, result_direction, effect_smd, ci_low, ci_high, k, n_cases, n_ctrls, pct, notes) VALUES
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'identification', 'collapsed', 'worse', -0.32, -0.54, -0.09, 8, 506, 333, NULL, 'random-effects; I2=48.88%'),
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'discrimination', 'collapsed', 'null', 0.004, -0.19, 0.19, 4, NULL, NULL, NULL, 'fixed-effect; I2=0.00%'),
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'threshold', 'collapsed', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no threshold improvement'),
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'hedonics', 'collapsed', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'coffee hedonics null (2 studies, 1 group)'),
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'intensity', 'collapsed', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null in Albaugh window'),
((SELECT id FROM papers WHERE cite_key='Muluh2024-PhysiolBehav'), 'identification', 'collapsed', 'worse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'poorer ID regardless of trimester; postpartum = controls (recovery)'),
((SELECT id FROM papers WHERE cite_key='Muluh2024-PhysiolBehav'), 'intensity', 'T2', 'better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'higher intensity ratings T2+T3; stage predicts intensity effect'),
((SELECT id FROM papers WHERE cite_key='Muluh2024-PhysiolBehav'), 'intensity', 'T3', 'better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'higher intensity ratings T2+T3'),
((SELECT id FROM papers WHERE cite_key='Muluh2024-PhysiolBehav'), 'hedonics', 'T2', 'worse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'slight pleasantness decline T2'),
((SELECT id FROM papers WHERE cite_key='Nordin2004-ChemSenses'), 'self-report', 'T1', 'descriptive', NULL, NULL, NULL, NULL, NULL, NULL, 67.0, 'early hyperosmia'),
((SELECT id FROM papers WHERE cite_key='Nordin2004-ChemSenses'), 'self-report', 'collapsed', 'descriptive', NULL, NULL, NULL, NULL, NULL, NULL, 76.0, 'smell/taste abnormality'),
((SELECT id FROM papers WHERE cite_key='Nordin2004-ChemSenses'), 'self-report', 'T1', 'descriptive', NULL, NULL, NULL, NULL, NULL, NULL, 17.0, 'qualitative distortions early'),
((SELECT id FROM papers WHERE cite_key='Nordin2004-ChemSenses'), 'self-report', 'T1', 'descriptive', NULL, NULL, NULL, NULL, NULL, NULL, 14.0, 'phantom smells early; resolves postpartum'),
((SELECT id FROM papers WHERE cite_key='GilbertWysocki1991'), 'self-report', 'collapsed', 'worse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pregnant rated own smell lower; largest N'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-ChemSenses-thresholds'), 'threshold', 'T1', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PEA + d-prime null; nonsignificant liberal-criterion trend early'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'self-report', 'T1', 'descriptive', NULL, NULL, NULL, NULL, NULL, NULL, 85.0, 'Cameron 2007: >=1 odor named (cooking, smoke, spoiled, perfume, coffee)'),
((SELECT id FROM papers WHERE cite_key='Olofsson2005-ERP'), 'erp', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N1/P1 unchanged; P3 tendency -> high-level locus'),
((SELECT id FROM papers WHERE cite_key='Trigeminal2024-PMC11219288'), 'erp', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'olfactory ERPs unchanged'),
((SELECT id FROM papers WHERE cite_key='Trigeminal2024-PMC11219288'), 'trigeminal', NULL, 'worse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'decreased lateralization + lower intensity/painfulness; P2 amplitude reduced; progesterone hypothesis'),
((SELECT id FROM papers WHERE cite_key='Kwon2025-cytokines'), 'hormones', 'T1', 'better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aversions track cytokines weeks 5-17; Th1 shift; inflammatory mediation'),
((SELECT id FROM papers WHERE cite_key='Fessler2005-disgust'), 'disgust', 'T1', 'better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Disgust Scale highest T1'),
((SELECT id FROM papers WHERE cite_key='LuvaraMurizi1961'), 'threshold', NULL, 'better', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sole pro-hyperosmia; confounded blast-injection + engorgement'),
((SELECT id FROM papers WHERE cite_key='Heinrichs2002'), 'nvp', NULL, 'mixed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'anosmics nearly NVP-free (pro-link)'),
((SELECT id FROM papers WHERE cite_key='Hummel2002'), 'nvp', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no threshold-NVP correlation (anti-link)'),
((SELECT id FROM papers WHERE cite_key='Swallow2005a'), 'nvp', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'embryo-protection direct test failed'),
((SELECT id FROM papers WHERE cite_key='Brown1997-n549'), 'nvp', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'embryo-protection direct test failed'),
((SELECT id FROM papers WHERE cite_key='RodentNeurogenesis'), 'neurogenesis', NULL, 'mixed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'prolactin SVZ->OB in mouse; human adult OB neurogenesis disputed');

-- Odor mentions: complaint odors = food-salient; lab test odors = not food-salient
INSERT INTO odor_mentions (paper_id, odor_term, category, food_salient, valence, context) VALUES
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'cooking', 'food', 1, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'smoke', 'smoke', 0, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'spoiled food', 'spoilage', 1, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'perfume', 'perfume', 0, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'coffee', 'food', 1, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'meat', 'food', 1, 'aversive', 'complaint'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'cigarettes', 'smoke', 0, 'aversive', 'hedonic-rating'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-FrontPsychol'), 'fumes', 'fumes', 0, 'aversive', 'hedonic-rating'),
((SELECT id FROM papers WHERE cite_key='Cameron2014-ChemSenses-thresholds'), 'phenylethyl alcohol (rose-like)', 'test-odor', 0, 'neutral', 'test-stimulus'),
((SELECT id FROM papers WHERE cite_key='Albaugh2022-ChemSenses'), 'coffee', 'food', 1, 'neutral', 'hedonic-rating'),
((SELECT id FROM papers WHERE cite_key='Dikici2017-ENTUpdates'), 'n-butanol', 'test-odor', 0, 'neutral', 'test-stimulus');

-- Mechanisms
INSERT INTO mechanisms (name, evidence_strength, status, notes) VALUES
('estrogen-causal', 'contradicted', 'temporal-mismatch', 'peaks at parturition; complaints peak week 8'),
('hCG-timing', 'weak', 'temporal-match-untested', 'best temporal match; peaks with symptoms; diet/injection anecdotes; zero direct tests; no concomitant hormone+psychophysics study'),
('progesterone-trigeminal', 'weak', 'correlational', 'decreased trigeminal sensitivity; elevated progesterone hypothesized'),
('immune-cytokine', 'weak', 'correlational', 'n=58 weeks 5-17 aversions track cytokines; Th1 shift; newest thread'),
('conditioning-garcia', 'untested', 'untested', 'Bartoshuk & Wolfe 1990 abstract only; rapid odor-nausea conditioning untested'),
('cognitive-high-level', 'moderate', 'correlational', 'ERP N1/P1 unchanged, P3 tendency; liberal criterion trend; OID deficit overlaps cognition/grey-matter remodeling'),
('rhinitis-congestion', 'weak', 'correlational', 'pregnancy rhinitis modulates function; idiosyncratic/odor-specific'),
('olfactory-mucosa-ER', 'untested', 'correlational', 'listed as proposed path; human causal data absent'),
('limbic-amplification', 'untested', 'correlational', 'listed as proposed path; human causal data absent'),
('prolactin-neurogenesis', 'weak', 'causal-animal-only', 'mouse SVZ->OB functional near birth; human adult OB neurogenesis disputed'),
('embryo-protection', 'mixed', 'mixed', 'NVP organogenesis timing + miscarriage + meat correlation support; 2 direct tests failed (Swallow 2005a; Brown n=549)');

-- Gaps / solo angles
INSERT INTO gaps (title, description, novelty) VALUES
('hCG-olfaction evidence map', 'Systematic map of hCG-olfaction gap: every claim linking hCG timing to smell, graded by direct vs anecdotal; zero concomitant hormone+psychophysics studies.', 'novel'),
('odor-relevance coding re-analysis', 'Re-code all test odors as food-salient vs not (PEA/n-butanol = not; coffee/meat/spoilage = yes); predicts the null-threshold pattern. No threshold study uses complained-about food/spoilage odors.', 'novel'),
('2023-2026 delta update', 'Post-Muluh (2023+) forward search only: postpartum + intensity/pleasantness + COVID/post-viral confounder (PMC12199236). Do not redo full 2014-2026.', 'delta-only'),
('citation-distortion check', 'Track hyperosmia citations vs Cameron null conclusion (no general hyperosmia).', 'novel'),
('methods power table', 'Open CSV: Sniffin Sticks / UPSIT / PEA, n, controls, longitudinal vs cross-sectional; flag n<100 trimester-collapsed.', 'novel'),
('replication protocol', 'Preregistered Sniffin Sticks + hedonics + rhinitis + hormone panel (hCG concurrent) protocol.', 'novel');
