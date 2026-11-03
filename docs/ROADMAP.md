# Roadmap — The Full 6-Month Trajectory

One system, four phases, then the interview phase. Start: late Oct 2026 →
late Apr 2027. Everything is Azure; monthly deployment spend must fit the
subscription's verified credit allowance. The original cost estimates are in USD,
while this learner's current Visual Studio billing period started with about
INR 12,500 in credit.
Everything is measured. Sequence is prerequisite order, not calendar order —
month boundaries below are the plan's shape, [PROGRESS.md](PROGRESS.md) is the truth.

## Target roles (why this trajectory)

| Rank | Role | Why it's the target |
|---|---|---|
| #1 | **Agentic / Applied AI Engineer** | Fastest-growing AI title (LinkedIn #1, 2025 and 2026); recruits from software engineering; no PhD gate in postings |
| #2 | **Forward Deployed AI Engineer** | Same build skills + customer deployment evidence — the Month 5 capstone is built to produce exactly that |
| #3 | **AI Platform / Agent Platform Engineer** | MCP, context engineering, eval systems named verbatim in postings; systems depth is the differentiator |

The wedge inside all three: **evals and observability**. ~89% of practitioners have
observability but only ~half run offline evals, and quality is the #1 barrier —
that gap is what P3 exploits. Research Scientist is explicitly excluded (research
track record is the gate, not buildable in 6 months). Fine-tuning is a single
comparative experiment, not a pillar: most production teams don't fine-tune.

## Phases and monthly outcomes

### Month 1 — Production RAG foundation · `month-1-production-rag/`
**Outcome:** a deployed, cited-answer RAG service over the Kubernetes corpus with a
frozen 160-question golden set and a Ragas report with numbers in it.
- W1: IaC (Bicep) + Azure foundation + walking skeleton (keyless completion from a deployed container)
- W2: ingestion pipeline (two paths) + chunking experiment matrix on a 30-Q probe set
- W3: 4-mode retrieval shootout (vector / BM25 / hybrid / hybrid+semantic ranker) + cited API + minimal UI
- W4: golden set `golden-v1.0` (160 Q, 30 held out) + first Ragas report + failure taxonomy
**Definition of done:** clean-state `azd up`/apply reproduces the environment; one
command re-indexes the corpus in <30 min for <$1; committed comparison tables for
chunking and retrieval; 100% of UI answers show ≥1 citation resolving to a real
chunk; Ragas report covers winning config + vector-only ablation, with eval cost
and a named top failure class + Month 2 fix.

### Month 2 — RAG hardening + agents begin · `month-2-rag-hardening-and-agents/`
**Outcome:** the RAG service is hardened and measured (Postgres joins; pgvector
comparison run as a deliberate experiment), and a raw, framework-free agent loop
runs on top of it.
**Definition of done:** ablation report committed (query rewriting, contextual
retrieval, embedding A/B — each kept or dropped on golden-set numbers); Postgres
B1ms holds app state + eval results; pgvector-vs-AI-Search verdict written from
measurements; raw ReAct loop beats the single-call RAG baseline on a multi-step
task set, or the failure analysis explains why not.

### Month 3 — Agentic systems + MCP · `month-3-agentic-systems-and-mcp/`
**Outcome:** the agent is rebuilt in LangGraph with durable state, a
human-approval gate, and your own MCP server deployed on Container Apps.
**Definition of done:** LangGraph agent with checkpoint/resume surviving a killed
process; your MCP server (search / golden-set / eval tools) over Streamable HTTP,
consumed by two different clients; approval gate blocks an unauthorised write in a
test; context engineering in place (budgets, compaction, note-taking); agent UI
streams traces and approvals; token/cost accounting per task.

### Month 4 — Evals, observability, security · `month-4-evals-observability-security/`
**Outcome:** the Workbench has a platform layer: tracing, a calibrated judge, CI
gates — and a red-team report with before/after attack numbers.
**Definition of done:** failure taxonomy from 100+ read traces; LLM judge
calibrated against your human labels with agreement reported (TPR/TNR, not just
%); promptfoo CI gate blocks a deliberately regressed prompt; per-step traces with
cost per successful outcome; 50+ attack suite mapped to OWASP LLM Top 10 with
attack-success rate measured before and after hardening; lethal-trifecta audit of
every tool combination.

### Month 5 — FDE capstone · `month-5-fde-capstone/`
**Outcome:** the system is deployed for a "customer" (real user if findable, else a
rigorous simulated enterprise brief), plus the read-only multi-agent extension and
the LoRA verdict.
**Definition of done:** deployment report (adoption/task outcome, eval scores in
the customer's domain, cost per successful outcome, field-findings → product
changes log); multi-agent read-only mode compared head-to-head against the
single-agent control on the same tasks; LoRA experiment run inside a capped,
pre-committed budget envelope with a keep/reject verdict from the eval harness;
runbook + MCP plug-in docs published.

