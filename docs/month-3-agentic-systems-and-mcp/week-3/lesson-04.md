# The agent UI — streaming traces and approval gates in TypeScript

**Week 3 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Extend the Month 1 UI into an agent console: streaming trace view (steps, tool calls, budgets), the approval-gate inbox (approve/reject), and per-task cost — verified by driving a gated task from the UI end to end.

## Why this exists
Your frontend depth is an unfair advantage in this market — agent UIs (trace viewers, approval flows) are what FDE demos and platform teams actually show. This lesson converts backend capability into visible product.

## Prerequisites
Week 1 gate + Week 2 server live; Month 1 Next.js UI as the base.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 3, Lesson 3 (Model routing — cost/latency tiers inside the agent)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 2 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 3, Lesson 3 (Model routing — cost/latency tiers inside the agent)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
UI contract: the trace view renders the same events the backend logs (one event model, two consumers — no UI-only state); the approval inbox lists pending actions with tool, args, and requester context, and its decisions call the resume endpoint from Week 1 Lesson 4; streaming uses the framework's event stream or SSE from the API (**UNVERIFIED:** the exact streaming surface for your pinned LangGraph version — official docs govern; the UI consumes whatever the API emits, so pin the *event schema* in the repo and treat it as the contract).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Event schema first
Define the UI-facing event schema (step, tool_call, tool_result, budget, compaction, gate_requested, gate_decided, final) in the repo; backend emits it.

**Expected output:** Schema committed; a curl/SSE capture shows all event types from a staged gated task.

### Step 2 — Trace view
Streaming step list with per-step tokens/cost and expandable tool args/results.

**Expected output:** A live task renders incrementally (not after completion); costs match the trace footer.

### Step 3 — Approval inbox
Pending gates list; approve/reject buttons resume the thread; decided gates move to a history list.

**Expected output:** A staged write task is approved from the UI and executes once; a second is rejected and terminates cleanly — both visible in history.

### Step 4 — Empty/error states
No-pending-gates state, agent-down state, and a budget-stopped task rendering (partial + note, per Month 2 semantics).

**Expected output:** All three states demonstrated (budget stop via the Month 2 runaway task).

## Independent verification (checkpoint)
A gated task is driven UI-only from question to approved write; trace costs in the UI match the backend's accounting.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the event schema's types and which backend mechanism emits each.
2. Prediction: two gates pend for the same thread (parallel branches). What must the inbox show to keep the human's decision unambiguous?
3. Transfer: this UI is Month 5's demo surface. Which single view would a 'customer' (FDE scenario) ask for first that you haven't built? Note it in the backlog.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
