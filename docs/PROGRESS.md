# Progress — Tracker + Evidence Log

One row per lesson. **Status values:** `not started` · `in progress` · `assisted` · `mastered`.

- `assisted` = completed, but at least one step was demonstrated for you (hint-ladder bottom-out). Carries a **repair probe within 48 h**; the status only becomes `mastered` when that probe passes unaided.
- `mastered` = independent verification passed **and** the unaided probe passed, on evidence — never on self-report (see [HOW-WE-LEARN.md](HOW-WE-LEARN.md)).
- A status change without an evidence-log entry (below) does not count.

## Month 1 — Production RAG (Days 1–31)

| ✓ | Day | Lesson | Status |
|---|---|---|---|
| ☐ | 1 | Toolchain, repo, and the budget | in progress |
| ☐ | 2 | Bicep core I — storage, secrets, monitoring with caps | not started |
| ☐ | 3 | Bicep core II — Azure OpenAI + AI Search Free | not started |
| ☐ | 4 | Keyless access — managed identity + RBAC | not started |
| ☐ | 5 | Walking skeleton — live completion from a container | not started |
| ☐ | 6 | The corpus — Kubernetes docs, pinned and counted | not started |
| ☐ | 7 | Week 1 gate — teardown and clean redeploy | not started |
| ☐ | 8 | Ingestion I — your own heading-aware parser | not started |
| ☐ | 9 | Chunking — four configurations, one index design | not started |
| ☐ | 10 | The probe set — 30 questions with known answers | not started |
| ☐ | 11 | Ingestion II — integrated vectorization, head-to-head | not started |
| ☐ | 12 | Rest / review — Week 2 mixed check so far | not started |
| ☐ | 13 | Embeddings A/B + the chunking decision | not started |
| ☐ | 14 | Week 2 gate — one-command reindex, reconciled | not started |
| ☐ | 15 | Retrieval I — vector vs BM25 vs hybrid, honestly compared | not started |
| ☐ | 16 | Retrieval II — semantic ranker + the winner ships | not started |
| ☐ | 17 | Cited-answer API — structured outputs + refusals | not started |
| ☐ | 18 | Minimal UI + per-stage tracing | not started |
| ☐ | 19 | Rest / review — retrieval consolidation | not started |
| ☐ | 20 | CI/CD — deploy on merge, from GitHub Actions | not started |
| ☐ | 21 | Week 3 gate — the product, audited | not started |
| ☐ | 22 | Golden set I — design + first docs-derived batch | not started |
| ☐ | 23 | Golden set II — docs batch 2 + multi-hop | not started |
| ☐ | 24 | Golden set III — issue-derived troubleshooting rows | not started |
| ☐ | 25 | Golden set IV — adversarial rows + freeze golden-v1.0 | not started |
| ☐ | 26 | Rest / review — evals readiness check | not started |
| ☐ | 27 | Ragas wiring — 20 rows before 160 | not started |
| ☐ | 28 | The first Ragas report — winner vs ablation | not started |
| ☐ | 29 | Failure analysis — the taxonomy is the deliverable | not started |
| ☐ | 30 | Month 1 retrospective — spend, surprises, Month 2 backlog | not started |
| ☐ | 31 | Buffer / polish — close the month clean | not started |

## Month 2 — RAG Hardening + Agents

| Lesson | Title | Status |
|---|---|---|
| W1·L1 | Ablation harness — freeze the experiment protocol | not started |
| W1·L2 | Query rewriting — multi-query and decomposition, measured | not started |
| W1·L3 | HyDE-style hypothetical-document retrieval, measured | not started |
| W1·L4 | Contextual retrieval — chunk context prefixes, measured | not started |
| W1·L5 | Consolidation — ablation table v1 and the Week 1 mixed gate | not started |
| W1·L6 | Deep build — reranker depth and top-k sweep; ablation report draft | not started |
| W2·L1 | Postgres joins — provision B1ms in IaC with stop/start discipline | not started |
| W2·L2 | App-state schema — users, conversations, feedback labels | not started |
| W2·L3 | Eval results move to Postgres | not started |
| W2·L4 | pgvector on the same instance — corpus copy indexed | not started |
| W2·L5 | Consolidation — state-layer mixed gate + LangGraph state design prep | not started |
| W2·L6 | Deep build — pgvector vs AI Search head-to-head + verdict | not started |
| W3·L1 | The raw agent loop — ReAct without a framework | not started |
| W3·L2 | Tool design — schemas, error returns, and least privilege | not started |
| W3·L3 | Stopping, budgets, and loop safety | not started |
| W3·L4 | More tools — calculator/code sandbox and issue lookup, scoped | not started |
| W3·L5 | Consolidation — agent failure taxonomy v1 + mixed gate | not started |
| W3·L6 | Deep build — the 50-task multi-step benchmark: agent vs RAG baseline | not started |
| W4·L1 | Routing — classify first, then commit to a path | not started |
| W4·L2 | Evaluator-optimizer — generate, judge, revise, measured | not started |
| W4·L3 | Parallelization — fan out independent sub-questions (read-only) | not started |
| W4·L4 | Agent eval wiring — success, cost, and failure, per run | not started |
| W4·L5 | Consolidation — Month 2 mixed gate | not started |
| W4·L6 | Deep build — Month 2 gate: ablation report published + agent v1 review | not started |

