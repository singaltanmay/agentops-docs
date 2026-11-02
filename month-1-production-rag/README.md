# Month 1 — Production RAG Foundation

**Phase P1 (part 1 of 2).** Goal: a production-shaped RAG service on Azure —
ingestion, hybrid retrieval, reranking, cited answers — ending not with a demo but
with a **number**: a frozen 160-question golden set and a Ragas report comparing
retrieval configurations.

Days are sequence numbers, not dates. Advance on evidence ([../HOW-WE-LEARN.md](../HOW-WE-LEARN.md)).
Standing rules for the month:
- Everything in Bicep from Day 2 — no portal-created resource survives the weekend (Day 1's budget is the one exception).
- Every experiment is a script + a results file committed to the project repo.
- No chunking/embedding/retrieval opinion is accepted without a golden-set number behind it.
- 15-minute cost + progress review closes every week (Cost Management vs the Month 1 budget column: ≈$116).

## The four weeks

| Week | Theme | Days | Ends with |
|---|---|---|---|
| [Week 1](week-1/README.md) | IaC + walking skeleton | 1–7 | Clean-state redeploy, unaided; keyless live completion from a deployed container |
| [Week 2](week-2/README.md) | Ingestion + chunking matrix | 8–14 | One-command full reindex; ≥4 chunking configs compared on Recall@5/@10; a written winner |
| [Week 3](week-3/README.md) | 4-mode retrieval + cited API/UI | 15–21 | Retrieval shootout table; `/ask` with citations + refusals; CI deploys on merge |
| [Week 4](week-4/README.md) | Golden set + first Ragas report | 22–31 | `golden-v1.0` frozen (160 Q, 30 held out); Ragas report + failure taxonomy; Month 1 retrospective |

## Month definition of done
- [ ] `azd up` / apply from a clean subscription state reproduces the whole environment
- [ ] One command re-indexes the full scoped corpus in <30 min for <$1 of embedding spend; index counts reconcile with pipeline counts (zero silent drops, or every drop logged)
- [ ] Committed comparison tables: ≥4 chunking configs (Recall@5/@10) and 4 retrieval modes (Recall@10 + hand-scored correctness on 30 Q)
- [ ] `/ask` returns structured output (answer + citations[] with chunk IDs + `answerable` bool); 100% of UI answers display ≥1 citation resolving to a real chunk; unanswerable probes refused in ≥80% of cases
- [ ] `/ask` p95 latency measured and recorded (target <4 s at this scale — state the actual number)
- [ ] `golden-v1.0` committed: ≥150 rows (target 160) with the ~60/25/15 docs/issue/adversarial mix; 30-Q held-out slice never tuned against
- [ ] Ragas report committed: Faithfulness, LLMContextRecall, LLMContextPrecisionWithReference, FactualCorrectness for the winning config **and** the vector-only ablation, plus per-question failure CSV, eval run cost + wall-time
- [ ] Failure taxonomy with counts; top failure class has a named Month 2 fix
- [ ] Retrospective committed: actual Azure spend vs ≈$116 budget (within ±20%), what the numbers changed your mind about, Month 2 backlog written as issues

Dataset: Kubernetes docs (Concepts + Tasks) + filtered closed issues — [../resources/datasets.md](../resources/datasets.md).
Watch/do pointers are inside each day file (Microsoft Learn FastAPI→Container Apps
tutorial, azure-search-openai-demo ingestion docs, Pamela Fox's RAGHack session,
Hamel Husain's "Your AI Product Needs Evals", Ragas docs).
