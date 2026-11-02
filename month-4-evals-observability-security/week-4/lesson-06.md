# Deep build — Month 4 gate: full platform regression + security re-test

**Week 4 · Deep build · ~3 hrs** · Month 4 — Evals, Observability & Security

## Objective
Run the Month 4 gate battery on the hardened build: full eval suites, PR-gate drill re-run, nightly battery, and a fresh redteam generation (varied purpose phrasing) — closing with the Month 4 retrospective and the Month 5 deployment brief input.

## Why this exists
The gate proves the platform *and* the product survived hardening: security work that silently degrades quality is a classic own-goal, and only the full battery sees both sides at once.

## Prerequisites
All Month 4 weeks complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 4, Lesson 5 (Consolidation — security mixed gate + Month 4 evidence review)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 4, Lesson 5 (Consolidation — security mixed gate + Month 4 evidence review)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Fresh-eyes discipline for the re-test: regenerate a redteam variant with a rephrased purpose statement (Lesson 4's anti-overfit rule) alongside the frozen original suites — report both, labelled.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full eval battery
Golden + agent-50 + long-task spot set on the hardened build; compare vs `eval-platform-v1` baselines.

**Expected output:** Runs tagged `month-4-gate`; quality deltas tabled (hardening must not have cost quality silently).

### Step 2 — Gate drill re-run
The sabotage drill from Week 3, repeated against current prompts.

**Expected output:** Gate blocks the sabotage again (or the failure is diagnosed to a named change since).

### Step 3 — Fresh redteam variant
Regenerate (varied purpose) + run; compare vs Lesson 4's after-numbers.

**Expected output:** Variant results committed, labelled as fresh-generation; no cherry-picking between the two attack sets.

### Step 4 — Retrospective + Month 5 input
Spend vs ≈$161; surprises; the deployment brief's constraints harvested (SLOs, security posture, cost envelope) as Month 5 Week 1 inputs.

**Expected output:** Retro + Month 5 input note committed; Month 5 prereqs confirmed.

## Independent verification (checkpoint)
Month 4 closes with quality and security both measured on the same build, and Month 5 inherits a written constraints brief.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'How do you know your agent is good — and safe?' — the platform answer, 2 minutes, four numbers minimum.
2. Generative: list Month 5's inherited constraints (SLOs, posture, envelope) from memory.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
