# Durable state — Postgres checkpointer and resume

**Week 1 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Wire LangGraph checkpointing to the existing Postgres so agent runs persist per-thread state — verified by killing the agent process mid-task and resuming the thread to completion with no repeated tool calls.

## Why this exists
Durability is the difference between a demo agent and a system: long tasks, crashes, and human pauses (Lesson 4's approval gate) all require state that outlives the process. Your Postgres has been waiting for this since Month 2.

## Prerequisites
Lessons 1–2 done; Postgres B1ms live with the Month 2 schema.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 2 (LangGraph rebuild II — workflow patterns as subgraphs)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 2 (LangGraph rebuild II — workflow patterns as subgraphs)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
A **checkpointer** persists graph state at each step, keyed by `thread_id`. Resume = invoke the same thread again; the graph continues from the last checkpoint. **UNVERIFIED:** the exact Postgres checkpointer package/class and setup calls for your pinned LangGraph version — the official LangGraph persistence docs for that version are ground truth; record the package + version you install in the migration log. Idempotency rule that no framework gives you for free: tool calls with side effects must carry idempotency keys, or a resume can double-execute them (your current tools are read-only — the write tool in Lesson 4 is where this bites).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Install + configure the checkpointer
Per the pinned version's official persistence docs: add the Postgres-backed checkpointer, pointed at the existing database (own schema/tables, separate from app state).

**Expected output:** Checkpointer tables appear in Postgres after the first run; connection uses the Key Vault-sourced string.

### Step 2 — Thread a task
Run a multi-step task with an explicit `thread_id`; inspect the checkpoint rows mid-run.

**Expected output:** Rows exist per step for the thread; state fields match your schema (spot-check step count + messages).

### Step 3 — Kill and resume
Start a long task, kill the agent process after step ≥2, restart, resume the same thread.

**Expected output:** Task completes; the trace shows pre-kill steps are NOT re-executed (tool-call count matches the uninterrupted run).

### Step 4 — Record the guarantees — and their edges
Migration log gains a durability note: what survives (graph state), what doesn't (in-flight tool call at kill time), and the idempotency rule for future write tools.

**Expected output:** Note committed; the in-flight-call behaviour was actually observed in the kill test, not assumed.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Resume replays early tool calls | thread_id not propagated, or a new thread created per invoke | Assert the same thread_id across kill/restart in the test harness; log thread_id at every step |
| Checkpoint tables grow unboundedly | No retention thinking | Note a retention task in the backlog (prune completed threads > N days) — Month 4 observability will want the table anyway |

## Independent verification (checkpoint)
Kill/resume demonstrated with tool-call parity; checkpoint rows inspected; durability note records observed (not assumed) behaviour.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the resume contract — what the caller supplies, what the system guarantees, what it explicitly does not.
2. Prediction: you kill the process *during* a tool call that had a side effect. Without idempotency keys, what happens on resume, step by step?
3. Transfer: the approval gate (next lesson) pauses a thread for 2 days. Which rows/config make that pause safe — expiry, cleanup, and who can resume?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
