# Human labelling sprint — 120 outputs, your labels

**Week 2 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Label the Week 1 sample (120 outputs) against the frozen rubric — binary per judge-target category — in two sittings with a self-consistency re-label of 20 items — producing the ground-truth set the judge will be calibrated against.

## Why this exists
The judge is only ever as good as these labels. This is deliberately *your* labour (like the 100-trace read): calibration against labels you don't trust is theatre.

## Prerequisites
Week 1 gate passed; labelling set + rubric frozen.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 6 (Deep build — the eval platform v1 freeze)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 6 (Deep build — the eval platform v1 freeze)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Labelling discipline: label in random order (the export already shuffles), no consulting traces/configs beyond the output + its retrieved context (that's all the judge will see either), and mark `uncertain` honestly instead of forcing — uncertain items are excluded from calibration scoring but counted (a high uncertain rate is a rubric finding, not a you finding). Self-consistency: 20 items re-labelled blind in sitting 2; disagreements get adjudicated and the rubric gains a clarifying example.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Sitting 1: label 60
Work the sheet in order; record labels + uncertain flags; no mid-sitting rubric edits.

**Expected output:** 60 rows labelled; uncertain rate noted.

### Step 2 — Sitting 2: label 60 + 20 re-labels
Remaining 60, then the 20 blind duplicates.

**Expected output:** 120 + 20 rows complete.

### Step 3 — Adjudicate + consistency score
Compute self-agreement on the 20; adjudicate disagreements; append clarifying examples to the rubric (as v1.1 — the calibration set was labelled under v1; note it).

**Expected output:** Self-agreement % recorded; if <85%, the rubric — not the judge — is Week 2's first fix.

### Step 4 — Freeze the label set
Commit labels as `calibration-v1` (IDs + labels + rubric version).

**Expected output:** Frozen artefact exists; it is never edited afterwards — corrections would be a v2 with its own sprint.

## Independent verification (checkpoint)
`calibration-v1` frozen with a measured self-agreement rate; rubric v1.1 carries the adjudication examples.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the labelling design's four properties (stratified, blinded, success-inclusive, rubric-first) and what each protects.
2. Prediction: your uncertain rate is highest on one category. Which, and what does that predict about the judge's ceiling there?
3. Teach-back: why is *self*-consistency measured before judge agreement? What would judge-vs-you agreement mean if you-vs-you is 70%?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
