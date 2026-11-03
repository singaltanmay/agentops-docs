# Consolidation — ablation table v1 and the Week 1 mixed gate

**Week 1 · Review · 60 min (light)** · Month 2 — RAG Hardening + Agents

## Objective
Close Week 1 with the mixed mastery gate and a committed ablation table v1 covering rewriting, HyDE, and contextual retrieval against the Month 1 baseline.

## Why this exists
Consolidation is scheduled learning, not a day off: the mixed gate is the only place KCs get promoted to `mastered`, and the ablation table is a Month 6 interview artefact.

## Prerequisites
Lessons 1–4 decisions all recorded.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 4 (Contextual retrieval — chunk context prefixes, measured)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 4 (Contextual retrieval — chunk context prefixes, measured)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
No new concept. Mixed assessment only: items interleave Month 1 retrieval KCs with this week's techniques, unlabelled.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Assemble ablation table v1
One committed table: baseline (Month 1 winner) + each technique, with quality, p95, and cost columns; every row traceable to a harness run.

**Expected output:** Table committed to the project repo under `evals/`.

### Step 2 — Mixed gate (8–10 items)
Closed-book items across: RRF fusion, structured outputs, chunking configs, rewriting, HyDE, contextual retrieval, contamination controls.

**Expected output:** Score recorded in PROGRESS.md; any KC below the bar is marked `fragile` with a repair item scheduled.

### Step 3 — Pay down one debt item
Pick the oldest open debt-log item (assisted step, fragile KC, unresolved failure mode) and repair it.

**Expected output:** Debt log shrinks by one; repair evidence linked.

### Step 4 — Week retro + spend check
15-min cost review vs the Month 2 budget column (≈$152) + one paragraph: what this week's numbers changed your mind about.

**Expected output:** Retro committed; spend within the month column or the variance explained in one line.

## Independent verification (checkpoint)
Ablation table v1 committed; gate score and KC state changes recorded in PROGRESS.md; one debt item closed with evidence.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: given three anonymised harness rows, identify which technique each row most likely represents and justify from the numbers.
2. Teach-back: 'Tell me how you decide whether a retrieval technique earns its latency' — 4 sentences, numbers required.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