## Month 3 — Agentic Systems + MCP

| Lesson | Title | Status |
|---|---|---|
| W1·L1 | LangGraph rebuild I — the raw loop as a state graph | not started |
| W1·L2 | LangGraph rebuild II — workflow patterns as subgraphs | not started |
| W1·L3 | Durable state — Postgres checkpointer and resume | not started |
| W1·L4 | The human-approval gate — a write tool, paused for a human | not started |
| W1·L5 | Consolidation — migration mixed gate + durability drills | not started |
| W1·L6 | Deep build — migration review: graph agent on the full benchmark | not started |
| W2·L1 | MCP fundamentals — your tools as a protocol server (local) | not started |
| W2·L2 | The full tool surface over MCP — golden-set and eval tools | not started |
| W2·L3 | Host the MCP server — Streamable HTTP on Container Apps | not started |
| W2·L4 | Two clients, one server — the agent and an external client | not started |
| W2·L5 | Consolidation — MCP mixed gate + threat-model draft | not started |
| W2·L6 | Deep build — MCP server hardening pass + contract freeze | not started |
| W3·L1 | Context budgets — what the model sees, metered | not started |
| W3·L2 | Compaction + structured note-taking | not started |
| W3·L3 | Model routing — cost/latency tiers inside the agent | not started |
| W3·L4 | The agent UI — streaming traces and approval gates in TypeScript | not started |
| W3·L5 | Consolidation — context-engineering mixed gate | not started |
| W3·L6 | Deep build — long-task endurance run + context report | not started |
| W4·L1 | Online traces — per-step tracing with cost per outcome | not started |
| W4·L2 | Cost/latency routing across the whole system + SLOs | not started |
| W4·L3 | Failure analysis II — agent traces at volume | not started |
| W4·L4 | Month 3 integration — the ambient pattern: event-driven trigger | not started |
| W4·L5 | Consolidation — Month 3 mixed gate | not started |
| W4·L6 | Deep build — Month 3 gate: full-system review + Month 4 readiness | not started |

## Month 4 — Evals, Observability & Security

| Lesson | Title | Status |
|---|---|---|
| W1·L1 | One eval runner — RAG and agent suites behind a single harness | not started |
| W1·L2 | Deterministic checks first — the scorer layer that isn't a judge | not started |
| W1·L3 | Failure-analysis sprint — 100 traces, read by you | not started |
| W1·L4 | Eval design from the taxonomy — per-category eval specs | not started |
| W1·L5 | Consolidation — evals mixed gate + labelling prep | not started |
| W1·L6 | Deep build — the eval platform v1 freeze | not started |
| W2·L1 | Human labelling sprint — 120 outputs, your labels | not started |
| W2·L2 | Binary judges per category — build and first light | not started |
| W2·L3 | Calibration I — fix the judge from its disagreements | not started |
| W2·L4 | Calibration II — judge bias checks (position, verbosity, self-preference) | not started |
| W2·L5 | Consolidation — calibration mixed gate | not started |
| W2·L6 | Deep build — online eval wiring: sampled production scoring | not started |
| W3·L1 | promptfoo as the CI harness — eval suites in CI shape | not started |
| W3·L2 | The regression gate — thresholds, baselines, and the red-run drill | not started |
| W3·L3 | Nightly deep eval + drift watch | not started |
| W3·L4 | Observability deepening — dashboards from the span schema | not started |
| W3·L5 | Consolidation — gates mixed gate + red-team prep | not started |
| W3·L6 | Deep build — gate hardening rehearsal: break it, fix it, prove it | not started |
| W4·L1 | Red team I — promptfoo redteam suite against your own system | not started |
| W4·L2 | Red team II — fixed sets: injections corpus + AgentDojo | not started |
| W4·L3 | The lethal-trifecta audit — tool combinations, not tools | not started |
| W4·L4 | Hardening + Prompt Shields — defence in depth, measured | not started |
| W4·L5 | Consolidation — security mixed gate + Month 4 evidence review | not started |
| W4·L6 | Deep build — Month 4 gate: full platform regression + security re-test | not started |

