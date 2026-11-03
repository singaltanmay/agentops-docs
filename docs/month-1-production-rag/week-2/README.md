# Week 2 — Ingestion + Chunking Matrix

**Week goal:** two interchangeable ingestion paths (your own heading-aware parser,
and AI Search integrated vectorization) feeding one index design — and a chunking
decision made from Recall numbers, not taste. AI Search moves Free → Basic when
the 50 MB / 3-index ceiling bites.

**Experiment matrix** (on the fixed 30-question probe set built this week):
{heading-aware ~800 tok, heading-aware ~400 tok, fixed 1,000-char/10%-overlap (the
azure-search-openai-demo baseline), fixed 500-char} × {text-embedding-3-small,
-3-large on one config}. Log Recall@5/@10 per config. Results artefacts are
versioned JSON/CSV in Blob for now — Postgres arrives in Month 2.

| Day | Type | Title |
|---|---|---|
| [8](day-08.md) | Build · 75 min | Ingestion I — your own heading-aware parser |
| [9](day-09.md) | Build · 75 min | Chunking — four configurations, one index design |
| [10](day-10.md) | Apply · 60 min (light) | The probe set — 30 questions with known answers |
| [11](day-11.md) | Long build · 2–3 hrs | Ingestion II — integrated vectorization, head-to-head |
| [12](day-12.md) | Review · 60–90 min | Rest / review — Week 2 mixed check so far |
| [13](day-13.md) | Apply · 75 min | Embeddings A/B + the chunking decision |
| [14](day-14.md) | Gate · 75 min | Week 2 gate — one-command reindex, reconciled |

**Week definition of done:** one command re-indexes the full scoped corpus from
scratch in <30 min for <$1; committed results table compares ≥4 chunking configs;
written decision ("config X wins because…") with the losers' numbers kept; index
document/chunk counts match the pipeline's own counts — indexer errors = 0 or
explicitly logged.
