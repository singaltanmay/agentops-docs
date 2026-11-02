# Routing — classify first, then commit to a path

**Week 4 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Add a routing stage: a cheap classifier sends each request to single-call RAG, the agent loop, or a refusal/clarify path — verified by a staged request set hitting the intended path ≥90% of the time with per-path cost logged.

## Why this exists
Routing is the first Anthropic workflow pattern and the cheapest cost control there is: most questions never needed an agent. It also gives Month 4 a per-path quality/cost breakdown to optimise.

## Prerequisites
Week 3 benchmark results in; taxonomy v1 committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 3, Lesson 6 (Deep build — the 50-task multi-step benchmark: agent vs RAG baseline)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 3, Lesson 4):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 3, Lesson 6 (Deep build — the 50-task multi-step benchmark: agent vs RAG baseline)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Router design: a small-model classification call with a strict label set (`rag | agent | refuse`) + a confidence field, using structured outputs. Route on *task shape* (multi-step? needs tools? in-corpus?), not on topic keywords. Log every routing decision with the request — routing errors become a measurable class in the taxonomy.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define the label set + decision rules
Write the routing rubric: what makes a request `agent` (≥2 dependent steps, non-search tool needed), `rag` (single lookup), `refuse` (out-of-corpus / policy).

**Expected output:** Rubric committed with 2 example requests per label.

### Step 2 — Implement the router
One `gpt-4o-mini` structured-output call ahead of both paths; decision + confidence appended to the trace and to Postgres.

**Expected output:** Router live behind a flag; trace shows `route=...` before any tool activity.

### Step 3 — Stage the routing test set
30 requests (10 per intended label, drawn from golden + agent-tasks + adversarial sets).

**Expected output:** Router accuracy ≥90% on the staged set; every miss is taxonomy-coded (new category: `routing error`).

### Step 4 — Measure the saving
Compare cost/latency of routed traffic vs agent-for-everything on the staged set.

**Expected output:** Saving quantified in the write-up line: routed median cost vs agent-only median cost.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Router sends multi-hop questions to RAG | Rubric keys on surface simplicity ('what is…') | Add the dependency test to the rubric: 'does answering require the result of a first lookup?' — re-stage |
| Router call costs more than it saves | Trivial questions dominate and RAG path ≈ router+RAG anyway | Add a zero-cost pre-filter for obvious cases (e.g. exact-match FAQ shapes) and measure again |

## Independent verification (checkpoint)
Staged accuracy ≥90% with misses coded; routed-vs-agent-only cost comparison recorded; routing decisions queryable in Postgres.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the routing rubric's three decision tests from memory.
2. Prediction: a request is ambiguous between `rag` and `agent`. Which way should the router err at this stage of the project, and why? Defend with cost + quality terms.
3. Transfer: Month 3 adds an MCP 'eval' tool. Does the label set change? Argue both ways in 2 sentences each.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
