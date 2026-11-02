# Day 2 — Bicep core I — storage, secrets, monitoring with caps

**Week 1 · Build · 75 min** · Month 1 — Production RAG

## Objective
Deploy Blob (Hot, LRS), Key Vault, and Log Analytics + App Insights from Bicep — verified by `az deployment group show` succeeding and the Log Analytics daily cap visibly set.

## Why this exists
Monitoring without a cap is how log costs sneak up ($2.30/GB ingested past the 5 GB included allowance). Setting caps in code, on day one, is the production habit this month is really teaching; the resources themselves are trivial.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 1):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
3. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 1's independent verification ("Toolchain, repo, and the $200 budget") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Worked example (parallel):** skim the azure-search-openai-demo repo's `infra/` layout first — env-based SKU parameters, one module per resource. Then write yours: same discipline, your naming, your caps. Do not copy its app resources; you need four resources, it has twenty.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Write `infra/main.bicep` skeleton
Parameters: `location`, `environmentName`, and a SKU parameter per resource with an `@allowed` list containing only the budget-safe values. One `targetScope = 'resourceGroup'` file; modules added below.

**Expected output:** `az bicep build --file infra/main.bicep` compiles with no errors.

### Step 2 — Add Blob + Key Vault modules
Blob: Hot tier, LRS, one container `corpus`. Key Vault: Standard, RBAC authorisation mode (not access policies). No secrets created by hand — identities arrive Day 4.

**Expected output:** Deployment outputs list both resource names; `az storage account show` reports `sku.name = Standard_LRS`.

### Step 3 — Add Log Analytics + App Insights — with the caps
Workspace retention **31 days**; set the **daily cap** explicitly (start at 1 GB/day — generous for Month 1, fatal to nothing). App Insights workspace-based, connected to the workspace.

**Expected output:** `az monitor log-analytics workspace show` shows your retention + cap values — not the defaults. If it shows defaults, the cap didn't deploy; that is today's bug to find.

### Step 4 — Deploy and record
`az deployment group create --template-file infra/main.bicep`. Fill the README resource table: each resource, its SKU cap, its expected monthly cost.

**Expected output:** Deployment state `Succeeded`. README table has 4+ rows with caps, not just names.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Bicep compiles, cap missing in portal | Parameter declared but never wired to the workspace resource | Trace the parameter into the resource body; fixed when `workspace show` returns your value |
| Key Vault name collision | Vault names are globally unique | Append the environment suffix you parameterised; fixed when deployment succeeds without renaming anything else |
| Deployment succeeds in wrong region | Default parameter drift | Pin `location` to the resource group's location in code; fixed when all resources report one region |

## Independent verification (checkpoint)
From a fresh shell: `az deployment group show --name <deployment> --query properties.provisioningState` returns `"Succeeded"` AND `az monitor log-analytics workspace show` returns your cap + 31-day retention. Both, not either.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: write the two App Insights cost controls from memory, with their values.
2. Prediction: verbose agent tracing in Month 3 sends 40 GB in a weekend. What happens at your cap — to the bill, and to your data? Which do you actually want?
3. Spot the distractor: which of these does *not* belong in Bicep? (a) SKU allow-list (b) the budget alerts (c) retention (d) daily cap. Why?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow (light day): Bicep core part 2 — Azure OpenAI + AI Search Free, then the week's first mixed retrieval check. Nothing to prep.
