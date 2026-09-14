import { describe, expect, it } from "vitest";
import app from "./index";

// Minimal D1/R2 mocks dispatching on SQL substring.
function mockDb(handlers: Array<{ match: string; results: unknown[]; first?: unknown }>) {
  return {
    prepare: (sql: string) => {
      const h = handlers.find((x) => sql.includes(x.match));
      const results = h?.results ?? [];
      const firstVal = h && "first" in h ? h.first : results[0] ?? null;
      return {
        bind: (..._args: unknown[]) => ({
          all: async () => ({ results }),
          first: async () => firstVal,
        }),
        all: async () => ({ results }),
        first: async () => firstVal,
      };
    },
  };
}

const mockR2List = (objects: Array<{ key: string; size: number; uploaded: string }>) => ({
  list: async () => ({ objects }),
  get: async (_key: string) => null,
});

function envFor(db: unknown, r2: unknown) {
  return { DB: db, PDFS: r2 } as never;
}

describe("root + health", () => {
  it("GET / returns index HTML (no 404)", async () => {
    const res = await app.request("/", {}, envFor(mockDb([]), mockR2List([])));
    expect(res.status).toBe(200);
    const text = await res.text();
    expect(text).toContain("pregnancy-olfaction-api");
    expect(text).toContain("/api/papers");
  });

  it("GET /health returns ok", async () => {
    const res = await app.request("/health", {}, envFor(mockDb([]), mockR2List([])));
    expect(res.status).toBe(200);
    expect(await res.json()).toEqual({ ok: true, service: "pregnancy-olfaction-api" });
  });
});

describe("papers", () => {
  const papers = [{ id: 1, cite_key: "Nordin2004-ChemSenses", year: 2004 }];

  it("GET /api/papers returns rows", async () => {
    const db = mockDb([{ match: "FROM papers ORDER BY", results: papers }]);
    const res = await app.request("/api/papers", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(200);
    expect(await res.json()).toEqual(papers);
  });

  it("GET /api/papers/:citeKey returns paper + findings + odors", async () => {
    const db = mockDb([
      { match: "FROM papers WHERE cite_key", results: papers, first: papers[0] },
      { match: "FROM findings WHERE paper_id", results: [{ id: 10, pct: 67 }] },
      { match: "FROM odor_mentions WHERE paper_id", results: [{ odor_term: "coffee" }] },
    ]);
    const res = await app.request("/api/papers/Nordin2004-ChemSenses", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(200);
    const body = await res.json();
    expect(body.paper.cite_key).toBe("Nordin2004-ChemSenses");
    expect(body.findings).toHaveLength(1);
    expect(body.odors).toHaveLength(1);
  });

  it("GET /api/papers/:citeKey 404 when missing", async () => {
    const db = mockDb([{ match: "FROM papers WHERE cite_key", results: [], first: null }]);
    const res = await app.request("/api/papers/NOPE", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(404);
  });
});

describe("findings + odors", () => {
  it("GET /api/findings passes filters through", async () => {
    let seenSql = "";
    let seenArgs: unknown[] = [];
    const db = {
      prepare: (sql: string) => ({
        bind: (...args: unknown[]) => {
          seenSql = sql;
          seenArgs = args;
          return { all: async () => ({ results: [] }), first: async () => null };
        },
        all: async () => ({ results: [] }),
        first: async () => null,
      }),
    };
    const res = await app.request("/api/findings?domain=self-report&trimester=T1", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(200);
    expect(seenSql).toContain("f.domain = ?");
    expect(seenSql).toContain("f.trimester = ?");
    expect(seenArgs).toEqual(["self-report", "T1"]);
  });

  it("GET /api/odor-relevance returns hypothesis + splits", async () => {
    const db = mockDb([
      { match: "FROM odor_mentions GROUP BY", results: [{ food_salient: 1, n: 5, terms: "coffee,meat" }] },
      { match: "WHERE domain = 'threshold'", results: [{ domain: "threshold", result_direction: "null", n: 2 }] },
    ]);
    const res = await app.request("/api/odor-relevance", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(200);
    const body = await res.json();
    expect(body.hypothesis).toContain("food/spoilage");
    expect(body.salience).toHaveLength(1);
    expect(body.threshold_outcomes).toHaveLength(1);
  });
});

describe("mechanisms, gaps, pdfs", () => {
  it("GET /api/mechanisms + /api/gaps", async () => {    const db = mockDb([
      { match: "FROM mechanisms", results: [{ name: "hCG-timing" }] },
      { match: "FROM gaps", results: [{ title: "hCG-olfaction evidence map" }] },
    ]);
    const mech = await app.request("/api/mechanisms", {}, envFor(db, mockR2List([])));
    expect(mech.status).toBe(200);
    expect(await mech.json()).toEqual([{ name: "hCG-timing" }]);
    const gaps = await app.request("/api/gaps", {}, envFor(db, mockR2List([])));
    expect(gaps.status).toBe(200);
  });

  it("GET /api/claims returns claim-evidence matrix", async () => {
    const db = mockDb([
      { match: "FROM claim_evidence", results: [{ cite_key: "Albaugh2022-ChemSenses", c2_threshold: "NULL" }] },
    ]);
    const res = await app.request("/api/claims", {}, envFor(db, mockR2List([])));
    expect(res.status).toBe(200);
    expect(await res.json()).toEqual([{ cite_key: "Albaugh2022-ChemSenses", c2_threshold: "NULL" }]);
  });

  it("GET /api/pdfs lists R2 objects", async () => {
    const r2 = mockR2List([{ key: "a.pdf", size: 10, uploaded: "2026-09-14" }]);
    const res = await app.request("/api/pdfs", {}, envFor(mockDb([]), r2));
    expect(res.status).toBe(200);
    expect(await res.json()).toEqual([{ key: "a.pdf", size: 10, uploaded: "2026-09-14" }]);
  });

  it("GET /api/pdfs/:key 404 when missing, pdf bytes when present", async () => {
    const miss = await app.request("/api/pdfs/nope.pdf", {}, envFor(mockDb([]), mockR2List([])));
    expect(miss.status).toBe(404);
    const r2hit = {
      list: async () => ({ objects: [] }),
      get: async (_k: string) => ({ body: "PDFBYTES" }),
    };
    const hit = await app.request("/api/pdfs/a.pdf", {}, envFor(mockDb([]), r2hit));
    expect(hit.status).toBe(200);
    expect(hit.headers.get("Content-Type")).toBe("application/pdf");
  });
});

describe("unknown routes", () => {
  it("GET /nope still 404", async () => {
    const res = await app.request("/nope", {}, envFor(mockDb([]), mockR2List([])));
    expect(res.status).toBe(404);
  });
});
