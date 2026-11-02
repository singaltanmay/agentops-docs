# Binary judges per category — build and first light

**Week 2 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Implement one binary LLM judge per judge-target category (judge model = `gpt-4.1-mini`, rubric-derived prompts, strict structured verdicts) and run them over `calibration-v1` — producing raw confusion matrices per category.

## Why this exists
One judge per failure category with a binary verdict is the Hamel/Husain pattern: scoped judges are calibratable; one mega-judge with a 1–5 rubric is not. Today they run uncalibrated — Week 2's remaining lessons earn them trust or reject them.

## Prerequisites
Lesson 1 labels frozen.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 1 (Human labelling sprint — 120 outputs, your labels)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 1 (Human labelling sprint — 120 outputs, your labels)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Judge prompt anatomy: the category definition (from taxonomy v3), the binary question (from the frozen rubric), 2–3 labelled examples (from the rubric, *not* from the calibration set — no leakage), the output + context, and a forced structured verdict `{verdict: bool, evidence: <quoted span>}`. The quoted-evidence requirement is load-bearing: a verdict without a span is unauditable and gets discarded in scoring.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement judge #1
First category end-to-end: prompt, structured verdict, evidence span, runner integration as a scorer.

**Expected output:** Judge runs over the calibration slice for its category; verdicts + spans stored.

### Step 2 — Score it raw
Confusion matrix vs your labels: TP/FP/TN/FN, agreement %, and — the numbers that matter — TPR and TNR.

**Expected output:** Matrix committed; TPR/TNR computed (not just agreement).

### Step 3 — Clone to remaining categories
Same shape per category; only definition/question/examples differ.

**Expected output:** All judge-target categories have raw matrices.

### Step 4 — Read 10 disagreements per judge
For each judge, read 10 judge-vs-you disagreements and code: judge wrong / you wrong (label error) / genuinely borderline.

**Expected output:** Disagreement codes recorded — they aim the calibration fixes in Lessons 3–4.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Judge agrees with you ~100% | Leakage or a trivial category | Check examples for calibration items first; if clean, check whether the category is actually mechanical in disguise (Lesson 2 of Week 1 owns it) |
| Evidence spans don't support verdicts | Judge pattern-matching tone, not content | Score span-validity separately on the disagreements; a judge with right verdicts + wrong spans is not calibrated, it's lucky |

## Independent verification (checkpoint)
Every judge-target category has a judge + raw confusion matrix with TPR/TNR; disagreements are coded, not just counted.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the judge prompt's five components and the leakage rule for examples.
2. Prediction: which is worse for a *regression gate* — a judge with TPR 0.95/TNR 0.70 or TPR 0.70/TNR 0.95? Commit to an answer; Week 3 revisits it.
3. Planted-bug: a judge prompt includes three calibration-set items as examples 'to help it'. What exactly invalidates, and how would you detect it from the matrix alone? (You might not — that's the point.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