## Month 5 — FDE Capstone

| Lesson | Title | Status |
|---|---|---|
| W1·L1 | The customer brief — scope, constraints, success criteria | not started |
| W1·L2 | Messy data onboarding — the customer's corpus, honestly | not started |
| W1·L3 | Permissions become real — document-level access control | not started |
| W1·L4 | The customer golden set — evals in the customer's domain | not started |
| W1·L5 | Consolidation — deployment-readiness gate | not started |
| W1·L6 | Deep build — deployment v1: the customer environment | not started |
| W2·L1 | Field findings loop I — first usage, first fixes | not started |
| W2·L2 | The requirement change — absorb it like an FDE | not started |
| W2·L3 | Customer-domain tuning — close the measured gaps | not started |
| W2·L4 | Adoption + outcome measurement — did it work for the customer? | not started |
| W2·L5 | Consolidation — capstone mixed gate (deployment half) | not started |
| W2·L6 | Deep build — deployment report v1 + stakeholder review | not started |
| W3·L1 | Read-only multi-agent design — orchestrator-workers, scoped hard | not started |
| W3·L2 | Build the orchestrator-workers extension | not started |
| W3·L3 | The head-to-head — multi-agent vs single-agent control | not started |
| W3·L4 | LoRA experiment I — dataset from failure data + the envelope | not started |
| W3·L5 | LoRA experiment II — run it, eval it, verdict it | not started |
| W3·L6 | Deep build — extensions integrated: multi mode + LoRA verdict into the deployment | not started |
| W4·L1 | Hardening I — load, caching, and cost optimisation | not started |
| W4·L2 | Hardening II — failure drills: kill things on purpose | not started |
| W4·L3 | The runbook — operate the Workbench without you | not started |
| W4·L4 | Platform packaging — MCP plug-in docs + onboarding another tool | not started |
| W4·L5 | Consolidation — capstone mixed gate (extensions + ops) | not started |
| W4·L6 | Deep build — Month 5 gate: the whole system, reviewed as a product | not started |

## Month 6 — Interview Phase

| Lesson | Title | Status |
|---|---|---|
| W1·L1 | The system-design frame — quality / latency / cost / evals / security, every time | not started |
| W1·L2 | Write-up 1 — the RAG ablation story, published | not started |
| W1·L3 | Timed design #2 — the research agent (multi-source, citations, cost honesty) | not started |
| W1·L4 | Write-up 2 — the evals + judge-calibration story, published | not started |
| W1·L5 | Consolidation — design-drill mixed gate + frame card freeze | not started |
| W1·L6 | Deep build — two full designs back-to-back (eval platform + doc-QA at scale) | not started |
| W2·L1 | Write-up 3 — the red-team story, published + portfolio index | not started |
| W2·L2 | Coding reps I — production Python under interview conditions | not started |
| W2·L3 | Live trace-debugging drill — diagnose an agent from its trace | not started |
| W2·L4 | Coding reps II — DSA refresh at senior-SWE level | not started |
| W2·L5 | Consolidation — coding mixed gate | not started |
| W2·L6 | Deep build — the full timed coding set + demo environment check | not started |
| W3·L1 | The story bank — P1–P4 as STAR stories with numbers | not started |
| W3·L2 | FDE drill I — customer discovery role-play | not started |
| W3·L3 | FDE drill II — ambiguous brief → shipped plan in 90 minutes | not started |
| W3·L4 | Behavioural reps — the hard questions, answered from the bank | not started |
| W3·L5 | Consolidation — narrative mixed gate + applications audit | not started |
| W3·L6 | Deep build — the full FDE exercise: discovery → plan → pitch, end to end | not started |
| W4·L1 | Mock loop I — system design + project deep-dive | not started |
| W4·L2 | Mock loop II — coding screen + behavioural, back-to-back | not started |
| W4·L3 | The repair sprint — close the final gap set | not started |
| W4·L4 | Targeted application wave — fit-first, evidence-attached | not started |
| W4·L5 | Consolidation — final readiness gate | not started |
| W4·L6 | Deep build — negotiation prep + the course retrospective | not started |

## Evidence log

One entry per status change. Format:

```
### <Month/Day or Lesson ID> — <new status> — <date>
- Checkpoint: <what was run> → <observed result vs expected>
- Probe: <type: generative/prediction/transfer/planted-bug/teach-back> → <result>
- Confidence calibration: <stated % vs outcome, where notable>
- Notes: <error class of any failure; repair-probe due date if assisted>
```

