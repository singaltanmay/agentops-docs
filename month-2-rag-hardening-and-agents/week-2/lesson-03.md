# Eval results move to Postgres

**Week 2 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Move harness results from CSV-in-Blob to Postgres (`eval_runs`, `eval_results` per-question rows) with the config hash + git commit stored per run — verified by re-running one Week 1 ablation and querying its numbers back out.

## Why this exists
CSV rows were fine for 10 runs. Months 3–4 (judges, CI gates, online evals) need joins: per-question history across runs is how you see *which* questions a change fixed and which it broke.

## Prerequisites
Lesson 2 schema live; Week 1 harness CSVs committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 2 (App-state schema — users, conversations, feedback labels)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 6):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 2 (App-state schema — users, conversations, feedback labels)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Two tables: `eval_runs` (one row per run: config JSON, config hash, git commit, split, judge model, totals, cost) and `eval_results` (one row per question per run: scores, retrieved chunk IDs, latency). CSV import for the historical runs keeps the full history queryable.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Migration 0002: eval tables
Add the two tables with indexes on (run_id), (question_id), (config hash).

**Expected output:** Migration applies to a fresh DB; `\d eval_runs` shows the intended shape.

### Step 2 — Import history
Script loads all committed ablation CSVs as historical runs (judge/commit fields marked `legacy-import` where unknown — never invent values).

**Expected output:** Imported run count = CSV count; totals for the Month 1 baseline run match the Ragas report.

### Step 3 — Switch the harness write path
Harness writes new runs to Postgres (CSV export remains as a derived artefact for git).

**Expected output:** One Week 1 ablation re-run appears in Postgres with config hash + real git commit.

### Step 4 — The money query
Write and save: 'for question Q, show score across the last 5 runs' and 'questions fixed/broken between run A and B'.

**Expected output:** Both queries return sane results on the imported + new data; the fixed/broken diff for A=B is empty.

## Independent verification (checkpoint)
Historical + new runs queryable; baseline totals reconcile with the Month 1 report; fixed/broken diff query demonstrated on two real runs.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the fixed/broken diff in words a SQL author could implement without asking you anything.
2. Prediction: why store the config *hash* when the full config JSON is already stored?
3. Transfer: Month 4's CI gate needs 'did faithfulness drop >2 points vs main?' — which tables/columns answer it?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
