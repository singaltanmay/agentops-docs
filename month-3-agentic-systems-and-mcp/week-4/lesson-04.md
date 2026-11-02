# Month 3 integration — the ambient pattern: event-driven trigger

**Week 4 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Add one non-chat entry point: an event (new filtered issue arriving / a schedule) triggers an agent run that triages it through the router and files its report through the approval gate — verified by a staged event producing a gated, traced, completed run with no chat involved.

## Why this exists
Ambient agents (event-driven, not conversational) are the production pattern behind the demos — LangChain's ambient-agents course exists because products are mostly this. One working trigger proves your architecture isn't chat-shaped by accident.

## Prerequisites
All Month 3 systems live. Reading (optional, this week): LangChain Academy 'Ambient Agents with LangGraph' — human-in-the-loop + agent evals for event-driven designs.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 4, Lesson 3 (Failure analysis II — agent traces at volume)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 4, Lesson 3 (Failure analysis II — agent traces at volume)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Trigger discipline: the event creates a *task record* (Postgres) that the agent runtime picks up — events never invoke the model directly, so retries, dedup (event id idempotency), and audit come free from the state layer. The run ends at the approval gate for its external effect (the filed report), exactly like interactive tasks: autonomy in analysis, permission for effects.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Task-record intake
An intake endpoint/job writes task records from a staged event source (a webhook-shaped POST or a polled folder of issue JSON — your choice, recorded).

**Expected output:** A staged event lands as a task record with a unique event ID; replaying the same event creates no duplicate (idempotency check shown).

### Step 2 — Runtime pickup
The agent runtime claims pending tasks, runs them through router → paths, with full tracing under the task's trace ID.

**Expected output:** Staged event's run appears in traces + Postgres with the event ID linked.

### Step 3 — Gated effect
The run's report filing pauses at the approval gate; approve from the Week 3 UI inbox.

**Expected output:** Report files exactly once post-approval; the whole flow had zero chat messages.

### Step 4 — Failure posture
Kill the runtime mid-batch; restart; show pending tasks resume/complete without duplicate effects.

**Expected output:** Restart test passes; task table shows no stuck `running` rows.

## Independent verification (checkpoint)
An event with no human chat produced a complete, gated, traced agent run; replay and restart drills both pass.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the intake contract (event → task record fields) and the two idempotency guarantees.
2. Prediction: the event source fires 200 events in a minute. Which Month 2/3 controls bound the damage, in the order they engage?
3. Transfer: Month 5's customer deployment will have its own event source. What changes at intake, and what must not change?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