### Month 1 / Day 1 — in progress — 2026-11-03

- Checkpoint: all six toolchain version commands passed: Azure CLI 2.91.0,
  Docker CLI 29.1.3, Python 3.14.4, Node 22.22.1, Git 2.53.0, GitHub CLI
  2.46.0. Python and Node satisfy the lesson minimums.
- Implementation: agent-created scaffold at the existing project repository root
  with `app/`, `infra/`, `ingestion/`, `evals/`, `data/`, secret-file exclusions,
  and a README with a resource table and Azure configuration.
- Workflow correction: moved the initial sibling scaffold into this repository
  per the learner's preference. Week 1, including Day 1, uses local
  `month1_week1`, tracking the existing `origin/month1_week1`; documentation
  and implementation stay together. No push was performed during setup.
- Verification: all five directory placeholders
  exist. `git check-ignore` confirms environment files, local settings, Python
  caches, and Node dependencies are excluded while `.env.example` is allowed.
  `git diff --check` passed for the course tracker change.
- Azure checkpoint: learner completed interactive sign-in. Agent verified
  `az account show` identifies the expected Visual Studio Enterprise Subscription
  as enabled and default. `az account get-access-token` for Azure management
  succeeded; only token expiry was displayed, not the token.
- Credit checkpoint: after learner browser sign-in, agent inspected the
  subscription overview. Offer: MSDN (`MS-AZR-0063P`); currency: INR.
  Starting credit is displayed as INR 12.50K (rounded); the status banner shows
  INR 12,479.94 remaining. Current billing period: 2026-10-10 through 2026-11-09.
  The next cycle is expected on 2026-11-10, inferred from the period end;
  an explicit reset timestamp was not shown.
- Cost controls: the portal offers to remove the spending limit; it was left
  unchanged. Existing subscription resources and usage were observed and left
  untouched. The project budget is set in INR with headroom for subscription-wide
  existing usage; the original $200 credit assumption was not used.
- Resource group: created `rg-agentops-dev` in Central India. Verified
  provisioning state `Succeeded` and zero resources in the new group.
- Budget: created `agentops-monthly-inr`, INR 10,000, calendar monthly,
  2026-11-01 through 2027-10-31. Azure API read-back verified six enabled
  notifications to the signed-in account: actual and forecast thresholds
  50%, 80%, and 100%. Budget alerts do not cap spending. The budget's calendar
  period is not aligned with the subscription's 10th-to-9th billing period.
- Repository checkpoint: use `git status` and `git log` to verify the local
  commit; a persistent Git author identity was not configured during setup.
  The tutorial app worked; its temporary resource group has been deleted and
  confirmed absent. No application or billable resources were created in the
  project group; existing subscription resources were not modified.
- Tutorial preflight: installed Azure CLI `containerapp` extension 1.3.0b5
  (preview). Docker daemon access returned permission denied; Azure CLI help
  documents an Oryx fallback for `az containerapp up --source`. Cloned the
  official FastAPI sample to `/tmp/agentops-fastapi-tutorial` at revision
  `2ecc964` and added the tutorial Dockerfile and `.dockerignore` there.
  Deployment was initially pending approval because it creates a public app and
  chargeable temporary resources; approval has now been given. The group is
  separate from `rg-agentops-dev`, and the cleanup command is
  `az group delete --name web-fastapi-aca-rg --yes --no-wait`.
- Tutorial run: deployed the sample as `web-aca-app` in Central India. The
  first request exposed a dependency/API mismatch: current unpinned FastAPI
  dependencies use Starlette 1.10, while the sample used the older positional
  `TemplateResponse` call. Updated the temporary sample to the request/name/
  context signature, rebuilt, and verified the home page and form response
  (`Hello AgentOps`) both return HTTP 200. Azure confirmed deletion of the
  Container Apps environment and resource group; the temporary local sample
  clone was also removed.
- Assessment: not requested; no baseline, quiz, or unaided mastery claimed.
- Notes: agent-written factual work summary, not a learner reflection.

## Standing routines (evidence lives here too)

- **Weekly:** 15-min cost review vs the month's budget column (ROADMAP.md) + the weekly report (from Month 3: SLOs per path).
- **Friday/consolidation sessions:** mixed mastery gate — KCs are promoted or demoted here, on mixed evidence only.
- **Debt log:** every `assisted` step, fragile KC, and unresolved failure mode, each with a repair date. Closed only with evidence; the single allowed write-off point is Month 6 Week 4, in writing.
- **Reactivation rule:** any gap ≥4 days starts with a reactivation half-day (retrieval since last gate + re-run last two checkpoints) before new material — log it here when it happens.
