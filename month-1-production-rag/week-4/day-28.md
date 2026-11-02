# Day 28 — The first Ragas report — winner vs ablation

**Week 4 · Apply · 75 min** · Month 1 — Production RAG

## Objective
Produce the Ragas report: per-metric scores for the winning config and the vector-only ablation over the tuning split, with per-question failure CSV, eval cost, and wall-time — verified by the report's numbers regenerating from the committed run artefacts.

## Why this exists
This is Month 1's thesis, measured: what did hybrid retrieval + semantic ranking actually buy over plain vector search, on questions you wrote, judged by a model you calibrated yesterday, with citations checked? Whatever the answer is — including 'less than expected' — it is the most valuable paragraph you'll write this month, because Month 2–3 decisions inherit it.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 27):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 25):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 21):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 27's independent verification ("Ragas wiring — 20 rows before 160") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Apply, independent:** the harness is yours; today is experimental hygiene. One variable between runs (retrieval mode), everything else frozen — same golden rows, same judge, same prompts. Report the held-out 30 separately, for the record, untouched by any decision you take from today's numbers.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Run A: winning config, tuning split (130)
Scripted end-to-end: /ask (hybrid + ranker) → dataset → Ragas. Artefacts saved under `evals/runs/` with config + git SHA in the run manifest.

**Expected output:** Run A completes; per-metric aggregates + per-question CSV committed.

### Step 2 — Run B: vector-only ablation
Same script, retrieval mode flag flipped — nothing else. If flipping requires code edits beyond a flag, that's a design finding; note it and proceed carefully.

**Expected output:** Run B completes with an identical manifest except the mode.

### Step 3 — Run C: held-out 30, winning config (report-only)
For the record. No decision may cite Run C's per-question detail — aggregates only, by the Day 25 rule.

**Expected output:** Run C aggregates in the report, clearly fenced as held-out.

### Step 4 — Draft the report skeleton
Tables first (per-metric A vs B, per-category cuts), then the delta paragraph: what hybrid+ranker bought, per metric, in plain numbers. Conclusions wait for tomorrow's failure analysis.

**Expected output:** Report draft committed with tables + deltas; the 'why' section explicitly marked pending Day 29.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| A and B deltas within judge noise | Real possibility — and a result, if you can bound the noise | Use yesterday's judge-agreement data to state the noise floor; fixed when the report claims only deltas that exceed it (or honestly claims none do) |
| A run partially fails (judge timeouts on some rows) | Partial data silently averaged — the classic eval-report lie | Report n per metric alongside every score; re-run failed rows or disclose them; fixed when every aggregate carries its n |
| Held-out aggregates look better than tuning | Small-n variance (30 rows) — not a paradox | State the confidence reality in the report; no action taken from it, by rule |

## Independent verification (checkpoint)
A fresh clone of the run artefacts regenerates the report's tables (script it or it isn't verified). Every aggregate shows its n. Every number traces to a CSV row.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Grade your sealed Day 27 predictions + Day 22/24 predictions against the tables. Log calibration, not just correctness.
2. Transfer: which single metric would you put on a Month 3 CI gate, and what threshold behaviour (block vs warn) — and why that one?
3. Teach-back: explain the ablation's logic to an imaginary sceptic: 'why not just report Run A?'

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: failure analysis — read every failing trace, build the taxonomy. Hamel's method, your data. No new runs until the taxonomy exists.
