# Parallelization — fan out independent sub-questions (read-only)

**Week 4 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Implement sectioning-style parallelization: split an independent-parts question into sub-questions, answer them concurrently against the RAG path, and merge — verified by a latency win on staged compound questions with no quality loss on the tuning subset.

## Why this exists
The third workflow pattern, and the safe half of multi-agent thinking: parallel *reads* are safe; parallel *writes* are where conflicting implicit decisions breed (the Month 5 multi-agent design depends on your having internalised this line).

## Prerequisites
Router + evaluator lessons done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 4, Lesson 2 (Evaluator-optimizer — generate, judge, revise, measured)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 3, Lesson 6):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 4, Lesson 2 (Evaluator-optimizer — generate, judge, revise, measured)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Independence test: sub-questions are parallelizable only if no sub-answer changes another sub-question. The merge step is a generation call over sub-answers + their citations; citations must survive the merge (each merged claim keeps its chunk IDs). Concurrency is bounded (small fan-out cap) and each branch inherits the per-task budgets from Week 3.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement the splitter + fan-out
Compound question → 2–4 sub-questions (structured output) → concurrent RAG calls (bounded fan-out) → merge with citation preservation.

**Expected output:** A staged compound question ('Compare X and Y on A and B') produces a merged answer whose citations resolve per sub-answer.

### Step 2 — Guard the independence test
Add a staged dependent question (sub-answer 2 needs sub-answer 1's result) and show the splitter declining to parallelize (falling back to the agent path via the router).

**Expected output:** Dependent case trace shows no fan-out; routing note explains why.

### Step 3 — Measure
Latency + quality on 15 staged compound questions: sequential agent vs parallel path.

**Expected output:** Comparison recorded: latency delta and a hand-scored quality check (no claim lost in merge on ≥14/15).

### Step 4 — Taxonomy + log
Add `merge dropped claim` as an anticipated category if unseen; note the fan-out cap in PRIVILEGES/config.

**Expected output:** Config + taxonomy updated and committed.

## Independent verification (checkpoint)
Compound-question latency win recorded with citation integrity spot-checked; the dependent-question fallback demonstrably refuses to parallelize.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the independence test in one sentence and the merge step's citation rule.
2. Planted-bug: a merge output attributes sub-answer 2's claim to sub-answer 1's chunk. Which verification from Month 1 catches this mechanically?
3. Teach-back: 'Parallel reads safe, parallel writes dangerous' — explain with a concrete Workbench example of each.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
