# Week 1 — IaC + Walking Skeleton

**Week goal:** the whole Azure environment exists as code, costs are capped and
alerting, and a deployed container returns a live `gpt-4o-mini` completion through
a managed identity — no keys anywhere. By the gate, you can tear it all down and
redeploy from clean state, unaided.

**Services landed this week:** resource group + $200 budget (50/80/100% alerts),
Blob (Hot, LRS), Key Vault, Log Analytics + App Insights (daily cap, 31-day
retention), ACR Basic, Container Apps environment, AI Search **Free**, Azure
OpenAI with `gpt-4o-mini` + `text-embedding-3-small` (low TPM quotas), managed
identities + RBAC. Corpus cloned and counted.

| Day | Type | Title |
|---|---|---|
| [1](day-01.md) | Build · 75 min | Toolchain, repo, and the $200 budget |
| [2](day-02.md) | Build · 75 min | Bicep core I — storage, secrets, monitoring with caps |
| [3](day-03.md) | Apply · 60 min (light) | Bicep core II — Azure OpenAI + AI Search Free |
| [4](day-04.md) | Long build · 2–3 hrs | Keyless access — managed identity + RBAC |
| [5](day-05.md) | Long build · 2–3 hrs | Walking skeleton — live completion from a container |
| [6](day-06.md) | Build · 75 min | The corpus — Kubernetes docs, pinned and counted |
| [7](day-07.md) | Gate · 75 min | Week 1 gate — teardown and clean redeploy |

**Week definition of done:** clean-state redeploy reproduces the environment;
deployed "hello" FastAPI returns a live completion keylessly; cost dashboard
shows <$5 spent; project README documents every resource and its SKU cap.
