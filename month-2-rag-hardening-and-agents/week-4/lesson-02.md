# Evaluator-optimizer — generate, judge, revise, measured

**Week 4 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Wrap answer generation in an evaluator-optimizer loop (generator → rubric judge → revise once if below threshold) and measure quality gain vs cost on the tuning split — kept, gated, or dropped on numbers.

## Why this exists
The second workflow pattern from the same taxonomy, and the direct ancestor of Month 4's calibrated judge. The lesson is the *measurement*: an extra judge+revision on every request roughly doubles cost — it must buy visible quality.

## Prerequisites
Router live; Month 1 failure taxonomy at hand (the rubric grows out of it).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 4, Lesson 1 (Routing — classify first, then commit to a path)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 3, Lesson 5):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 4, Lesson 1 (Routing — classify first, then commit to a path)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Evaluator: a rubric-scored check (grounded? cites correctly? answers the actual question?) run by the judge model on the draft + retrieved chunks. Optimizer step: one revision pass with the judge's specific complaints. Hard rules: max one revision (no loops), the judge sees chunks (grounding is checkable) not just the answer, and revised answers are re-verified for citation integrity before shipping.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the rubric from the taxonomy
3–5 binary criteria drawn from Month 1's top failure classes (e.g. 'every claim supported by a cited chunk', 'answers the question asked').

**Expected output:** Rubric committed as a versioned file (`rubric-v1`) — Month 4 calibrates this exact artefact.

### Step 2 — Implement the loop
Generate → judge (structured verdict per criterion) → if any criterion fails, one revision with complaints → re-check citations.

**Expected output:** Trace shows verdict + (when triggered) revision; revision rate logged.

### Step 3 — Ablate it
Harness: loop on vs off over the tuning split; quality (Ragas subset + rubric pass rate), cost, p95.

**Expected output:** Two rows; quality delta and cost multiplier both explicit.

### Step 4 — Decide the gate
Keep always-on, keep gated (only when router confidence low / first answer's self-check fails), or drop — with numbers.

**Expected output:** Decision + gate condition (if any) implemented and recorded.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Judge passes ungrounded revisions | Revision introduced new claims the judge didn't re-check against chunks | Judge always receives the chunk set; a revision is judged fresh, not on its diff |
| Revision makes answers longer, not better | Rubric rewards completeness theatre | Add the criterion 'no claim beyond the question's scope' and re-run 20 questions |

## Independent verification (checkpoint)
Ablation rows exist; the decision (with its gate condition) is implemented; a deliberately ungrounded draft is caught by the evaluator in a staged test.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list rubric-v1's criteria from memory and name the failure class each came from.
2. Prediction: judge and generator are the same model family here. What bias does that risk (name it), and what does Month 4 do about it?
3. Transfer: which Month 1 metric should evaluator-optimizer move most — faithfulness or context recall? Why the other one barely moves.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
