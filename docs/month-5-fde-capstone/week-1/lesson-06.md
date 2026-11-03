# Deep build — deployment v1: the customer environment

**Week 1 · Deep build · ~3 hrs** · Month 5 — FDE Capstone

## Objective
Deploy the capstone configuration as its own environment (separate resource group/config via the existing IaC: customer corpus index, audience auth, customer SLOs) and run the full acceptance battery: customer golden baseline, leakage battery, smoke suites — the deployment report's first draft.

## Why this exists
One codebase, a second environment: this is the platform claim made visible (Month 1's IaC discipline pays off again) and the FDE deliverable's skeleton — an environment a customer could actually take.

## Prerequisites
Week 1 lessons complete; readiness verdicts addressed or accepted in writing.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 5 (Consolidation — deployment-readiness gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 5 (Consolidation — deployment-readiness gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Environment discipline: everything parameterised (corpus, audiences, SLO targets,
budget alerts on the new RG inheriting the subscription's verified credit
allowance and project spend discipline — the capstone RG shares the same credit
universe; its budget line comes from the Month 5 estimate, and the deployment
report states projected monthly cost explicitly).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Parameterise + deploy
IaC parameters for the customer environment; deploy; smoke the three paths (RAG / agent / MCP) in the new env.

**Expected output:** Environment live; smoke green; projected monthly cost written into the deployment report draft.

### Step 2 — Acceptance battery
Customer golden baseline re-run in the deployed env (not the dev env), leakage battery, gate smoke subset.

**Expected output:** All results recorded against the deployed env's run IDs.

### Step 3 — Stakeholder walkthrough
A scripted walkthrough (real session if real customer; recorded self-walkthrough if simulated): 3 tasks the customer cares about, live.

**Expected output:** Walkthrough completed; observations logged verbatim in the stakeholder log (surprises first).

### Step 4 — Deployment report draft
Structure: brief recap, environment, baselines, readiness verdicts, cost projection, open items.

**Expected output:** Draft committed; every number cites a run ID from the deployed env.

## Independent verification (checkpoint)
A second, parameterised environment runs the acceptance battery green, with a deployment report draft whose numbers come from that environment.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Tell me about deploying this for a customer' — brief → mess → permissions → evals → environment, 2 minutes.
2. Generative: list what was parameterised vs what had to change in code — the code list is the platform's honest debt.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
