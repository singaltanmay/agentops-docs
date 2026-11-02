# Month 3 — Agentic Systems + MCP

**Phase P2 completes.** The hand-built agent becomes a platform-grade system:
rebuilt in **LangGraph** with **durable state** (Postgres checkpointer) and a
**human-approval gate**, its tools re-exposed as **your own MCP server** (local →
hosted on Container Apps → consumed by two independent clients), then finished
with **context engineering** (budgets, compaction, model routing), an **agent
UI** (streaming traces, approval inbox), and the observability/SLO layer Month 4
builds on.

Budget column: **≈$165**. Reading spine: LangChain Academy *Introduction to
LangGraph* + *Ambient Agents* (free, official), Anthropic Academy MCP courses,
Microsoft Learn's MCP-on-Container-Apps tutorial.

## The four weeks

| Week | Theme | Ends with |
|---|---|---|
| [Week 1](week-1/README.md) | LangGraph migration + durability + approval gate | Graph agent at eval parity; kill/resume proven; unapproved writes execute 0 times |
| [Week 2](week-2/README.md) | Your MCP server (local → hosted → multi-client) | `mcp-v1` contract frozen; two clients, per-client audit + revocation; threat-model draft |
| [Week 3](week-3/README.md) | Context engineering + agent UI | Context budgets + compaction with measured retention; model routing measured; UI drives gated tasks |
| [Week 4](week-4/README.md) | Tracing, SLOs, failure analysis II, ambient trigger | Span schema + weekly report live; taxonomy v2 with Month 4's top-3 targets; one event-driven run end to end |

## Month definition of done
- [ ] LangGraph agent at or above the `pre-langgraph-baseline` on the 50-task eval, deltas analysed per category (`langgraph-v1` run tagged)
- [ ] Checkpointer-backed durability: kill mid-task → resume with zero repeated tool calls; guarantees *and* their edges written from observation
- [ ] Approval gate: approve executes exactly once (idempotency), reject and expiry terminate cleanly, all gate events audited in Postgres
- [ ] MCP server exposes search / golden-set / eval tools; hosted over Streamable HTTP with auth; unauthenticated calls refused; cold-start latency recorded
- [ ] Two independent clients complete real calls against the hosted server; per-client audit + selective revocation demonstrated
- [ ] MCP hardening pass (validation, output caps, rate limits, audit) with an abuse suite green; contract frozen as `mcp-v1`
- [ ] Context budgets metered per section; compaction retains ≥4/5 planted facts on staged long tasks; model routing assignments tested, savings published either way
- [ ] Agent UI: streaming traces + approval inbox drive a gated task end to end, UI-only
- [ ] Long-task suite run with a context report (completion, retention, cost per success vs short tasks)
- [ ] Span schema + saved reconstruction query; weekly report computes SLOs for RAG / agent / MCP paths from real data
- [ ] Failure taxonomy v2 with counts; Month 4 top-3 eval targets named from evidence; threat model v1 committed
- [ ] Month spend within ≈$165 ±20%, variance explained in the retrospective
