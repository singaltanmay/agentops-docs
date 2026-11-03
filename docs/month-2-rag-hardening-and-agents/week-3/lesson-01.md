# The raw agent loop — ReAct without a framework

**Week 3 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Build a working agent loop by hand on the Azure OpenAI function-calling surface: model → tool call → observation → repeat → stop — verified by the loop completing a 2-step task (retrieve, then answer with citations) with a full trace printed.

## Why this exists
Frameworks come in Month 3. First you own the loop itself — postings test the loop, not framework recall, and every LangGraph concept maps to something you will have already written by hand.

## Prerequisites
Month 2 Weeks 1–2 done; cited-answer API live. Reading: Anthropic, 'Building Effective Agents' (workflow-vs-agent taxonomy) before this lesson.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 6 (Deep build — pgvector vs AI Search head-to-head + verdict)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 4):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 6 (Deep build — pgvector vs AI Search head-to-head + verdict)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
The Responses/Chat function-calling cycle: you send messages + tool schemas; the model returns a tool call; *your code* executes it and returns the result; repeat until the model answers or a stop condition fires. Non-obvious platform fact from the official how-to: Azure OpenAI does not support parallel function calls with structured outputs (`parallel_tool_calls=false`) — design for sequential calls where structured output is required. ReAct = interleaving a short reasoning trace with actions; the trace is for the log, the actions are what matter.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define one tool: search
Tool schema for the existing retrieval API: `{query, top_k}` → returns chunk texts + IDs. Implement the executor as a thin call to your own `/ask`-retrieval layer, not a reimplementation.

**Expected output:** A manual executor call with a sample query returns chunks in the schema's shape.

### Step 2 — Write the loop
Python loop: build messages → call model with tools → if tool call, execute + append result → repeat; hard cap 6 steps (Lesson 3 makes this a real budget system; today the cap is a constant).

**Expected output:** Loop runs end-to-end on 'What is a Pod in Kubernetes?' — retrieval fires, final answer cites a chunk ID.

### Step 3 — Print the full trace
Every iteration logs: step no., model decision (tool call name + args, or final), observation size, tokens. Trace to stdout + a JSONL file.

**Expected output:** Trace file shows ≥2 steps for the sample task; token counts present per step.

### Step 4 — Break it once, deliberately
Ask a question requiring two retrievals (e.g. compare two resources). Watch the loop's behaviour; note one weakness in the log (repetition, premature answer, wrong query).

**Expected output:** Weakness named in the lesson log — Week 3's later lessons exist to fix exactly these.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Model answers without calling the tool | Tool description too weak or system prompt invites answering from memory | Tighten the tool description ('use for any question about the corpus') + system prompt rule: corpus questions require a search call first |
| Infinite / repetitive loop | No cap or identical re-queries | The step cap fires (that's its job); log the repeated args — deduplication is a Lesson 3 fix |

## Independent verification (checkpoint)
A 2-step task completes with citations; the JSONL trace shows each model decision and token count; one named loop weakness is in the log.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the loop's pseudocode from memory, including where *your code* (not the model) makes decisions.
2. Prediction: the model returns a tool call with a malformed `query` (empty string). What does your loop do today, line by line?
3. Teach-back: workflow vs agent — which is today's build, and what single change would make it a workflow?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
