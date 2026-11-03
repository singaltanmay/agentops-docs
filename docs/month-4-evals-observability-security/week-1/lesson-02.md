# Deterministic checks first — the scorer layer that isn't a judge

**Week 1 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Expand the deterministic scorer layer (citation resolution, schema validity, refusal correctness, budget compliance, tool-selection correctness) so every suite maximises what's checked mechanically before any judge is consulted — verified by a scorer coverage report per suite.

## Why this exists
Judges are expensive, noisy, and Month 4's calibration burden. Every property checkable by code *must* be checked by code: deterministic checks are free, exact, and CI-safe. The judge is reserved for genuinely judgment-shaped properties.

## Prerequisites
Lesson 1 runner live; Month 1–3 scorers inventoried.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 1 (One eval runner — RAG and agent suites behind a single harness)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 1 (One eval runner — RAG and agent suites behind a single harness)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Inventory method: for each suite item property, classify: `mechanical` (code decides), `judge` (rubric decides), `human-only` (today: nothing should stay here except calibration labels). Citation checks from Month 1 generalise: any claim-bearing output can be checked for citation presence/resolution mechanically. Refusal correctness on the adversarial slice is mechanical (answerable flag + no fabricated chunks).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Property inventory per suite
Table: property × suite × decider (mechanical/judge) — committed as `evals/scorer-map.md`.

**Expected output:** Map covers all three suites; every property has exactly one decider.

### Step 2 — Implement the missing mechanical checks
Top gaps first (expected: citation-resolution on agent answers, tool-selection match on staged tasks, budget-compliance flags from traces).

**Expected output:** New checks run inside the runner; a seeded bad output (dangling citation) fails mechanically.

### Step 3 — Coverage report
Runner emits per-suite: % of item-properties decided mechanically.

**Expected output:** Report committed; the % is quoted in the Month 4 notes (it should rise vs the Month 1 era — verify, don't assume).

### Step 4 — Freeze scorer versions
Scorer code version recorded per run (envelope already carries it — wire it).

**Expected output:** A run row names its scorer version; re-running an old suite with a new scorer is visibly a different measurement.

## Independent verification (checkpoint)
Scorer map committed; seeded-bad outputs fail mechanically; coverage report quantifies how little actually needs the judge.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the five mechanical checks and the property each decides.
2. Planted-bug: a check verifies citations *exist* but not that the cited chunk supports the claim. Which layer owns the residual property, and what's it called in Ragas terms?
3. Teach-back: 'Deterministic first' — the cost, latency, and trust argument in 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
