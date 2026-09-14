-- Claim-evidence matrix from research/02_contradiction_map.md.
-- Tags: SUPPORTS / NULL / OPPOSITE / UNMEASURED / MIXED
INSERT OR REPLACE INTO claim_evidence (cite_key, c1_self_report, c2_threshold, c3_identification, c4_hedonics, note) VALUES
('Nordin2004-ChemSenses', 'SUPPORTS', 'UNMEASURED', 'UNMEASURED', 'UNMEASURED', '67% early hyperosmia; 76% any abnormality'),
('GilbertWysocki1991', 'OPPOSITE', 'UNMEASURED', 'NULL', 'SUPPORTS', '13,610 rated own smell lower; largest N; self-rated olfaction lower'),
('Kolble2001', 'NULL', 'NULL', 'SUPPORTS', 'SUPPORTS', 'OID lower in cases; cigarette/rum/coffee less pleasant'),
('Savovic2002', 'UNMEASURED', 'NULL', 'NULL', 'UNMEASURED', 'OT+OID lower but non-significant'),
('Laska1996', 'UNMEASURED', 'MIXED', 'MIXED', 'MIXED', 'OT worse 1T better 3T; peanut less pleasant, clove/anise more'),
('OchsenbeinKolble2007', 'OPPOSITE', 'OPPOSITE', 'NULL', 'SUPPORTS', 'self-rated more sensitive later; 3T/PP lower OT; coffee less pleasant 1T'),
('Cameron2014-ChemSenses-thresholds', 'SUPPORTS', 'NULL', 'UNMEASURED', 'UNMEASURED', 'self-rated 1T higher; d-prime no diff; liberal bias trend'),
('LuvaraMurizi1961', 'UNMEASURED', 'SUPPORTS', 'UNMEASURED', 'UNMEASURED', 'sole pro-hyperosmia; blast-injection confounded by engorgement'),
('Olofsson2005-ERP', 'SUPPORTS', 'NULL', 'UNMEASURED', 'UNMEASURED', 'N1/P1 unchanged; P3 tendency -> cognitive locus'),
('Simsek2015', 'UNMEASURED', 'UNMEASURED', 'SUPPORTS', 'UNMEASURED', '1T OID lower vs 2T/3T/controls'),
('Nwankwo2017', 'UNMEASURED', 'NULL', 'SUPPORTS', 'UNMEASURED', 'OID + TDI lower in cases'),
('Fornazieri2019', 'UNMEASURED', 'UNMEASURED', 'NULL', 'MIXED', 'no OID diff; odor-specific OH/OI diffs'),
('Albaugh2022-ChemSenses', 'SUPPORTS', 'NULL', 'SUPPORTS', 'NULL', 'OID SMD -0.32 [-0.54,-0.09]; OT 0.19 [-0.23,0.61]; coffee null k=2 I2=97%'),
('Muluh2024-PhysiolBehav', 'UNMEASURED', 'UNMEASURED', 'SUPPORTS', 'SUPPORTS', 'ID worse all trimesters; T2 pleasantness down; T2/T3 intensity up'),
('Fessler2005-disgust', 'UNMEASURED', 'UNMEASURED', 'UNMEASURED', 'SUPPORTS', 'Disgust Scale 1T highest n=496');
