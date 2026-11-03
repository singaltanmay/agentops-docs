# Cost/latency routing across the whole system + SLOs

**Week 4 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Set system-level service objectives for the Workbench (task success, p95 latency per path, cost per success per path) and wire a weekly report that computes them from Postgres + traces — verified by the first weekly report generating with real numbers for all three paths (RAG / agent / MCP-tool).

## Why this exists
Platforms run on SLOs, not dashboards. This lesson converts three months of scattered measurements into the standing weekly instrument Month 4's gates and Month 5's deployment report will reuse.

## Prerequisites
Lesson 1 tracing live; eval runs + app state in Postgres.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 4, Lesson 1 (Online traces — per-step tracing with cost per outcome)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 4, Lesson 1 (Online traces — per-step tracing with cost per outcome)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
SLO choices are design decisions: set them from your measured distributions (e.g. p95 ≈ 1.5× current p50), not aspirations. The weekly report is a script + committed artefact — the same shape as the Month 1 cost review, now covering quality and latency too.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define the SLO table
Per path: success definition, latency p95 target, cost-per-success target — each with its data source named.

**Expected output:** SLO table committed; every target traces to a query, not a hope.

### Step 2 — Build the weekly report script
One command emits the report (markdown): SLO table with actuals, run inventory, top failure categories, spend vs month column.

**Expected output:** Report generates for the current week with real numbers in every cell (or an explicit 'no traffic' marker).

### Step 3 — Backfill last week's shape
Run the report against Month 3's earlier runs to confirm it reads history, not just today.

**Expected output:** Historical week renders; numbers match the tagged runs' known values.

### Step 4 — Adopt it
Add 'run the weekly report' to the standing weekly review (with the cost check). Note it in PROGRESS.md's routine section or the project README.

**Expected output:** Routine updated in writing — Month 4 inherits a running instrument, not a plan.

## Independent verification (checkpoint)
The weekly report runs on real data for all three paths; SLOs are set from measured distributions; the routine is written down.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state your three paths' cost-per-success SLOs and their data sources.
2. Prediction: which SLO will Month 4's security hardening threaten first — latency or cost? Name the mechanism.
3. Teach-back: SLO vs eval score — why does the system need both, and which one pages you? (Metaphorically: which one ends a demo?)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
