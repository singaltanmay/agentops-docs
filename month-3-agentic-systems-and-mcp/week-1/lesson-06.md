# Deep build — migration review: graph agent on the full benchmark

**Week 1 · Deep build · ~3 hrs** · Month 3 — Agentic Systems + MCP

## Objective
Run the full 50-task agent eval against the LangGraph build and compare with `pre-langgraph-baseline` — success, steps, cost per success, budget stops, failure taxonomy deltas — and write the migration verdict.

## Why this exists
The port's report card. Framework migrations in real teams are justified exactly this way: same tasks, same scorer, honest deltas — including where the framework made things *worse*.

## Prerequisites
Week 1 lessons complete; agent eval harness (Month 2 Week 4) ready.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 5 (Consolidation — migration mixed gate + durability drills)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 5 (Consolidation — migration mixed gate + durability drills)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Comparison discipline: identical task set + scorer version; the only changed variable is the runtime. Where the framework changed behaviour (e.g. state handling), the taxonomy delta table is the interesting output — raw success % alone hides it.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full eval run
50 tasks through the graph build with budgets + gate live (write tasks auto-rejected in eval mode — record that policy).

**Expected output:** Run committed to Postgres, tagged `langgraph-v1`.

### Step 2 — Delta analysis
Build the comparison vs `pre-langgraph-baseline`: headline metrics + per-category + taxonomy shifts.

**Expected output:** Delta table in the migration report; top regression and top improvement each named with a trace example.

### Step 3 — Fix or file the top regression
If the top regression is a port bug, fix and re-run the 10-task subset; if it's a framework behaviour, file it with the workaround or acceptance rationale.

**Expected output:** Either a fix + green subset, or a filed issue with rationale — never an unexamined delta.

### Step 4 — Migration verdict
One page: keep the graph build (expected), what it cost, what it bought (durability, gate, structure), what's still raw (nothing served should be).

**Expected output:** Verdict committed; Month 3 Week 2 (MCP) prereqs confirmed.

## Independent verification (checkpoint)
The `langgraph-v1` run and its delta analysis exist; the verdict cites run IDs; no regression is left unnamed.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Why migrate to LangGraph — and what did it cost you?' — 4 sentences with two numbers.
2. Transfer: a teammate proposes skipping the raw-loop phase for the next agent and starting in the framework. Using this month's evidence, argue what they'd lose.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