### Month 6 — Interview phase · `month-6-interview-phase/`
**Outcome:** applications out from late Month 5 in parallel; every résumé claim
traces to a measured project result.
- W1: LLM system-design drills (support agent, research agent, doc QA, eval platform — quality/latency/cost/evals/security every time)
- W2: production-Python coding + live agent-trace debugging + senior-level DSA refresh
- W3: behavioural / FDE drills — customer-discovery role-play, ambiguous brief → shipped plan in 90 min, P1–P4 as STAR stories with numbers
- W4: mock loop + targeted applications (Tier A: roles #1–#3; Tier B: FDE; stretch: frontier Research Engineer)
**Definition of done:** three deep portfolio write-ups published (RAG ablations;
evals + judge calibration; red-team report); mock loop completed with a written
gap list; applications submitted; negotiation anchored to level, not just comp.

## Architecture (summary — full detail in resources/)

| Part | Choice | Note |
|---|---|---|
| Chat / generation | Azure OpenAI `gpt-4o-mini` | ~$6/mo at 10k queries; never PTU |
| Judge | `gpt-4.1-mini` (second deployment) | Stronger than the generator; sampled/eval traffic only |
| Embeddings | `text-embedding-3-small` | 3-large is an A/B experiment, not the default |
| Retrieval | Azure AI Search **Basic** | BM25 + vector + hybrid (RRF) + semantic ranker in one service |
| State | PostgreSQL Flexible **B1ms** + pgvector | Month 2+; state/checkpoints/eval results, not a second vector store by default |
| Apps | Container Apps (Consumption), scale-to-zero | FastAPI API, Next.js UI, MCP server (Month 3), ingestion Jobs |
| Secrets / observability | Key Vault + managed identity; App Insights + Log Analytics (capped) | Keyless where supported; daily log cap is mandatory |

## Original monthly cost model (USD)

The estimates below are in USD and fit the course's original $200/month model.
This learner's current Visual Studio billing period started with about INR 12,500
in credit, so these estimates are not automatically affordable under the current
subscription. Recalculate and trim paid-service scope before deploying each
month's resources.

| Line | M1 | M2 | M3 | M4 | M5 | M6 |
|---|---:|---:|---:|---:|---:|---:|
| AI Search Basic | 73.73 | 73.73 | 73.73 | 73.73 | 73.73 | 73.73 |
| Azure OpenAI (chat + judge + embeddings) | 18 | 30 | 35 | 30 | 25 | 35 |
| Container Apps | 10 | 15 | 12 | 12 | 12 | 20 |
| PostgreSQL B1ms + storage (est.) | 0 | 17 | 17 | 17 | 17 | 17 |
| Container Registry Basic (approx.) | 5 | 5 | 5 | 5 | 5 | 5 |
| Blob + Key Vault | 1 | 1 | 2 | 3 | 2 | 3 |
| App Insights / Log Analytics | 8 | 10 | 18 | 12 | 10 | 15 |
| Content Safety | 0 | 0 | 2 | 8 | 2 | 5 |
| Azure ML GPU LoRA envelope (M5 only) | 0 | 0 | 0 | 0 | 40 | 0 |
| **Total** | **≈116** | **≈152** | **≈165** | **≈161** | **≈187** | **≈174** |

Budget blowers, banned by design: AI Search Standard S1 ($245.28 alone), Azure
OpenAI PTU (~$3,900/mo floor), Postgres B4ms, GPU compute left running, Log
Analytics without a daily cap. Month 1 may start on AI Search **Free** (~2 weeks)
— Basic is budgeted for the full month so the plan survives the Free ceiling.
Full cost-control practices: [resources/azure-architecture-and-budget.md](resources/azure-architecture-and-budget.md).

## Dataset (summary)

**Primary:** Kubernetes documentation (Concepts + Tasks, pinned release branch) +
filtered closed GitHub issues (closed + labelled + answered). Golden set recipe:
~60% docs-derived, ~25% issue-derived (answers re-verified against pinned docs),
~15% adversarial/unanswerable where the correct behaviour is refusal.
**Fallback:** SEC EDGAR (8 companies, 10-K/10-Q, 3 years) — switch if K8s
memorisation makes retrieval experiments uninformative. Ingestion and eval code
must stay corpus-agnostic enough that the switch costs days, not weeks.
Full comparison: [resources/datasets.md](resources/datasets.md).

## Non-negotiables (what separates this from a tutorial portfolio)

Every phase ships with: (a) a golden set built *before* tuning, (b) a baseline it
beats or a failure analysis, (c) cost + latency next to quality, (d) traces a
hiring manager can inspect, (e) a security section.
