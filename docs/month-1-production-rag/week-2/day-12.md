# Day 12 — Rest / review — Week 2 mixed check so far

**Week 2 · Review · 60–90 min** · Month 1 — Production RAG

## Objective
Run a mixed retrieval check across Weeks 1–2 and update every KC state honestly — verified by the check's score sheet existing with KC-01…KC-07 marked learning/fragile/mastered from evidence.

## Why this exists
Spacing requires gaps; a month of daily work on top of a full-time job fails on fatigue before it fails on content. Today is deliberately light: consolidation is a learning activity (the Friday-gate logic), not a day off from the system.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 11):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 9):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 5):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 11's independent verification ("Ingestion II — integrated vectorization, head-to-head") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new concept — by design (one interactivity spike per day, and today the spike is zero). If the mixed check exposes a fragile prerequisite for Week 3 (KC-06 especially), the repair happens here, in miniature, not mid-Week-3.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Mixed check (closed-book, ~20 min)
8 items interleaved: 2 infra (budget caps, RBAC shape), 2 corpus/chunking (configs, schema fields), 2 retrieval (Recall definition, contamination), 2 predictions on unseen mini-cases. Confidence-tag each.

**Expected output:** Score sheet with confidences recorded. Misses classified: slip vs misconception vs never-learned.

### Step 2 — Re-run two old checkpoints
Day 5's keyless completion curl + Day 10's scorer on the winning config. Both should still pass — environments and indexes rot quietly.

**Expected output:** Both pass, or the breakage is diagnosed today while it's cheap.

### Step 3 — Pay one debt
Your log has at least one deferred item by now (a warning class, a README gap, a flaky script). Clear exactly one, fully.

**Expected output:** Debt item closed in the log with its fix commit.

### Step 4 — Preview Week 3 diagnostically
3 questions on next week's prerequisites (what is BM25 good at? what does a reranker see that a retriever doesn't? what is RRF?). Attempt closed-book; misses are fine — they set the scaffold level for Days 15–16.

**Expected output:** Diagnostic answers recorded, right or wrong. Wrong answers here are free; the same ones next week are expensive.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Mixed check broadly weak on Week 1 material | Spacing gap — normal, and exactly what the check is for | Schedule the missed KCs into Days 13–14 warm-ups explicitly; do not re-study whole days |
| An old checkpoint fails | Environment rot (identity, tier change side-effect) | Repair to green today; a red checkpoint carried into Week 3 invalidates its comparisons |
| Temptation to start Week 3 early | Rest-day violation disguised as ambition | Close the laptop after the debt item. Tomorrow's you is the beneficiary. |

## Independent verification (checkpoint)
Score sheet + two green checkpoints + one closed debt, all logged. That's the whole day — completeness here is measured by the log, not by code volume.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (the week's hardest): explain to an imaginary junior why chunking is judged on Recall@k rather than on answer quality at this stage.
2. Calibration review: look at your three confidence-vs-outcome logs so far. Are you systematically over or under? State the direction in one sentence — you'll use it when Week 4 asks you to trust your own golden answers.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: embeddings A/B + the formal chunking decision. Bring Day 10's table and Day 11's verdict — the decision cites both.
