# Month 2 — RAG Hardening + Agents Begin

**Phase P1 completes; Phase P2 begins.** Two movements: (1) harden and finish
measuring the RAG service — scripted ablations of query-side techniques, Postgres
joins as the state layer, and the pgvector comparison run as a deliberate
experiment; (2) build the agent **raw** — the loop by hand, tool design, budgets,
then the workflow patterns (routing, evaluator-optimizer, parallelization) — and
freeze a 50-task benchmark with a tagged baseline run.

LangGraph and the MCP server land in Month 3, on top of this month's hand-built
loop and frozen measurements — the migration is only meaningful because the
baseline exists.

Budget column: **≈$152** (Postgres B1ms + storage joins at ~$17; see
[../resources/azure-architecture-and-budget.md](../resources/azure-architecture-and-budget.md)).

## The four weeks

| Week | Theme | Ends with |
|---|---|---|
| [Week 1](week-1/README.md) | Ablation harness + query techniques (rewriting, HyDE, contextual retrieval) | Every technique kept/dropped on tuning-split numbers; ablation table v1 |
| [Week 2](week-2/README.md) | Postgres state layer + pgvector experiment | App state + eval results in Postgres; pgvector-vs-Search verdict from a head-to-head |
| [Week 3](week-3/README.md) | The raw agent loop + tools + budgets | Working ReAct loop, 3 scoped tools, 4 budget controls, 50-task benchmark vs RAG baseline |
| [Week 4](week-4/README.md) | Workflow patterns + agent eval wiring | Router, evaluator-optimizer, parallel reads — each measured; `pre-langgraph-baseline` run tagged |

## Month definition of done
- [ ] Ablation report published: rewriting / HyDE / contextual retrieval / reranker-depth / top-k, each with a keep-drop verdict traceable to a run ID
- [ ] Postgres B1ms holds app state, feedback labels, and all eval runs/results; historical CSVs imported
- [ ] pgvector head-to-head run (vector-only vs vector-only vs hybrid) with a written verdict naming pgvector's role (or lack of one) and its reversal conditions
- [ ] Raw agent loop completes multi-step tasks with full traces; 3 tools carry written privilege statements
- [ ] Four budget controls each demonstrated stopping a runaway gracefully
- [ ] 50-task benchmark: agent vs single-call RAG baseline on success, steps, cost/latency per successful task, failures coded to taxonomy v1
- [ ] Router / evaluator-optimizer / parallelization each measured and kept, gated, or dropped on numbers
- [ ] Agent eval is a standing harness mode; `pre-langgraph-baseline` full run tagged in Postgres
- [ ] Month spend within ≈$152 ±20%, variance explained in the retrospective
