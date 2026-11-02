# Day 29 — Failure analysis — the taxonomy is the deliverable

**Week 4 · Build · 75 min** · Month 1 — Production RAG

## Objective
Open-code every failing tuning-split trace into a failure taxonomy with counts, where the top class carries a named Month 2 fix — verified by the taxonomy covering ≥90% of failures with a class + evidence link per class.

## Why this exists
Headline scores don't tell you what to build next; a counted taxonomy does. Hamel's method is manual on purpose: you read the traces yourself, group what you actually see (retrieval miss / wrong chunk ranked / generation ignored context / ambiguous question / golden answer wrong), and let the counts — not your prior beliefs — set Month 2's agenda. Expect one surprise: some failures will be the golden set's fault. Those are the most valuable rows in the building.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 28):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 26):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 22):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 28's independent verification ("The first Ragas report — winner vs ablation") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Direct instruction, then independent coding:** the method in five moves — sample broadly (all failures, not a sample, at this scale) → open-code in your own words first → group into classes only after coding → count → assign each top class an owner-fix. Guardrail: 'golden answer wrong' and 'question ambiguous' are first-class classes, not embarrassment bins — an eval set that can't be wrong can't measure anything.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Assemble the failure queue
From Run A's per-question CSV: every row failing any metric's bar, with question, answer, chunks, reference, scores — one readable file.

**Expected output:** Queue count stated; it reconciles with the report's aggregates (failures counted two ways agree).

### Step 2 — Open-code, then group
First pass: a free-text note per failure, no categories allowed. Second pass: group the notes into classes; name classes from the notes, not from this guide's list (compare afterwards — overlap is reassuring, divergence is interesting).

**Expected output:** Taxonomy table: class, count, % of failures, 2 example row IDs per class.

### Step 3 — Adjudicate the golden-fault rows
For every 'golden wrong/ambiguous' case: fix the row in a `golden-v1.1-candidates` file (v1.0 stays frozen) or defend the row in writing.

**Expected output:** Each such row has a disposition. The candidates file is Month 2's first eval task, pre-written.

### Step 4 — Name the fixes
Top class → a concrete Month 2 fix (a build task, not 'improve retrieval'). Second class → a fix or a stated reason it waits. Write both into the report.

**Expected output:** Report's conclusions section now writable — and short, because the taxonomy does the talking.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| One class swallows everything ('retrieval miss' at 80%) | Class too coarse to act on | Split by mechanism (term mismatch? chunk boundary? ranking depth?) until each sub-class implies a different fix; fixed when every class maps to a distinct action |
| Coding drifts halfway (same failure, two names) | No codebook discipline | Write one-line definitions as classes emerge and re-check the first 10 against them at the end; fixed when a re-read of 10 agrees with the original codes |
| No golden-fault rows found at all | Statistically implausible at 160 hand-written rows — suggests defensive coding | Re-examine 5 'generation' failures specifically for question ambiguity before accepting a zero; a true zero, evidenced, is acceptable |

## Independent verification (checkpoint)
Taxonomy coverage ≥90% of the failure queue, counts summing correctly, every class carrying example row IDs a reader can open. The report's conclusions cite taxonomy counts, not impressions.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: your taxonomy's top two classes, their counts, and their fixes — 4 sentences, closed-book, as if briefing your manager.
2. Debugging-the-eval: pick the class you'd most expect a lazy analysis to invent ('the model is just bad at X'). Why is it not in your taxonomy — what evidence excluded it?
3. Calibration: compare the actual top class with Day 22's prediction. State the update to your mental model in one sentence.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: the Month 1 retrospective + Month 2 backlog as issues. Bring the spend export — the retro reconciles plan vs actual to the dollar.
