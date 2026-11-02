# Consolidation — Month 3 mixed gate

**Week 4 · Review · 60 min (light)** · Month 3 — Agentic Systems + MCP

## Objective
Pass the Month 3 mixed gate: interleaved assessment across the graph migration, MCP, durability, context engineering, tracing, and the ambient pattern.

## Why this exists
Month 4 assumes all of Month 3 as *infrastructure*. The gate is the last cheap moment to find a fragile layer before evals and security build on it.

## Prerequisites
Lessons 1–4 (Week 4) done; taxonomy v2 committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 4, Lesson 4 (Month 3 integration — the ambient pattern: event-driven trigger)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 4, Lesson 4 (Month 3 integration — the ambient pattern: event-driven trigger)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
No new concept. The gate samples operations, not just recall: two items are performed drills (resume a thread; reconstruct a task from logs).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (10–12 items)
Closed-book across Months 2–3, weighted to Month 3: state/checkpointing, interrupts, MCP contracts, transports, context sections, compaction, routing, span schema, SLOs.

**Expected output:** Score in PROGRESS.md; KC changes recorded.

### Step 2 — Drill: reconstruct from logs
Given a trace ID, produce the task's story from the saved KQL alone.

**Expected output:** Story matches the run's known outcome.

### Step 3 — Drill: gated write, cold
Drive a staged write to the gate and reject it, unaided.

**Expected output:** Zero writes; clean termination; audit rows present.

### Step 4 — Pay down one debt item + spend check
Oldest debt item repaired; Month 3 actuals vs ≈$165 reviewed.

**Expected output:** Both recorded in the retro notes.

## Independent verification (checkpoint)
Gate + both drills recorded; Month 4 prerequisites (taxonomy v2, tracing, weekly report) confirmed live.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: four anonymised incidents (one per Month 3 week) — name the layer and the control that owns each.
2. Teach-back: 'The Workbench as a platform' — describe the system as Month 4 will inherit it, in 6 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
