# Stopping, budgets, and loop safety

**Week 3 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Replace the constant step cap with a budget system: max steps, per-task token ceiling, per-tool timeout, and duplicate-call detection — verified by a task engineered to run away being stopped by each control in turn.

## Why this exists
An agent without cost controls is an unbounded-concurrency billing incident
(OWASP LLM10 — the Month 1 resource-group budget, subscription spending limit,
and application-level token budgets are complementary safeguards). These
controls are also Month 3's durable-execution foundation.

## Prerequisites
Lesson 2 tool contract in place.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 3, Lesson 2 (Tool design — schemas, error returns, and least privilege)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 6):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 3, Lesson 2 (Tool design — schemas, error returns, and least privilege)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Four independent controls, each with a distinct failure it catches: step cap (logic loops), token ceiling (verbose loops), tool timeout (hung dependencies), duplicate detection (identical call+args repeated = no new information). When a budget fires, the loop must end with a *partial-result answer + a budget note*, not an exception.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement the budget object
Config: `max_steps=8`, `max_tokens_per_task` (set from Lesson 1 traces — pick ~3× the median successful task), `tool_timeout_s=20`, `dup_window=2` identical repeats.

**Expected output:** Budgets live in config, logged at task start in the trace.

### Step 2 — Engineer a runaway
Craft a task that loops (ambiguous compare question + a stubbed tool returning near-duplicate results). Run with only the step cap active.

**Expected output:** Loop stops at the cap; final message is a partial answer naming the budget that fired.

### Step 3 — Fire each control in turn
Repeat with artificially tiny token ceiling, then a 1s tool timeout against a slowed stub, then duplicate detection against a repeating stub.

**Expected output:** Four traces, four different budget notes, zero unhandled exceptions.

### Step 4 — Cost accounting per task
Trace footer now totals tokens + estimated cost per task (rates from resources/azure-architecture-and-budget.md).

**Expected output:** Footer prints totals; a normal 2-step task's cost is on record for Week 3 Lesson 6's benchmark.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Budget fires but the user gets an error page | Budget treated as exception, not outcome | Budgets return a typed `stopped` result the answer layer renders as partial + note |
| Duplicate detection blocks a legitimate retry | Retry-after-error has identical args | Count duplicates only on *successful identical observations*; error retries are Lesson 2's path |

## Independent verification (checkpoint)
Four runaway traces, four distinct budget stops, all ending in graceful partial answers; per-task cost footer working.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: name the four controls and the distinct failure each one catches.
2. Prediction: a task legitimately needs the same search twice with identical args but different *context* (results changed because an earlier tool wrote state). Which control misfires, and what's the refined rule?
3. Teach-back: why is the Azure budget alert (Month 1) not a substitute for in-loop budgets? Two mechanisms, two timescales.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
