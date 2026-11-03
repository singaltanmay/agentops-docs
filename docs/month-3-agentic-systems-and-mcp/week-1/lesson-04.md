# The human-approval gate — a write tool, paused for a human

**Week 1 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Add the system's first write tool (create a draft eval issue / file a failure report into Postgres + repo issues) behind a human-approval gate: the graph interrupts, a human approves or rejects, the thread resumes — verified by an unapproved write never executing in staged tests.

## Why this exists
This is the control that makes agents deployable around real systems, and a named requirement in the target postings (human-in-the-loop for irreversible actions). It also completes the lethal-trifecta discipline: the agent may *propose* external effects; a human disposes.

## Prerequisites
Lesson 3 checkpointer live (the gate is an interrupt + resume).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 3 (Durable state — Postgres checkpointer and resume)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 3 (Durable state — Postgres checkpointer and resume)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Pattern: the write-tool node calls the framework's interrupt mechanism *before* executing; state records the pending action (tool, args, idempotency key); an out-of-band human decision (API endpoint today, UI in Week 4) resumes the thread with approve/reject. Rejection is a normal outcome the agent must handle (report back, don't sulk-loop). **UNVERIFIED:** the exact interrupt API for your pinned version — official human-in-the-loop docs govern the spelling; the semantics above are the spec.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement the write tool (staged)
Tool: `file_failure_report` — writes a row + opens a repo issue (dry-run mode first: logs what it *would* do). Privilege statement updated: this is the first write; scope it to this single action.

**Expected output:** Dry-run invocations log the intended write; PRIVILEGES.md updated and committed.

### Step 2 — Insert the interrupt
Before execution, the graph interrupts with the pending action payload; thread state shows `awaiting_approval`.

**Expected output:** Staged task reaches the gate and stops; no issue/row created while paused.

### Step 3 — Approve + reject paths
Resume with approve → write executes once (idempotency key checked). Second staged task: resume with reject → agent reports the rejection and ends cleanly.

**Expected output:** Approve path: exactly one write. Reject path: zero writes + a graceful final message. Both traces complete.

### Step 4 — Timeout + audit
Pending approvals older than a set TTL expire (thread ends with `approval_expired`); every gate event (requested/approved/rejected/expired) lands in Postgres.

**Expected output:** An artificially aged pending approval expires on schedule; the audit query returns all four event types from today's tests.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Write executes before approval | Interrupt placed after the tool call in the node | The interrupt must be the node's first action; test asserts zero writes while paused |
| Rejected task loops back to the gate | Agent retries the same write after rejection | Rejection marks the action `denied` in state; the routing function treats denied as terminal for that action |

## Independent verification (checkpoint)
Unapproved writes execute 0 times across staged tests; approve executes exactly once; reject and expiry paths both terminate cleanly; audit trail queryable.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the gate's state machine (states + transitions) from memory.
2. Prediction: the human approves while a *duplicate* resume request is in flight. What does the idempotency key prevent, exactly?
3. Teach-back: which of today's four controls is architecture, and which is merely a classifier-style filter? (Month 4 preview — connect to the lethal trifecta.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
