-- Claim-evidence matrix (Task 1/2 output) seeded into D1.
CREATE TABLE IF NOT EXISTS claim_evidence (
  id INTEGER PRIMARY KEY,
  cite_key TEXT NOT NULL,
  c1_self_report TEXT NOT NULL,
  c2_threshold TEXT NOT NULL,
  c3_identification TEXT NOT NULL,
  c4_hedonics TEXT NOT NULL,
  note TEXT,
  UNIQUE(cite_key)
);
CREATE INDEX IF NOT EXISTS idx_claim_cite ON claim_evidence(cite_key);
