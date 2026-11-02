# Agent eval wiring — success, cost, and failure, per run

**Week 4 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Promote the Week 3 benchmark into a repeatable eval: agent-tasks run as a harness mode writing to Postgres, with per-run success / cost-per-success / taxonomy breakdown — verified by re-running 10 tasks and querying the run summary.

## Why this exists
Month 3 changes the agent's framework. Without a standing agent eval, 'LangGraph version is better' is unfalsifiable. This lesson freezes the measuring instrument before the migration.

## Prerequisites
Benchmark artefacts from Week 3 deep build; eval tables in Postgres (Week 2).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 4, Lesson 3 (Parallelization — fan out independent sub-questions (read-only))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 4, Lesson 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 4, Lesson 3 (Parallelization — fan out independent sub-questions (read-only))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Same discipline as the RAG harness: frozen tasks (`agent-tasks-v1`), pinned scorer versions, config + commit per run. Agent-specific aggregates: success rate, mean steps, budget-stop rate, cost per *successful* task, top failure categories. Runs are cheap enough to run per-change (subset 10) and per-week (full 50).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Register the task set
Load `agent-tasks-v1.jsonl` into Postgres (or reference by hash) with scorer version recorded.

**Expected output:** `agent-tasks-v1` appears as a named eval suite; its content hash matches the committed file.

### Step 2 — Harness mode: agent eval
One command runs N tasks through the current agent build and writes run + per-task rows (success, steps, tokens, cost, failure category).

**Expected output:** 10-task run completes; rows queryable.

### Step 3 — Run-summary query/view
Saved view: per run — success %, cost/success, budget-stop %, top-3 failure categories.

**Expected output:** View returns the 10-task run's summary; numbers match a hand-check of 3 tasks.

### Step 4 — Baseline freeze
Run the full 50 on the current (raw-loop) agent and tag the run `pre-langgraph-baseline`.

**Expected output:** Tagged run exists; this is the run Month 3 must beat or explain.

## Independent verification (checkpoint)
Full-50 baseline run tagged in Postgres; summary view reproduces its headline numbers; the 10-task subset runs in minutes as a per-change check.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the five per-run aggregates and why cost is per *successful* task.
2. Prediction: Month 3's first LangGraph run regresses success by 5 points but halves budget-stops. Is it better? State the decision rule you'd apply.
3. Transfer: which RAG-harness rule (from Week 1 Lesson 1) applies unchanged to agent evals, and which one needs an agent-specific amendment?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
