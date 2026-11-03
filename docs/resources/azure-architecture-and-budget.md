# Azure Architecture and Budget

All prices from Microsoft pricing pages/docs as researched 2026-10-28. Token prices
marked `index` were read via search-index text of Microsoft's pages — re-verify in
Foundry before relying on them for a new deployment.

## System → service map

| System part | Azure service | Role / why |
|---|---|---|
| Chat / generation | Azure OpenAI — `gpt-4o-mini` (Global Standard, pay-as-you-go) | Cited-answer generation, query rewriting. Quality experiments drive model choice, not cost |
| Judge model | `gpt-4.1-mini` (second deployment, same resource) | LLM-as-judge for Ragas/promptfoo. Deliberately stronger than the generator; sampled/eval traffic only |
| Embeddings | `text-embedding-3-small` (1,536-dim) | Index + query embeddings, integrated vectorization. 3-large is a Month 1 A/B only |
| Reranking | AI Search semantic ranker (built-in) | L3 rerank of hybrid results; no separate service to pay for |
| Retrieval / vector store | AI Search — **Free → Basic** | BM25 + vector (HNSW) + hybrid (RRF) + semantic ranker + integrated vectorization in one service |
| App / agent state | PostgreSQL Flexible Server, **B1ms**, pgvector (Month 2+) | Users, conversations, feedback labels, eval runs, LangGraph checkpoints. pgvector comparison is a deliberate experiment on this instance |
| Backend API | Container Apps (Consumption) — FastAPI, scale-to-zero | RAG API, later the agent service |
| Frontend | Container Apps (Consumption) — Next.js, scale-to-zero | Ask → answer → expandable citations → feedback labels (future eval data) |
| MCP server | Container Apps (Consumption) — third app, same environment | Your MCP server (Month 3): search / golden-set / eval tools over Streamable HTTP |
| Ingestion | Container Apps Jobs | Chunk/embed/index runs; billed only while executing |
| Source documents | Blob Storage, Hot, LRS | Corpus, chunk artefacts, eval datasets, trace exports |
| Secrets | Key Vault (Standard) + managed identity | Keyless (Entra ID / managed identity) is the production pattern; Key Vault holds non-Azure secrets |
| Observability | App Insights (workspace-based) + Log Analytics | Per-step traces, token/cost per request, KQL failure analysis. **Daily cap mandatory** |
| Guardrails (Month 4) | AI Content Safety — Prompt Shields + groundedness (Free tier first) | Injection/jailbreak screening on inputs *and retrieved documents*; a classifier layer, not a fix |
| Fine-tuning (Month 5) | Azure ML managed compute (GPU, ephemeral) or Foundry fine-tuning | One LoRA experiment. Created, used for hours, **deleted the same day** |
| Registry / CI-CD | Container Registry (Basic) + GitHub Actions + Bicep + `azd` | One-command environment reproduction |

## Unit prices (researched 2026-10-28)

| Item | Price | Flag |
|---|---|---|
| gpt-4o-mini | $0.15 in / $0.075 cached in / $0.60 out per 1M tokens; Batch = half | `index` |
| gpt-4.1-mini | $0.40 / $1.60 per 1M (in/out) | `index` — **UNVERIFIED** against the rendered page; confirm in Foundry |
| text-embedding-3-small / -large | $0.022 / $0.143 per 1M tokens | `index` |
| AI Search Free | $0 — 50 MB, 3 indexes | verified live |
| AI Search **Basic** | **$73.73/mo** per search unit — 15 GB, 15 indexes | verified live |
| AI Search Standard S1 | $245.28/mo — **over budget alone; banned** | verified live |
| AI Search Serverless (preview) | $0.2712/CU-hour — experiment, not foundation | verified live |
| Semantic ranker | First 1,000 requests/mo free, then $1 per 1,000 | verified live |
| PostgreSQL B1ms | $12.41/mo compute; storage extra (≈32 GB budgeted inside the $17 line) | `index` |
| Container Apps Consumption | $0.000024/vCPU-s, $0.000003/GiB-s, $0.40/1M requests; free grant 180k vCPU-s + 360k GiB-s + 2M requests/mo; $0 at zero replicas | `index` + page read |
| Blob Hot LRS | ≈$0.0184/GB-mo; writes $0.065 / reads $0.005 per 10k ops | `index` |
| Key Vault Standard | $0.03 per 10,000 operations | `index` |
| Log Analytics | $2.30/GB ingested, 5 GB/mo included; retention free 31 days | `index` |
| Content Safety | Free: 5,000 text records/mo. Standard: $0.38 per 1,000 records (region variance exists — re-check in Month 4) | `index` |
| Container Registry Basic | ≈$5/mo | third-party examples only — **UNVERIFIED** from Microsoft |
| Azure ML GPU hourly | Not captured from Microsoft's pages | **UNVERIFIED** — price the exact VM in the Pricing Calculator before creating anything; the Month 5 $40 is a cap, not a quote |

