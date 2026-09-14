import { Hono } from "hono";

type Env = {
  DB: D1Database;
  PDFS: R2Bucket;
};

const app = new Hono<{ Bindings: Env }>();

const ENDPOINTS = [
  "/health",
  "/api/papers",
  "/api/papers/:citeKey",
  "/api/findings?domain=&trimester=&direction=",
  "/api/odor-mentions",
  "/api/odor-relevance",
  "/api/mechanisms",
  "/api/gaps",
  "/api/pdfs",
  "/api/pdfs/:key",
];

// Root index (fixes 404 on bare worker URL in browsers)
app.get("/", (c) => {
  const url = new URL(c.req.url);
  const links = ENDPOINTS.map((e) => {
    const href = e.replace(/:[a-zA-Z]+/g, "").replace(/[?].*$/, "");
    return `<li><a href="${href}">${e}</a></li>`;
  }).join("");
  return c.html(
    `<!doctype html><html><head><meta charset="utf-8"><title>pregnancy-olfaction-api</title></head>` +
      `<body><h1>pregnancy-olfaction-api</h1>` +
      `<p>Base: ${url.origin}</p><ul>${links}</ul>` +
      `<p>Docs: <a href="https://github.com/aminamos/pregnancy-olfaction-research/blob/main/workers/api/CLOUDFLARE.md">CLOUDFLARE.md</a></p>` +
      `</body></html>`
  );
});

app.get("/health", (c) => c.json({ ok: true, service: "pregnancy-olfaction-api" }));

// Papers
app.get("/api/papers", async (c) => {
  const rs = await c.env.DB.prepare("SELECT * FROM papers ORDER BY year ASC, cite_key ASC").all();
  return c.json(rs.results);
});

app.get("/api/papers/:citeKey", async (c) => {
  const key = c.req.param("citeKey");
  const paper = await c.env.DB.prepare("SELECT * FROM papers WHERE cite_key = ?").bind(key).first();
  if (!paper) return c.json({ error: "not found" }, 404);
  const findings = await c.env.DB.prepare("SELECT * FROM findings WHERE paper_id = ?").bind(paper.id).all();
  const odors = await c.env.DB.prepare("SELECT * FROM odor_mentions WHERE paper_id = ?").bind(paper.id).all();
  return c.json({ paper, findings: findings.results, odors: odors.results });
});

// Findings with filters ?domain=&trimester=&direction=
app.get("/api/findings", async (c) => {
  const domain = c.req.query("domain");
  const trimester = c.req.query("trimester");
  const direction = c.req.query("direction");
  let sql = "SELECT f.*, p.cite_key, p.year FROM findings f JOIN papers p ON p.id = f.paper_id";
  const conds: string[] = [];
  const args: unknown[] = [];
  if (domain) { conds.push("f.domain = ?"); args.push(domain); }
  if (trimester) { conds.push("f.trimester = ?"); args.push(trimester); }
  if (direction) { conds.push("f.result_direction = ?"); args.push(direction); }
  if (conds.length) sql += " WHERE " + conds.join(" AND ");
  sql += " ORDER BY p.year ASC";
  const rs = await c.env.DB.prepare(sql).bind(...args).all();
  return c.json(rs.results);
});

// Odor mentions + relevance aggregation
app.get("/api/odor-mentions", async (c) => {
  const rs = await c.env.DB.prepare(
    "SELECT o.*, p.cite_key, p.year FROM odor_mentions o JOIN papers p ON p.id = o.paper_id ORDER BY o.food_salient DESC, o.odor_term ASC"
  ).all();
  return c.json(rs.results);
});

// Core solo angle: does food-salience predict the null pattern?
// Complaint odors (food-salient) vs lab test odors (not food-salient).
app.get("/api/odor-relevance", async (c) => {
  const salience = await c.env.DB.prepare(
    "SELECT food_salient, COUNT(*) as n, GROUP_CONCAT(DISTINCT odor_term) as terms FROM odor_mentions GROUP BY food_salient"
  ).all();
  const testNull = await c.env.DB.prepare(
    "SELECT domain, result_direction, COUNT(*) as n FROM findings WHERE domain = 'threshold' GROUP BY domain, result_direction"
  ).all();
  return c.json({
    hypothesis: "No threshold study uses the food/spoilage odors women complain about; nulls cluster on non-food test odors (PEA, n-butanol).",
    salience: salience.results,
    threshold_outcomes: testNull.results,
  });
});

// Claim-evidence matrix (tasks 1/2): stance per paper per claim
app.get("/api/claims", async (c) => {
  const rs = await c.env.DB.prepare("SELECT * FROM claim_evidence ORDER BY cite_key ASC").all();
  return c.json(rs.results);
});

// Mechanisms, gaps
app.get("/api/mechanisms", async (c) => {  const rs = await c.env.DB.prepare("SELECT * FROM mechanisms ORDER BY name ASC").all();
  return c.json(rs.results);
});

app.get("/api/gaps", async (c) => {
  const rs = await c.env.DB.prepare("SELECT * FROM gaps ORDER BY id ASC").all();
  return c.json(rs.results);
});

// R2 PDFs: list + fetch (open-access only: the 2 vendored PDFs)
app.get("/api/pdfs", async (c) => {
  const listed = await c.env.PDFS.list();
  return c.json(listed.objects.map((o) => ({ key: o.key, size: o.size, uploaded: o.uploaded })));
});

app.get("/api/pdfs/:key", async (c) => {
  const key = c.req.param("key");
  const obj = await c.env.PDFS.get(key);
  if (!obj) return c.json({ error: "not found" }, 404);
  const headers = new Headers();
  headers.set("Content-Type", "application/pdf");
  headers.set("Cache-Control", "public, max-age=86400");
  return new Response(obj.body, { headers });
});

export default app;
