# LangGraph rebuild I — the raw loop as a state graph

**Week 1 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Re-express the Month 2 raw loop as a LangGraph state graph (state schema from the Month 2 design note; nodes for model / tools / router; conditional edges for the loop) — verified by the graph completing the same staged tasks as the raw loop with equivalent traces.

## Why this exists
The framework migration is the Month 3 spine. Doing it as a *port* — same state, same tools, same tasks — is what makes the before/after eval (Week 4) meaningful instead of a rewrite with new bugs.

## Prerequisites
Month 2 complete; `pre-langgraph-baseline` run tagged; state design note (Month 2 Week 2 Lesson 5) at hand. Reading this week: LangChain Academy 'Introduction to LangGraph' (free, official) — work it in parallel with the port, not before it.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Deep Build — Month 2 gate (ablation report + agent v1)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Deep Build — Month 2 gate (ablation report + agent v1)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
LangGraph's model: a **StateGraph** over a typed state object; **nodes** are functions state→state updates; **edges** (incl. conditional edges) route between them; the graph compiles to a runnable. Your raw loop maps 1:1: model call = node, tool execution = node, the loop condition = a conditional edge, budgets = state fields checked by the routing function. **UNVERIFIED:** exact class/method names for your pinned LangGraph version — the official LangGraph docs for the version you install are ground truth; this lesson specifies the architecture, not the API spelling.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Pin and install the framework
Add LangGraph (Python) to the agent service at a pinned version; record the version + the doc pages you used in the migration log.

**Expected output:** Service starts with the framework imported; version + doc references committed to the migration log.

### Step 2 — Define the state schema
Implement the Month 2 design-note state as the graph's state type: messages, route, step count, token spend, tool results, approvals. Fields that were 'survives-crash' get marked for the checkpointer (Lesson 3).

**Expected output:** Schema compiles; a unit check constructs a state object and round-trips it.

### Step 3 — Port nodes + conditional edges
Model node (same prompts/tools as the raw loop), tools node (same executors — reuse, don't rewrite), routing function implementing: tool-call? → tools; budget fired? → finalise; else → finalise.

**Expected output:** Graph compiles and prints its node/edge structure (mermaid or text) matching the raw loop's flow.

### Step 4 — Equivalence run
Run the 10-task subset through the graph; diff behaviour vs the raw loop run (same tasks, same scorer).

**Expected output:** Success within noise of the raw-loop subset; every divergence is either a port bug (fix) or a named framework behaviour (log it).

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Graph 'works' but traces vanished | Framework hides intermediate state by default | Emit the same trace events from nodes explicitly — Month 4 tracing depends on parity with the raw loop's JSONL |
| Port diverges on multi-step tasks only | State update semantics (append vs replace) differ from the raw loop's list handling | Diff state after each node on a failing task; the first divergent field names the bug |

## Independent verification (checkpoint)
10-task equivalence run reviewed divergence-by-divergence; the migration log names the pinned version and every place the graph's behaviour differs from the raw loop's.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: draw the state graph from memory — nodes, edges, and the routing function's three outcomes.
2. Prediction: which raw-loop behaviour is *hardest* to express as graph state, and why? Answer before the equivalence run; check after.
3. Transfer: your budget object from Month 2 — which budget check becomes a routing function, and which stays inside a node? Justify.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
