# Consolidation — agent failure taxonomy v1 + mixed gate

**Week 3 · Review · 60 min (light)** · Month 2 — RAG Hardening + Agents

## Objective
Build agent failure taxonomy v1 from this week's traces and pass the Week 3 mixed gate.

## Why this exists
You now have real agent traces. Coding their failures into a taxonomy (wrong tool / bad args / premature stop / loop / ignored observation / budget stop) is the Hamel method applied to agents — and Month 4's agent evals are built on exactly this table.

## Prerequisites
Lessons 1–4 traces available (keep every JSONL trace — they are data).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 3, Lesson 4 (More tools — calculator/code sandbox and issue lookup, scoped)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 3, Lesson 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 3, Lesson 4 (More tools — calculator/code sandbox and issue lookup, scoped)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Open-coding first (read traces, name what you see), then group. Every category gets: definition, trace signature, one example trace ID, and the layer that owns the fix (prompt / tool contract / loop control / model).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Read every trace from the week
Open-code failures and near-failures in a scratch list — no categories yet.

**Expected output:** Scratch list covers all traces; count of traces read is recorded.

### Step 2 — Group into taxonomy v1
Produce the table (target 6–10 categories) in the project repo under `evals/agent-failure-taxonomy.md`.

**Expected output:** Taxonomy committed; every category has ≥1 real trace ID or is marked `anticipated`.

### Step 3 — Mixed gate (8–10 items)
Closed-book across Weeks 1–3: ablations, Postgres layer, loop mechanics, tool contracts, budgets.

**Expected output:** Score in PROGRESS.md; fragile KCs scheduled for repair.

### Step 4 — Pay down one debt item
Oldest debt item, repaired with evidence.

**Expected output:** Debt log shrinks by one.

## Independent verification (checkpoint)
Taxonomy v1 committed with trace-backed categories; gate recorded; the top agent failure category by count is named — it is Week 4's first fix target.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: given three anonymised trace excerpts, classify each failure and name the owning layer.
2. Teach-back: 'Why build the taxonomy before building more agent features?' — the Month 4 answer, in 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