**Worked token math:** 10,000 queries/mo × ~2,500 in + ~400 out tokens on
gpt-4o-mini ≈ **$6/mo**. Embedding a ~5M-token corpus ≈ **$0.11**. Models are
nearly free at this scale; fixed tiers are the budget game.

## Monthly budget

See the month-by-month table in [../ROADMAP.md](../ROADMAP.md)
(≈$116 / $152 / $165 / $161 / $187 / $174 — all under $200).
These USD estimates are the original course model, not a guarantee that each
month fits this subscription's approximately INR 12,500 starting credit. Recheck
regional pricing and the remaining account balance before enabling paid tiers;
the active project budget is INR 10,000 and covers only its resource group.

## Services that would blow the budget (banned)

- **AI Search Standard S1** — $245.28 for one search unit; a "production-looking"
  2×2 S1 is ~$981/mo.
- **Azure OpenAI PTU** — 15 PTU minimum × $260 ≈ $3,900/mo floor. Pay-as-you-go only.
- **PostgreSQL B4ms** ($198.56/mo) or B2ms ($99.28) — unjustifiable here. B1ms or stop/start.
- **GPU compute left running** — ~$3–7/hr is $2,000+/mo at 24×7. Ephemeral only.
- **API Management** — even Basic v2 ≈ $150/mo (third-party summary; **UNVERIFIED**
  from Microsoft). Do rate-limiting/token budgeting in FastAPI instead.
- **Log Analytics without a daily cap** — verbose agent tracing turns $2.30/GB into
  real money. Sampling + cap + Basic Logs for debug streams.
- **Front Door / WAF / private endpoints everywhere** — per-hour platforms; the
  capstone uses built-in HTTPS ingress + managed identity + Key Vault references,
  and documents the enterprise upgrade path instead of paying for it.

## Cost-control practices (standing rules)

1. **Scale-to-zero everywhere it exists**; Postgres stop/start outside work blocks in Months 2–3.
2. **Caps in IaC:** AI Search SKU = Basic, 1 replica / 1 partition; Postgres = B1ms; AOAI TPM quotas low (10–30k) so a runaway loop hits a quota, not your credits.
3. **Token budgets in code:** max context chunks + `max_tokens` per request; per-day token ceiling with a circuit breaker in the API middleware; stable system-prompt prefix first (cached input is half price); Batch API for offline eval/golden-set runs.
4. **Free tiers first, deliberately:** AI Search Free (Month 1, weeks 1–2), Content Safety Free, Container Apps free grant, 5 GB Log Analytics included.
5. **Cost Management budget with alerts:** this project uses an INR 10,000
   calendar-month budget on its resource group, with actual and forecast alerts
   at 50% / 80% / 100%. The subscription credit limit is separate; keep headroom
   for existing resources and review actual costs weekly.
6. **Semantic-ranker discipline:** log semantic vs non-semantic per query so a metered feature can't surprise you.
7. **One region, LRS, Hot→Cool lifecycle** on Blob trace exports; 31-day log retention.
8. **Ephemeral experiment rule (Month 5):** any GPU/ML resource gets a name, a dollar envelope, and a deletion command written down *before* it is created.
