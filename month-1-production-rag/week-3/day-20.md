# Day 20 — CI/CD — deploy on merge, from GitHub Actions

**Week 3 · Build · 75 min** · Month 1 — Production RAG

## Objective
Wire GitHub Actions to build images and deploy both containers on merge to main — verified by a trivial merged PR changing the live UI without any local deploy command.

## Why this exists
A product that deploys from your laptop is a demo with a URL. CI/CD is also Month 2's enabler: the agent and MCP server will ship through this same pipeline, so its shape (build → push → update, per the Learn tutorial's production split) is worth getting right once.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 19):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 17):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 13):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 19's independent verification ("Rest / review — retrieval consolidation") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Completion problem:** Day 1's tutorial demonstrated the manual version of every step the workflow automates — the workflow file is the completion task: job skeleton given (triggers, jobs), the Azure login/build/update steps blanked. Auth via OIDC federated credentials for the workflow identity — no stored Azure secrets, consistent with the month's keyless theme.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Create the workflow identity
App registration / managed identity for GitHub Actions with OIDC federation, scoped roles on the resource group only. Record the non-secret IDs as repo variables.

**Expected output:** Workflow can `az login` via OIDC in a test run; no Azure password/key exists in repo secrets.

### Step 2 — Write the workflow
On merge to main: build API + UI images (`az acr build` or docker build/push to ACR), then `az containerapp update` per app with the new image tag (commit SHA). Separate infra changes stay manual via Bicep — say why in a comment (state-changing automation needs a human gate at this scale).

**Expected output:** Workflow file committed; a manual `workflow_dispatch` run succeeds end-to-end.

### Step 3 — Prove it with a trivial change
Change one visible string in the UI via PR. Merge. Touch nothing locally.

**Expected output:** The live URL shows the new string; the Actions log shows build → push → update with the merge SHA as tag.

### Step 4 — Add the smoke gate
Post-deploy step runs Day 17's assertion script (subset: 5 calls) against the new revision; failure marks the run red (rollback is Month 3's problem — today, visibility).

**Expected output:** A deliberately broken change (bad citation config on a test branch) produces a red run with the assertion output attached.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| OIDC login fails: audience/subject mismatch | Federated credential subject must match repo/branch exactly | Compare the claim in the error with the credential's subject string character-by-character; fixed when login succeeds with no stored secret |
| Deploy succeeds, old revision still serving | Traffic not shifted to the new revision | Check revision/traffic weights in Container Apps; fixed when the new SHA's revision takes 100% |
| Workflow green, site unchanged | Image tag identical (e.g. 'latest' cached) — SHA tags exist precisely to prevent this | Confirm the update step references the SHA tag; fixed when the running image tag equals the merge SHA |

## Independent verification (checkpoint)
Independent by construction: the change reached production through a merge, witnessed by the Actions log + the live URL. Local deploy commands used: zero.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: the pipeline's stage order + why infra deploys are excluded from it.
2. Transfer: Month 2's MCP server joins. What in this workflow generalises unchanged, and what is genuinely new?
3. Debugging: a merge is green but production broke. Give your first three checks in order (revision? image tag? smoke output?) with reasons.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: Week 3 gate — the full exit checklist against the live product, plus the design note on access control that Month 4 will cash in.
