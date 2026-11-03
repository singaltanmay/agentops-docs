# Consolidation — migration mixed gate + durability drills

**Week 1 · Review · 60 min (light)** · Month 3 — Agentic Systems + MCP

## Objective
Pass the Week 1 mixed gate and drill the two new failure disciplines: kill/resume and gate expiry, unaided.

## Why this exists
Durability and approval are Month 4 audit surfaces. Fluency here — not just a passing build — is what the mixed gate certifies.

## Prerequisites
Lessons 1–4 done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 4 (The human-approval gate — a write tool, paused for a human)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 4 (The human-approval gate — a write tool, paused for a human)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
No new concept. Drills are production, not review: you perform the operations cold.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Month 2 + Week 1: loop mechanics, state schema, checkpointer contract, interrupt semantics, idempotency, budget controls.

**Expected output:** Score in PROGRESS.md; fragile KCs get repair items.

### Step 2 — Cold drill: kill/resume
Unaided: start a task, kill mid-run, resume, verify tool-call parity — from memory of the procedure.

**Expected output:** Drill completes; any step you needed the guide for is logged as `assisted` with a 48 h repair probe.

### Step 3 — Cold drill: gate decision
Unaided: drive a staged task to the gate, reject it, confirm zero writes + clean termination.

**Expected output:** Drill completes; audit rows present.

### Step 4 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

## Independent verification (checkpoint)
Gate recorded; both drills performed with any assisted steps honestly logged and repair probes scheduled.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three anonymised traces (checkpoint resume, gate rejection, budget stop) — name the mechanism in each and one way it can fail.
2. Teach-back: 'What makes this agent durable?' — answer naming state, checkpointer, idempotency, and the gate, one sentence each.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
