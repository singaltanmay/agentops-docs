# Calibration I — fix the judge from its disagreements

**Week 2 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Iterate each judge using its coded disagreements (prompt/rubric clarification, example swaps — never calibration items) until per-category TPR and TNR both clear the bar you set, or the category is declared judge-resistant and routed to human/mechanical handling.

## Why this exists
Calibration is an engineering loop with an exit condition, not a vibe. The exit matters as much as the loop: a category that won't calibrate is a *finding* (it goes to the honest-handling list), and pretending otherwise poisons Week 3's gates.

## Prerequisites
Lesson 2 matrices + coded disagreements.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 2 (Binary judges per category — build and first light)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 2 (Binary judges per category — build and first light)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Fix discipline: change ONE thing per iteration (definition wording, one example, evidence requirement), re-run the full calibration slice, record the matrix delta in the calibration log. Bars (set now, from the gate's needs): target **TPR ≥ 0.85 and TNR ≥ 0.85** per category for gate use; a judge between 0.75–0.85 may serve for *trend* reporting only; below that, judge-resistant. These thresholds are this course's operating choice, recorded as such.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Set the bars in writing
Record the gate/trend/reject thresholds in the calibration log before iterating.

**Expected output:** Thresholds committed before any fix is attempted (order matters, as with the rubric).

### Step 2 — Iterate judge #1 to a verdict
Loop: hypothesise from disagreements → one change → re-run → log matrix. Max 4 iterations, then declare.

**Expected output:** Judge #1 lands in a declared band (gate / trend / resistant) with its final matrix.

### Step 3 — Repeat for remaining judges
Same loop, same log discipline.

**Expected output:** Every category declared; the log shows each iteration's single change + delta.

### Step 4 — Publish the calibration table
Per category: judge version, TPR, TNR, agreement, band, label-set + rubric versions.

**Expected output:** Table committed — this is a Month 6 portfolio artefact; make it readable.

## Independent verification (checkpoint)
Every judge-target category has a declared band backed by a final confusion matrix and an iteration log with one-change-at-a-time discipline.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the three bands and their thresholds, and which band each of your categories landed in.
2. Prediction: a judge's TPR rises but TNR falls after a prompt change. What did the change probably do to its decision threshold, and which disagreement codes predicted it?
3. Transfer: the generator model is upgraded next month. Which calibration artefacts survive, and what must be re-run?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
