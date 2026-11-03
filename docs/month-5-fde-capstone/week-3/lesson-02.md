# Build the orchestrator-workers extension

**Week 3 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Implement the extension per the design: orchestrator node (plan → delegate → synthesise) + read-only workers on isolated contexts, all inside the existing graph/budget/trace machinery — verified by a staged 3-source research task completing with per-worker traces.

## Why this exists
Implementation reuses everything: workers are graph runs with scoped state, notes are the Month 3 schema, budgets are Month 2's controls per worker. New code should be mostly topology — if you're rewriting machinery, the design was wrong.

## Prerequisites
Lesson 1 design + protocol committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 1 (Read-only multi-agent design — orchestrator-workers, scoped hard)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 1 (Read-only multi-agent design — orchestrator-workers, scoped hard)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Build order: worker first (a read-only agent run with a note-shaped output), then the orchestrator's planner (structured plan: sub-tasks with tool scopes), then synthesis (merge notes, resolve conflicts explicitly — conflicting worker findings are surfaced, never averaged silently), then wiring into the API behind a mode flag (`mode: multi`) so the control stays one flag away.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Worker runs
Implement the worker as a scoped graph invocation: task slice in, structured note out, own budget + trace thread.

**Expected output:** A direct worker call on a staged sub-task returns a valid note; trace shows its isolated context size.

### Step 2 — Orchestrator: plan + delegate
Planner emits sub-tasks (≤ cap); workers run concurrently (bounded); orchestrator collects notes.

**Expected output:** Staged research task shows 1 plan + ≥2 worker threads in traces.

### Step 3 — Synthesis with conflict surfacing
Synthesis consumes notes only (not worker transcripts); conflicting claims are flagged in the output with both sources cited.

**Expected output:** A staged conflict task produces a flagged, dual-cited answer — not a silent pick.

### Step 4 — Mode flag + guardrails check
`mode: multi` behind the router as an explicit choice (not a default); PRIVILEGES updated: workers' tool scopes are read-only *by server-side enforcement* (MCP scopes), not by prompt.

**Expected output:** PRIVILEGES.md updated; a worker attempting the write tool is refused by scope (demonstrated).

## Independent verification (checkpoint)
A staged multi-source task completes end-to-end in multi mode with isolated worker traces, note-based synthesis, and scope-enforced read-only workers.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: draw the topology with the data that crosses each boundary (plan, slices, notes, synthesis) — and what never crosses.
2. Planted-bug: synthesis quietly drops a worker's contradicting note. Which pre-mortem item is this, and which staged test catches it?
3. Prediction: token cost per task vs the control — your protocol's guess, recorded now for Lesson 3's reality check.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
