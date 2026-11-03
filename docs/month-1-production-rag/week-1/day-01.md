# Day 1 — Toolchain, repo, and the budget

**Week 1 · Build · 75 min** · Month 1 — Production RAG

## Objective
Scaffold the existing AgentOps project repo on the Week 1 branch and create a
resource-group cost budget based on the verified subscription credit — verified
by the budget and its actual/forecast alerts appearing in Cost Management.

## Why this exists
Every later day assumes this repo shape and its cost controls. A budget alert is
a notification, not a spending cap. The subscription's spending limit is a
separate control; keep it enabled and monitor the subscription-wide credit balance.
This is a security control as much as a cost one (OWASP LLM10, unbounded consumption).

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
Run `az login`, then `az account list -o table` and
`az account set --subscription <the subscription with the verified project credits>`.
Confirm with `az account show`.

**Expected output:** The `isDefault` account is the credits subscription. If two look identical, stop — deploying to the wrong subscription is the month's most expensive typo.

### Step 3 — Scaffold the project on the existing branch
Work from the existing project repository root; keep course materials in `docs/`
and implementation alongside them. Do not create a separate `agentops-workbench`
directory or run `git init` again.

Check `git status` and run `git fetch origin`. The existing remote branch for
Week 1, including Day 1, is `origin/month1_week1`. On first checkout, use
`git switch --track origin/month1_week1`; if the local branch already exists,
use `git switch month1_week1`. Preserve any existing changes; do not force the switch.

Create `app/`, `infra/`, `ingestion/`, `evals/`, `data/` at the project root,
with `.gitkeep` files so Git retains the initially empty directories. Add a
root `.gitignore` (Python, Node, `.env`, local settings) and a root README with
an empty resource table (Resource | SKU cap | Monthly cost) you will fill all month.
Review and stage only the intended lesson changes before committing them as
`chore: repo scaffold`.

**Expected output:** `git branch --show-current` prints `month1_week1`,
`git branch -vv` shows tracking of `origin/month1_week1`, and the scaffold
directories sit beside `docs/`. After the scaffold commit, `git status` shows
no outstanding lesson changes; unrelated changes, if any, remain untouched.

### Step 4 — Create the resource group + budget (once)
Use the verified subscription credit balance to set a conservative budget in
the subscription's billing currency. For this subscription, the verified
starting credit is about **INR 12,500** and the remaining balance on 2026-11-03
was **INR 12,479.94**. The project budget is **INR 10,000 per calendar month**,
scoped to `rg-agentops-dev`; the gap leaves headroom for existing subscription-wide
usage. The budget sends notifications only—it does not cap spending. Do not
remove the Visual Studio subscription's spending limit.

Configure actual and forecast alerts at **50%, 80%, and 100%**, addressed to the
signed-in Azure account. The billing period runs from the 10th to the 9th, while
this budget uses calendar months; monitor the credit balance separately. The
resource group metadata is stored in **Central India**; individual resources
must use a region supported by their service and model.

**Expected output:** `rg-agentops-dev` exists in Central India. Cost Management
shows the `agentops-monthly-inr` monthly budget for INR 10,000 with six enabled
notifications: actual and forecast at each of 50%, 80%, and 100%. The project
resource group contains no deployed resources yet.

### Step 5 — Run the hands-on deploy flow once, by hand
Use Microsoft's [FastAPI to Container Apps tutorial](https://learn.microsoft.com/en-us/azure/developer/python/tutorial-containerize-simple-web-app)
with its sample app (not your project code). Use the separate
`web-fastapi-aca-rg` resource group and the tutorial's `web-aca-app` sample.
The deployment exposes a public URL and creates an ACR, a Container Apps
environment, a Container App, and a Log Analytics workspace.

The local Docker daemon may be unavailable in remote environments. In that case,
`az containerapp up --source .` can use its Oryx fallback; the tutorial's local
Docker build/run substeps are not verified by that fallback. Do not put tutorial
resources in `rg-agentops-dev`.

Before deploying, prepare cleanup:
`az group delete --name web-fastapi-aca-rg --yes --no-wait`. After testing the
URL, run that command and verify cleanup with
`az group exists --name web-fastapi-aca-rg` (expected output: `false`).

**Expected output:** The sample app URL returns the tutorial's page. The
temporary resource group and all its resources are deleted afterward; the project
resource group and existing subscription resources remain untouched.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| `az` deploys to the wrong subscription | Tooling slip — wrong default account | `az account show`, then `az account set`; fixed when the shown subscription matches the credits one |
| Budget alerts never arrive | Alerts set on actuals only, wrong recipient, or cost-data delay | Verify actual and forecast notifications and the contact address; cost data can lag |
| Tutorial resource group left running | Forgotten parallel example | `az group delete` on the tutorial group only; fixed when `az group exists --name web-fastapi-aca-rg` returns `false` |

## Independent verification (checkpoint)
From the project repository root, run `az group list -o table`,
`az group show --name rg-agentops-dev`, `git branch -vv`, and `git log --oneline`.
Pass = `rg-agentops-dev` exists, the INR 10,000 budget with six notifications is
visible in Cost Management, `month1_week1` tracks `origin/month1_week1`, and the
scaffold commit is in the log. Leave pre-existing resource groups untouched.

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
