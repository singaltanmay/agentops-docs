# Week 3 — 4-Mode Retrieval + Cited API/UI

**Week goal:** measure the four retrieval modes on the same questions, ship the
winner behind a cited-answer API, and put a minimal UI in front of it — deployed
by CI on merge. Issues mining for the Week 4 golden set begins.

**The shootout:** vector-only vs BM25-only vs hybrid (RRF) vs hybrid + semantic
ranker, on the probe set + 30 new questions, using Week 2's winning chunking.
Then the product slice: `POST /ask` → hybrid+semantic retrieval (top-k from the
experiment, not guessed) → `gpt-4o-mini` with a stable, cacheable system-prompt
prefix and **structured output** (answer + citations[] with chunk IDs +
`answerable: bool`). The `audience` metadata + OData filter field lands now as the
access-control seam (real per-user trimming is Month 4).

| Day | Type | Title |
|---|---|---|
| [15](day-15.md) | Build · 75 min | Retrieval I — vector vs BM25 vs hybrid, honestly compared |
| [16](day-16.md) | Apply · 75 min | Retrieval II — semantic ranker + the winner ships |
| [17](day-17.md) | Build · 60 min (light) | Cited-answer API — structured outputs + refusals |
| [18](day-18.md) | Long build · 2–3 hrs | Minimal UI + per-stage tracing |
| [19](day-19.md) | Review · 60–90 min | Rest / review — retrieval consolidation |
| [20](day-20.md) | Build · 75 min | CI/CD — deploy on merge, from GitHub Actions |
| [21](day-21.md) | Gate · 75 min | Week 3 gate — the product, audited |

**Week definition of done:** committed 4-mode comparison table (Recall@10 +
hand-scored answer correctness on 30 Q); `/ask` p95 latency measured and recorded;
100% of UI answers display ≥1 citation resolving to a real chunk; unanswerable
probes return `answerable=false` in ≥80% of cases; both containers deploy via
GitHub Actions on merge to main; App Insights traces exist per stage
(retrieve / rerank / generate) with token + latency attributes.
