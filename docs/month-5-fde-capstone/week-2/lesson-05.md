# Consolidation — capstone mixed gate (deployment half)

**Week 2 · Review · 60 min (light)** · Month 5 — FDE Capstone

## Objective
Pass the Week 2 mixed gate and freeze the deployment state (config, corpus version, golden versions) that Weeks 3–4 will extend — extensions must not silently mutate the measured deployment.

## Why this exists
Weeks 3–4 add a multi-agent mode and a fine-tuning experiment *next to* the deployment. Freezing the deployment's measured state now keeps their comparisons honest (same sin as tuning on held-out, different costume).

## Prerequisites
Lessons 1–4 done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 4 (Adoption + outcome measurement — did it work for the customer?)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 4 (Adoption + outcome measurement — did it work for the customer?)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Freeze contents: deployed config hash, corpus snapshot ID, `customer-golden-v1` version, judge/rubric versions, SLO table. Any later change re-baselines explicitly (a new tagged run + a note), never silently.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across the capstone so far + Month 4: brief, trimming, field loop, calibration limits, trifecta.

**Expected output:** Score in PROGRESS.md; repairs scheduled.

### Step 2 — Freeze the deployment state
Tag + record the freeze contents in the deployment report.

**Expected output:** Freeze block present with all five identifiers.

### Step 3 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

### Step 4 — Spend check
Month 5 actuals vs ≈$187; LoRA envelope ($40) still intact and separately tracked.

**Expected output:** Spend table updated; the LoRA line reads $0 spent so far (or the discrepancy is explained).

## Independent verification (checkpoint)
Deployment state frozen with identifiers recorded; Weeks 3–4 comparisons have a fixed reference.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three changes — for each: does it require a re-baseline of the deployment, a golden-set version bump, or neither? Justify.
2. Teach-back: why freeze before extending — the measurement-integrity argument in the capstone's own terms.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
