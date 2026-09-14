# Cloudflare results — D1 / R2 / Workers

Live API: https://pregnancy-olfaction-api.a-8c6.workers.dev

## Resources

- D1: `pregnancy-olfaction-db` (id `ecd60c12-4002-47a1-8366-4291f6156d64`)
  - tables: `papers` (18), `findings` (27), `odor_mentions` (11), `mechanisms` (11), `gaps` (6)
  - source: `schema.sql` + `seed.sql` (extracts from repo `LITERATURE_REVIEW.md` / `NON_DUPLICATION.md` only; NULL = not stated)
- R2: `pregnancy-olfaction-pdfs`
  - `Cameron2014_Pregnancy_and_olfaction_a_review.pdf` (568,316 B)
  - `Dikici2017_Effects_of_pregnancy_on_olfaction.pdf` (91,087 B)
- Worker: `pregnancy-olfaction-api` (Hono, `src/index.ts`, `wrangler.toml`)

## Endpoints

- `GET /health`
- `GET /api/papers` / `GET /api/papers/:citeKey` (with findings + odors)
- `GET /api/findings?domain=&trimester=&direction=`
- `GET /api/odor-mentions`
- `GET /api/odor-relevance` — food-salient vs test-odor split + threshold outcomes
- `GET /api/claims` — claim-evidence matrix (C1 self-report / C2 threshold / C3 ID / C4 hedonics per paper), 15 rows
- `GET /api/mechanisms`
- `GET /api/gaps`
- `GET /api/pdfs` / `GET /api/pdfs/:key` (R2, open-access PDFs only)

## Key computed result (`GET /api/odor-relevance`, 2026-09-14)

- Hypothesis: no threshold study uses the food/spoilage odors women complain about; nulls cluster on non-food test odors (PEA, n-butanol).
- Salience: `food_salient=1` n=5 (cooking, spoiled food, coffee, meat); `food_salient=0` n=6 (smoke, perfume, cigarettes, fumes, PEA rose-like, n-butanol).
- Threshold outcomes in DB: `better` n=1 (LuvaraMurizi1961, confounded blast-injection + engorgement), `null` n=2 (Albaugh collapsed + Cameron PEA/d-prime).
- Frozen copy: `data/odor_relevance.json`. Full table dumps: `data/*.json`.

## Reproduce

```sh
npm install
wrangler d1 execute pregnancy-olfaction-db --remote --file=schema.sql
wrangler d1 execute pregnancy-olfaction-db --remote --file=seed.sql
wrangler deploy
```

R2 uploads (already done, remote):
```sh
wrangler r2 object put pregnancy-olfaction-pdfs/Cameron2014_Pregnancy_and_olfaction_a_review.pdf --file=../../pdfs/Cameron2014_Pregnancy_and_olfaction_a_review.pdf --content-type application/pdf --remote
wrangler r2 object put pregnancy-olfaction-pdfs/Dikici2017_Effects_of_pregnancy_on_olfaction.pdf --file=../../pdfs/Dikici2017_Effects_of_pregnancy_on_olfaction.pdf --content-type application/pdf --remote
```
