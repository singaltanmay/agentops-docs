# Day 7 — Week 1 gate — teardown and clean redeploy

**Week 1 · Gate · 75 min** · Month 1 — Production RAG

## Objective
Delete the resource group and reproduce the entire environment with one command — verified by the skeleton answering `/complete` again on the fresh deployment, with total Week 1 spend < $5.

## Why this exists
This is the mixed-assessment rule applied to infrastructure: a system you built step-by-step with the guide open is 'Familiar'; a system you reproduce from clean state is on its way to 'Mastered.' It is also the cheapest disaster-recovery drill you will ever run.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 6):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 4):** one generative item — write the key command, schema, or rule from that day without looking.
3. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
4. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 6's independent verification ("The corpus — Kubernetes docs, pinned and counted") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new concept. Today is assessment by design: guide closed for the redeploy itself, open afterwards for the gap analysis. Anything you have to fix by hand in the portal during redeploy is a finding, not a failure — log it as an IaC gap with a fix commit.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Capture state, then destroy
Record current spend (Cost Management) and export anything not in Bicep (there should be nothing). Delete the resource group. Wait for deletion to complete.

**Expected output:** Group gone. If deletion hangs on a specific resource, note which and why — usually a lock or a vault soft-delete; Key Vault soft-delete/purge behaviour is the classic one (check the Key Vault docs if hit).

### Step 2 — One-command redeploy
Run your single entry point (`az deployment` wrapper script or `azd up` per your setup) from an empty group. Time it. Fix nothing in the portal — every fix is a Bicep/code change + redeploy.

**Expected output:** Deployment succeeds from code alone. Elapsed time recorded. Portal touches during the run: zero.

### Step 3 — Re-verify the skeleton
Re-run Day 5's verification verbatim against the new URLs: health, keyless completion, zero-key grep.

**Expected output:** All three pass on the fresh environment. The grep result is pasted into your log.

### Step 4 — Gate review + spend retrospective
Score Week 1: gate items pass/fail, spend vs the <$5 target, KC-01/02/03 states updated honestly (fragile is a fine answer; unexamined is not). Write the 3-line log for the week.

**Expected output:** Retro committed. Week 1 is done only when this review exists — the review *is* the gate paperwork.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Redeploy fails on Key Vault name | Soft-deleted vault holds the name | Purge or parameterise the name per environment; fixed when the one-command run succeeds twice in a row eventually — today, once is the gate |
| A resource was portal-created and is now missing | It was never in Bicep — exactly what this gate exists to catch | Recreate it in Bicep now; fixed when the fresh environment matches the old one's README table |
| Spend above $5 | A resource ran that shouldn't have (tutorial leftovers, min replicas) | Name it in the retro and add the Bicep guard; the gate still passes if the cause is found and fenced — unexplained spend fails the gate |

## Independent verification (checkpoint)
Independent by construction: the environment answering today was created by one command from nothing. Pass = skeleton live + spend explained + retro committed.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Mixed gate (closed-book, all Week 1): (1) budget thresholds, (2) the four Bicep resources + their caps, (3) principal/role/scope for Search→Blob, (4) deploy command sequence, (5) corpus branch + page count, (6) cold vs warm latency you measured.
2. Debugging: the redeploy 'worked' but /complete 403s. Give your ordered diagnosis (identity? role? scope? propagation?) — order matters, state why.
3. Confidence check: rate your Week 1 mastery 0–100% before scoring the mixed gate. Log |confidence − score|.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Week 2 starts tomorrow: ingestion. First your own parser (the one you'll be able to debug), then the platform's. Prep: re-read the azure-search-openai-demo ingestion doc tonight if energy allows — 20 minutes, no notes.
