-- pregnancy-olfaction-db schema (D1 / SQLite)
-- Evidence-backed extracts from LITERATURE_REVIEW.md + NON_DUPLICATION.md only.
-- NULL = not stated in repo sources. Do not infer.

CREATE TABLE IF NOT EXISTS papers (
  id INTEGER PRIMARY KEY,
  cite_key TEXT NOT NULL UNIQUE,
  authors TEXT,
  year INTEGER,
  journal TEXT,
  doi TEXT,
  pmc TEXT,
  pmid TEXT,
  kind TEXT, -- review | meta-analysis | primary | synthesis | animal | cited
  design TEXT, -- e.g. longitudinal, cross-sectional, signal-detection
  n_pregnant INTEGER,
  n_controls INTEGER,
  scope TEXT,
  open_access INTEGER DEFAULT 0,
  r2_key TEXT
);

CREATE TABLE IF NOT EXISTS findings (
  id INTEGER PRIMARY KEY,
  paper_id INTEGER NOT NULL REFERENCES papers(id),
  domain TEXT NOT NULL, -- threshold | identification | discrimination | hedonics | intensity | trigeminal | self-report | disgust | nvp | erp | hormones | neurogenesis
  trimester TEXT, -- T1 | T2 | T3 | postpartum | collapsed | NULL
  result_direction TEXT NOT NULL, -- worse | better | null | mixed | descriptive
  effect_smd REAL,
  ci_low REAL,
  ci_high REAL,
  k INTEGER,
  n_cases INTEGER,
  n_ctrls INTEGER,
  pct REAL, -- for self-report percentages
  notes TEXT
);

CREATE TABLE IF NOT EXISTS odor_mentions (
  id INTEGER PRIMARY KEY,
  paper_id INTEGER NOT NULL REFERENCES papers(id),
  odor_term TEXT NOT NULL,
  category TEXT, -- food | spoilage | smoke | perfume | test-odor | fumes | other
  food_salient INTEGER, -- 1 | 0 | NULL
  valence TEXT, -- aversive | neutral | pleasant | NULL
  context TEXT -- complaint | test-stimulus | hedonic-rating
);

CREATE TABLE IF NOT EXISTS mechanisms (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  evidence_strength TEXT, -- strong | moderate | weak | contradicted | untested
  status TEXT, -- correlational | causal-animal-only | null | temporal-match-untested
  notes TEXT
);

CREATE TABLE IF NOT EXISTS gaps (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  novelty TEXT -- novel | delta-only | done-elsewhere
);

CREATE INDEX IF NOT EXISTS idx_findings_paper ON findings(paper_id);
CREATE INDEX IF NOT EXISTS idx_findings_domain ON findings(domain);
CREATE INDEX IF NOT EXISTS idx_odor_paper ON odor_mentions(paper_id);
CREATE INDEX IF NOT EXISTS idx_odor_term ON odor_mentions(odor_term);
