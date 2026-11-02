# Consolidation — evals mixed gate + labelling prep

**Week 1 · Review · 60 min (light)** · Month 4 — Evals, Observability & Security

## Objective
Pass the Week 1 mixed gate and prepare Week 2's human-labelling set: sample 120 outputs stratified by taxonomy category, blinded for labelling.

## Why this exists
Week 2 calibrates a judge against *your* labels. The labelling set's design (stratified, blinded, includes successes) determines whether the calibration number means anything.

## Prerequisites
Lessons 1–4 done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 4 (Eval design from the taxonomy — per-category eval specs)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 4 (Eval design from the taxonomy — per-category eval specs)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Labelling-set design: stratify by category (top judge targets over-sampled), include ~30% successes (a judge validated only on failures learns to fail everything), strip run/config identity (blind), and fix the label rubric *before* seeing outputs — binary per category ('does this output exhibit failure X: yes/no'), no Likert mush.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across the month so far: envelope, scorer map, taxonomy method, spec template, noise floor.

**Expected output:** Score in PROGRESS.md; repairs scheduled.

### Step 2 — Draw the labelling sample
120 outputs stratified per the design; export to the labelling sheet with IDs only.

**Expected output:** Sample composition matches the design (counts per stratum recorded).

### Step 3 — Freeze the label rubric
One page: per judge-target category, the binary question + 3 worked examples (from the reading log, already coded).

**Expected output:** Rubric committed *before* any labelling starts (git timestamp proves order).

### Step 4 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

## Independent verification (checkpoint)
Labelling set + frozen rubric exist, in that order; gate recorded.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three outputs (described) — for each, which decider (mechanical/judge/neither-yet) and why.
2. Teach-back: why must the rubric freeze before labelling — what bias does the reverse order bake in?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
