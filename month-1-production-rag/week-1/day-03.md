# Day 3 — Bicep core II — Azure OpenAI + AI Search Free

**Week 1 · Apply · 60 min (light)** · Month 1 — Production RAG

## Objective
Add an Azure OpenAI resource with gpt-4o-mini + text-embedding-3-small deployments (low TPM quotas) and AI Search on Free tier, from Bicep — verified by `az cognitiveservices account deployment list` showing both deployments.

## Why this exists
These are the two AI resources everything else calls. Free tier for Search is deliberate sequencing: Basic ($73.73/mo) starts only when the Free ceiling (50 MB, 3 indexes) bites in Week 2 — paying for Week 1 would buy nothing.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 2):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
3. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 2's independent verification ("Bicep core I — storage, secrets, monitoring with caps") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Completion problem:** yesterday's modules are the worked example; today you complete the same pattern for two new resource types with the SKU/quota lines blanked in your own notes first — fill them from the pricing research (mini: $0.15/$0.60 per 1M; embeddings ~$0.022/1M; quotas low on purpose so a runaway loop hits a quota, not your budget).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Add the Azure OpenAI module
One account, two deployments: chat = `gpt-4o-mini`, embeddings = `text-embedding-3-small` (1,536-dim). Set deployment TPM quotas low (10–30k TPM range). Note the exact model versions the deployment returns — pin them in the README.

**Expected output:** Both deployments listed with state succeeded; versions recorded, not assumed.

### Step 2 — Add AI Search — Free tier
SKU `free`, 1 replica / 1 partition (Free fixes these anyway). Add the SKU as a parameter whose allowed list is `free`, `basic` — the Week 2 upgrade is then a parameter change, not a rewrite.

**Expected output:** Search service provisioning state succeeded; pricing tier shows Free.

### Step 3 — Redeploy everything
Full `az deployment group create` again — all modules, not just the new ones. Idempotence is a feature you verify, not assume.

**Expected output:** Second full deployment succeeds with no manual fixes; pre-existing resources unchanged.

### Step 4 — 15-minute cost review (standing Friday habit)
Cost Management: actual spend so far, forecast, top resource. Write the number in the README log.

**Expected output:** Spend so far is effectively $0–2. Anything materially above that gets a named cause in the log today, not next week.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Model deployment fails: quota/capacity | Regional capacity for that model version | Try the other pinned version or region pair you control — and record which you landed on; fixed when both deployments list as succeeded |
| Search Free creation refused | One Free search service per subscription is a common limit — UNVERIFIED against your subscription; check the Azure AI Search limits doc if hit | Reuse/delete the stray Free service from any tutorial; fixed when exactly one Free service exists and it's yours |
| TPM quota set but loop still expensive | Quota caps rate, not total spend | That's what Day 1's budget alerts are for — two different controls; note the distinction in your log |

## Independent verification (checkpoint)
`az cognitiveservices account deployment list` shows both models AND a fresh full Bicep deployment succeeds end-to-end. Pass requires the second condition — a resource that only exists from a partial deploy is Week 1 debt.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: both model names, the embedding dimension, and the two token prices — closed-book.
2. Transfer: a teammate proposes Standard S1 'for headroom.' Using only numbers from this guide, make the one-paragraph case against it.
3. Prediction: which resource hits its Free ceiling first in Week 2, and what exactly happens when it does?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow is the long block: managed identity + RBAC, then the walking skeleton. Bring coffee; it's the week's integration day.
