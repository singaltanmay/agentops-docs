# Deep build — online eval wiring: sampled production scoring

**Week 2 · Deep build · ~3 hrs** · Month 4 — Evals, Observability & Security

## Objective
Wire the calibrated judges + mechanical checks into sampled online evals: a fixed sample of live-shaped traffic is scored asynchronously, results land in Postgres, and the weekly report gains judge-score trends with the policy's bands respected — verified on a staged traffic batch.

## Why this exists
Offline evals catch regressions before deploy; online evals catch the world changing after it. This build closes the loop — and it is where judge cost becomes a real budget line, so sampling is a design parameter, not an afterthought.

## Prerequisites
Week 2 policy signed off; Month 3 tracing live.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 5 (Consolidation — calibration mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 5 (Consolidation — calibration mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Design: sample rate set from the calibration-spend estimate (start ~10% of tasks, all failures-adjacent signals over-sampled via trace flags), scoring runs async (Container Apps Job on a schedule), judges only within their policy bands (trend judges trend; nothing gates here — gating is CI's job, Week 3). Every online score stores judge version + rubric version so trends survive re-calibration.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Sampling + async scorer
Implement the sampler + scheduled scoring job against staged traffic (replay Month 3 traces as the traffic source).

**Expected output:** A staged batch of 50 tasks yields ~the configured sample of scored rows in Postgres.

### Step 2 — Trend wiring
Weekly report gains judge-metric trends (per category, with band annotations from the policy).

**Expected output:** Report renders trends; a category in 'trend-only' band is visually distinct from gate-band categories.

### Step 3 — Cost governor
Per-day judge-spend ceiling in the scorer (circuit breaker, Month 2 pattern); breaching pauses scoring + logs, never silently samples less.

**Expected output:** Ceiling demonstrated by an artificially tiny cap firing on a big batch.

### Step 4 — Drift tripwire (manual v1)
Document the drift check: monthly, re-score 30 fresh human-labelled items (mini-sprint) and compare — procedure written, first execution scheduled in Month 5.

**Expected output:** Procedure committed in the policy doc; the calendar item exists in PROGRESS.md's routine.

## Independent verification (checkpoint)
Staged batch scored end-to-end with bands respected, cost governor demonstrated, and trends visible in the weekly report.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the online-eval contract: sample rule, async shape, version storage, governor behaviour.
2. Prediction: traffic doubles but the judge budget doesn't. Which knob preserves the most signal — lower sample rate or narrower categories? Defend with the taxonomy counts.
3. Transfer: a category's online trend drops 6 points over two weeks with no deploy. List three candidate causes in investigation order.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
