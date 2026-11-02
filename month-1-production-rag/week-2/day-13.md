# Day 13 — Embeddings A/B + the chunking decision

**Week 2 · Apply · 75 min** · Month 1 — Production RAG

## Objective
Compare text-embedding-3-small vs 3-large on the winning chunk config and publish the Week 2 decision record — verified by a decision page citing Recall numbers for both models and a final config the repo now treats as default.

## Why this exists
3-large costs ~6.5× 3-small per token ($0.143 vs $0.022 per 1M). At corpus scale both are cents — so this experiment is really about whether the quality delta is real on *your* questions. Decisions like this, made from a table, are the difference between an AI engineer and a tutorial follower.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 12):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 10):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 6):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 12's independent verification ("Rest / review — Week 2 mixed check so far") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Completion → independent:** the harness from Day 9 is now yours unaided — one variable changes (embedding model), everything else frozen. New idea, taught directly: a decision record (context → options → numbers → decision → flip condition) as a permanent repo artefact. You'll write three more this month.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Index the winning config with 3-large
Same chunks, same questions, same scorer. Log wall-time + spend beside 3-small's.

**Expected output:** Second results row exists, produced by the identical script with one parameter changed.

### Step 2 — Compare like an engineer
Recall@5/@10 deltas per category, not just the headline. Where does large actually win — YAML? troubleshooting? nowhere?

**Expected output:** Per-category delta table in the experiment file. A tie is a result: it means ship small and pocket the simplicity.

### Step 3 — Write the decision record
`docs/decisions/001-chunking-and-embeddings.md`: winning chunk config + embedding model + the numbers + the flip condition (e.g. 'revisit if golden-set context recall < X in Week 4').

**Expected output:** Decision committed; `ingestion/` defaults now encode it (config file, not hard-coded in three places).

### Step 4 — Freeze probe-v1
Tag the probe set + scorer in git (`probe-v1`). It becomes a regression check you re-run after any ingestion change.

**Expected output:** Tag exists; re-running the tag's scorer reproduces today's table.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| 3-large 'wins' by noise (±1 question) | 30 questions can't resolve tiny deltas — a statistics limit, not a bug | Say so in the decision record and choose on cost/simplicity; fixed when the record states the resolution limit honestly |
| Category deltas contradict the headline | Aggregation hiding the story (Simpson's-paradox-lite) | Decide per the categories Week 3 cares about (how-to + YAML); note the tension explicitly |
| Defaults updated in code but not in the platform skillset | Two ingestion paths drifting apart | Apply the same config to the Day 11 path or mark it stale in its README; fixed when both paths state the same defaults |

## Independent verification (checkpoint)
The decision record's numbers trace to the committed experiment file (any reader can recompute them), and a fresh index built from repo defaults reproduces the winning row's Recall within noise.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Transfer: your corpus doubles with API reference docs next month. Which parts of today's decision survive, which get re-run, and why?
2. Generative recall: both embedding prices and the dimension you actually index at.
3. Debugging: a config wins Recall@10 but loses Recall@5. For a top-k=5 product, which result governs? Defend in 2 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: Week 2 gate — full reindex from scratch, timed and costed, against the Week 2 definition of done.
