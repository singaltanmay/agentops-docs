# Day 30 — Month 1 retrospective — spend, surprises, Month 2 backlog

**Week 4 · Gate · 75 min** · Month 1 — Production RAG

## Objective
Close Month 1 with a committed retrospective (actual spend vs the ~$116 plan, what the numbers changed your mind about) and a Month 2 backlog written as issues — verified by the retro existing with both sections and the final assertion suite green on production.

## Why this exists
A month that ends in a demo evaporates; a month that ends in a written record compounds. The retrospective is also the trajectory document: Month 2 (agent + your own MCP server, Postgres B1ms joining for checkpoints) inherits its priorities from Day 29's taxonomy, not from enthusiasm. And the spend reconciliation closes the loop Day 1 opened — budget discipline, demonstrated over a full month, is itself a portfolio artefact.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 29):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 27):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 23):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 29's independent verification ("Failure analysis — the taxonomy is the deliverable") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new concept — synthesis. The one discipline: every retro claim cites an artefact from the month (a table, a decision record, a gate sheet). Opinions without artefacts go in a clearly-marked 'hunches' line, max three.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Reconcile spend
Cost Management export for the month vs the plan lines (Search, AOAI, Container Apps, ACR, monitoring). Variance per line + cause. Target: within ±20% of ~$116.

**Expected output:** Spend table in the retro. The Basic-tier start date (Day 11) explains the Search line's proration — show it.

### Step 2 — Write the surprises
Three sections: (1) what the numbers changed your mind about (chunking? ranker? judge?), (2) what you'd do in a different order, (3) hunches (≤3, labelled).

**Expected output:** Each claim in (1)–(2) cites its artefact. This page gets read at every future month gate.

### Step 3 — Write Month 2 as issues
Backlog from the taxonomy fixes + the trajectory: LangGraph agent over this RAG, your own MCP server (search / golden-set / eval tools) on Container Apps, Postgres B1ms for checkpoints + eval results, τ-bench-style task set for agent success. Each issue: objective + exit metric, Day-guide style.

**Expected output:** Issues created in the repo tracker; the top taxonomy fix is issue #1 — visibly, not by assertion.

### Step 4 — Final production assertions
Day 17's script + Day 28's aggregates re-confirmed against production as it stands tonight.

**Expected output:** All green, logged as Month 1's closing state.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Spend materially over plan with no single cause | Death by a thousand cuts (logging verbosity is the usual suspect) | Break the monitoring line down by day in Cost Analysis; the retro names the top day + cause or the retro isn't done |
| Retro reads like a victory lap | No failures section = a document nobody can learn from | Add the 'what broke / what I'd reorder' content from the gate sheets — they already contain it; fixed when every week contributes at least one honest item |
| Backlog balloons to 30 issues | Month 2 planning by enthusiasm | Cap at ~10, ordered, each with an exit metric; the rest go to a parking file — Day 25's freeze discipline, applied to planning |

## Independent verification (checkpoint)
Retro + issues + green assertions, all committed and cross-linked. A stranger could reconstruct Month 1 — what was built, what it cost, what it proved, what happens next — from the repo alone.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Final mixed gate (whole month, 10 items, closed-book, confidence-tagged): one per KC cluster. Score it, log calibration one last time, and compare with Day 7's — the delta is your month, in miniature.
2. Teach-back (the interview rehearsal): 'Tell me about a production RAG system you built and how you know it's good.' Answer in 6 sentences using only Month 1 artefacts and numbers.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow is the buffer day: v1.1 candidates triage, docs polish, and a demo recording if you want one. Month 2 starts Monday — LangGraph first, MCP right behind it.
