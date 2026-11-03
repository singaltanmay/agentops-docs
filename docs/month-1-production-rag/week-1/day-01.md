# Day 1 — Toolchain, repo, and the $200 budget

**Week 1 · Build · 75 min** · Month 1 — Production RAG

## Objective
Initialise the AgentOps repo and create a $200 Cost Management budget with 50/80/100% alerts — verified by the budget appearing in Cost Management and `git log` showing the first commit.

## Why this exists
Every later day assumes this repo shape and this budget. The budget is a security control as much as a cost one (OWASP LLM10, unbounded consumption): it is the tripwire that catches a runaway loop before your credits do.

## Retrieval warm-up (closed-book, 8–12 min)
Day 1 has no prior material — the warm-up is a **baseline diagnostic** instead: closed-book, write (a) the deploy sequence you *think* Container Apps uses, (b) what a managed identity is, (c) what Recall@k means. Seal it; Day 7's gate compares against it. Confidence-tag each item.

## Prerequisite check
None — this is the first day. The baseline diagnostic above *is* the prerequisite record for the month.

## Core concept
No new technical concept today — deliberately. Today is the parallel-example day for the whole month: you set up the exact deploy-and-verify rhythm (change → run → compare to expected output → log) that every build step will reuse.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Verify the toolchain
Run: `az --version` · `docker --version` · `python3 --version` · `node --version` · `git --version` · `gh --version`. Do not install anything yet if one is missing — note which and fix it as its own step.

**Expected output:** A version line for each. `az --version` prints a block starting `azure-cli 2.x`. Python 3.11+, Node 18+.

### Step 2 — Sign in and pin the subscription
Run `az login`, then `az account list -o table` and `az account set --subscription <the one holding your $200 credits>`. Confirm with `az account show`.

**Expected output:** The `isDefault` account is the credits subscription. If two look identical, stop — deploying to the wrong subscription is the month's most expensive typo.

### Step 3 — Create the repo shape
`mkdir agentops-workbench && cd agentops-workbench && git init`. Create `app/`, `infra/`, `ingestion/`, `evals/`, `data/`, a `.gitignore` (Python, Node, `.env`, local settings), and a README with an empty resource table (Resource | SKU cap | Monthly cost) you will fill all month.

**Expected output:** `git status` clean after first commit: `git add -A && git commit -m "chore: repo scaffold"`.

### Step 4 — Create the resource group + budget (portal, once)
In Cost Management, create a **$200 monthly budget** scoped to the new resource group with alert thresholds at **50%, 80%, 100%** (actual + forecast) to your email. This is the one resource you create in the portal — everything from tomorrow is Bicep.

**Expected output:** Budget listed in Cost Management with 3 alerts. Screenshot or note the budget name in the README.

### Step 5 — Run the hands-on deploy flow once, by hand
Work Microsoft Learn's FastAPI → Container Apps tutorial end-to-end with its sample app (not your code). You are learning the `az containerapp up` shape today so tomorrow's Bicep has a mental model to attach to.

**Expected output:** The sample app URL returns the tutorial's page. Delete the tutorial's resource group afterwards — it was a parallel example, not your project.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| `az` deploys to the wrong subscription | Tooling slip — wrong default account | `az account show`, then `az account set`; fixed when the shown subscription matches the credits one |
| Budget alerts never arrive | Alerts set on actuals only, or wrong email | Edit the budget: add forecast-based alerts at 80% + 100%; fixed when both alert types are listed |
| Tutorial resource group left running | Forgotten parallel example | `az group delete` on the tutorial group only; fixed when `az group list -o table` shows only your project group |

## Independent verification (checkpoint)
Run `az group list -o table` and `git -C agentops-workbench log --oneline`. Pass = exactly your project resource group exists, the $200 budget with 3 alerts is visible in Cost Management, and the scaffold commit is in the log.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Closed-book: write the six toolchain commands from memory. Which two versions gate this month's work, and why?
2. Prediction: you deploy tomorrow's Blob account to the wrong subscription. Which control in today's work would have caught it, and at what point?
3. Teach-back (3 sentences): why is the budget scoped to the resource group rather than the whole subscription?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: Bicep core part 1 — Blob, Key Vault, Log Analytics + App Insights with the daily cap set on day one. Have your resource-group name and region decided tonight.
