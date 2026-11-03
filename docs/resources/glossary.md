# Glossary — Agentic-AI Terms as Used in This Plan

Definitions are scoped to how each term is used in the AgentOps Workbench build.

## Retrieval & RAG
- **RAG (Retrieval-Augmented Generation)** — generation conditioned on chunks retrieved from a corpus at query time, instead of relying on the model's parametric memory.
- **Chunking** — splitting documents into indexable units. In this plan: heading-aware splitting that keeps code blocks intact and attaches metadata (title, section path, URL, version).
- **Hybrid retrieval** — BM25 (keyword) + vector (dense) results fused, in Azure AI Search via **RRF (Reciprocal Rank Fusion)**.
- **Semantic ranker** — Azure AI Search's built-in L3 reranker over hybrid results; first 1,000 requests/mo free, then $1/1,000.
- **Integrated vectorization** — AI Search skillsets/indexers (SplitSkill + AzureOpenAIEmbeddingSkill + index projections) that chunk and embed inside the service — the declarative alternative to a hand-rolled pipeline. Both paths are built in Month 1 and compared.
- **Golden set** — a frozen, hand-built question set with reference answers and expected source chunks (`golden-v1.0`: 160 Q, 30 held out). Built *before* tuning; the held-out slice is never tuned against.
- **Recall@k** — fraction of questions whose expected chunk appears in the top-k retrieved results.
- **Ragas** — the RAG eval framework used here: Faithfulness, LLMContextRecall, LLMContextPrecisionWithReference, FactualCorrectness, with an LLM judge.
- **Faithfulness** — whether the answer's claims are supported by the retrieved context (Ragas metric).
- **Context precision / recall** — whether retrieved chunks are relevant (precision) and whether all needed chunks were retrieved (recall).
- **Contamination** — the model answering from training-data memory instead of the corpus, faking RAG success. Controlled here by scoring citations to chunk IDs.

## Agents & MCP
- **Agent loop** — the Thought → Action → Observation cycle (ReAct): model decides, tool executes, result feeds the next decision, until a stop condition.
- **Workflow vs agent** — Anthropic's taxonomy: workflows follow predefined paths (chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer); agents decide their own path. Build workflows first.
- **MCP (Model Context Protocol)** — the cross-vendor standard for exposing tools/resources/prompts to models via client–server, over stdio or Streamable HTTP. In this plan: your own server on Container Apps exposing search / golden-set / eval tools.
- **Durable state / checkpointing** — persisting agent state (here: LangGraph checkpoints in Postgres) so a run survives process death and can resume.
- **Human-approval gate** — irreversible or write actions pause for explicit human approval before executing. Non-negotiable for write tools.
- **Context engineering** — managing what the model sees: context budgets, compaction/summarisation, structured note-taking, sub-agent context isolation, prompt caching, ordering (models use the middle of long contexts worst — "lost in the middle").
- **Orchestrator-workers** — a lead agent delegating to parallel sub-agents. In this plan: **read-only only** (parallel reads are safe; parallel writes create conflicting implicit decisions).
- **pass^k** — probability that an agent succeeds on *all* k runs of a task (τ-bench metric) — the reliability number, as opposed to pass@1.

## Evals & observability
- **LLM-as-judge** — a stronger model scoring outputs against a rubric. Useless uncalibrated: validate against your human labels and report **TPR/TNR**, not just agreement.
- **Failure analysis / taxonomy** — reading failing traces yourself, open-coding the failures, grouping them into counted categories (retrieval miss / wrong chunk ranked / generation ignored context / ambiguous question / golden answer wrong). The taxonomy, not the headline score, drives fixes.
- **Regression gate** — a CI check (here: promptfoo) that fails the build when eval scores drop below committed thresholds.
- **Tracing** — per-step records of a request (retrieve / rerank / generate / tool calls) with token, cost, and latency attributes — App Insights here.
- **Cost per successful outcome** — total spend ÷ tasks actually completed correctly. The platform metric that keeps quality, latency, and cost in one frame.

## Security
- **OWASP LLM Top 10 (2025)** — the threat taxonomy for Month 4: LLM01 Prompt Injection, LLM02 Sensitive Information Disclosure, LLM06 Excessive Agency, LLM07 System Prompt Leakage, LLM08 Vector & Embedding Weaknesses (your index is an attack surface), LLM10 Unbounded Consumption (your $200 budget is a security control).
- **Prompt injection (direct / indirect)** — attacker text instructing the model; indirect injection arrives via retrieved documents or tool outputs — the RAG/agent threat model.
- **Lethal trifecta** — private data + untrusted content + external communication in one agent = exfiltratable by design. Gates which tools may coexist in one session.
- **Prompt Shields** — Azure AI Content Safety classifiers for user-prompt attacks and document attacks. A layer, not a fix; architecture is the durable defence.
- **Least privilege (tools)** — every tool scoped to the minimum data/actions; data-plane RBAC roles, never broad keys.

## Fine-tuning
- **LoRA / SFT** — parameter-efficient fine-tuning (LoRA) via supervised fine-tuning. In this plan: exactly one Month 5 experiment on a narrow task built from eval-failure data, kept **only if it beats prompting on the same eval harness** — the verdict is reported either way.

## Learning-model terms
- **KC (knowledge component)** — one tracked sub-skill in the learner model, with a state: `unknown / learning / fragile / mastered / decayed`.
- **Assisted, not mastered** — the status of any step the instructor demonstrated; carries a repair probe within 48 h.
- **Outer fringe** — the set of topics whose prerequisites are all mastered but which aren't yet: tomorrow's lesson is always picked from here.
- **Reactivation half-day** — after a ≥4-day gap: retrieval across everything since the last weekly gate + re-running the last two checkpoints before new material.
