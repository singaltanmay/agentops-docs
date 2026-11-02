# Consolidation — calibration mixed gate

**Week 2 · Review · 60 min (light)** · Month 4 — Evals, Observability & Security

## Objective
Pass the Week 2 mixed gate and write the judge usage policy: which judges may gate, which may only trend, which categories stay human/mechanical — signed off before Week 3 wires anything into CI.

## Why this exists
CI gates built on undeclared judges are how teams learn to ignore their own pipelines. The policy is the contract Week 3 implements.

## Prerequisites
Lessons 1–4 done; calibration table + bias annex committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 4 (Calibration II — judge bias checks (position, verbosity, self-preference))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 4 (Calibration II — judge bias checks (position, verbosity, self-preference))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
No new concept. The policy is a decision artefact: per category — decider of record (mechanical / judge-gated / judge-trend+human / human), the evidence (matrix + annex), and the re-calibration triggers (model change, rubric change, monthly drift check).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Weeks 1–2: envelope, scorers, taxonomy method, calibration loop, TPR/TNR, biases.

**Expected output:** Score in PROGRESS.md; repairs scheduled.

### Step 2 — Write the judge usage policy
One page in `evals/`: the per-category table + re-calibration triggers + the resistant categories' handling.

**Expected output:** Policy committed; Week 3's gate design references it line by line.

### Step 3 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

### Step 4 — Spend check
Month 4 actuals vs ≈$161; judge-call costs from calibration runs itemised (they're the new line item).

**Expected output:** Calibration spend recorded; projection for online sampling (Week 3) estimated from it.

## Independent verification (checkpoint)
Policy committed before any CI wiring; gate recorded; Week 3's design inputs are all frozen artefacts.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three category scenarios — assign each a decider of record from the policy and justify in one line.
2. Teach-back: why TPR *and* TNR, never agreement alone — with a numeric example where 90% agreement hides a useless judge.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
