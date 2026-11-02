# Week 4 — Golden Set + First Ragas Report

**Week goal:** build the instrument the rest of the course runs on — a frozen
160-question golden set — then run the first real eval and, more importantly,
read every failure yourself. Days 29–31 include the buffer/polish the original
plan reserved for the month's final days.

**Golden set:** target **160 questions** — ~95 docs-derived, ~40 issue-derived
(answers re-verified against pinned docs), ~25 unanswerable/adversarial. Each row:
question, reference answer, source page, expected chunk ID(s), category (factoid /
how-to / config-YAML / troubleshooting / multi-hop / unanswerable). Frozen as
`golden-v1.0`; a 30-question held-out slice is never tuned against.

**Eval:** Ragas (current API) with `gpt-4.1-mini` as judge — Faithfulness,
LLMContextRecall, LLMContextPrecisionWithReference, FactualCorrectness — for the
Week 3 winning config **and** the vector-only ablation. Then Hamel-style failure
analysis: open-code every failing trace into a taxonomy (retrieval miss / wrong
chunk ranked / generation ignored context / question ambiguous / golden answer
wrong) and count them. The taxonomy is the deliverable that sets up Months 2–3.

| Day | Type | Title |
|---|---|---|
| [22](day-22.md) | Build · 75 min | Golden set I — design + first docs-derived batch |
| [23](day-23.md) | Apply · 75 min | Golden set II — docs batch 2 + multi-hop |
| [24](day-24.md) | Build · 60 min (light) | Golden set III — issue-derived troubleshooting rows |
| [25](day-25.md) | Long build · 2–3 hrs | Golden set IV — adversarial rows + freeze golden-v1.0 |
| [26](day-26.md) | Review · 60–90 min | Rest / review — evals readiness check |
| [27](day-27.md) | Build · 75 min | Ragas wiring — 20 rows before 160 |
| [28](day-28.md) | Apply · 75 min | The first Ragas report — winner vs ablation |
| [29](day-29.md) | Build · 75 min | Failure analysis — the taxonomy is the deliverable |
| [30](day-30.md) | Gate · 75 min | Month 1 retrospective — spend, surprises, Month 2 backlog |
| [31](day-31.md) | Buffer · flexible | Buffer / polish — close the month clean |

**Week definition of done:** `golden-v1.0` committed with ≥150 rows and the
category mix above; Ragas report committed with per-metric scores for ≥2 configs,
per-question failure CSV, and the eval run's own cost + wall-time; failure
taxonomy with counts and a named Month 2 fix for the top class; Month 1
retrospective: actual spend vs ≈$116 (target within ±20%).
