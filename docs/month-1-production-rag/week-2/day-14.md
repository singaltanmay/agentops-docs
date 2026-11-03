# Day 14 — Week 2 gate — one-command reindex, reconciled

**Week 2 · Gate · 75 min** · Month 1 — Production RAG

## Objective
Re-index the full scoped corpus from scratch with one command in < 30 min for < $1 of embedding spend, with index counts matching pipeline counts — verified by the timed run log and the reconciliation printed in it.

## Why this exists
The gate re-proves Week 2 the way Day 7 re-proved Week 1: from nothing, by script, against numbers written in advance. An ingestion pipeline you cannot rebuild is a demo; one you can rebuild on a timer is infrastructure.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 13):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 11):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 7):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 13's independent verification ("Embeddings A/B + the chunking decision") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
Assessment day — guide closed during the run. The one new idea is operational: a reindex runbook (preconditions → run → reconcile → smoke-test) that Month 2's agent work will reuse when the corpus changes under it.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Precondition check
Winning config + model = repo defaults (Day 13). Probe set tagged. Cost so far this week noted. Delete the index (keep the definition in code).

**Expected output:** Index gone; everything needed to rebuild it is in the repo — if anything lives only in your shell history, stop and commit it first.

### Step 2 — Timed reindex
One command. Start a timer. No mid-run fixes — note issues, let it finish or fail.

**Expected output:** Run log: wall-time, embedding spend, chunk count. Targets: < 30 min, < $1.

### Step 3 — Reconcile + regression
Index count vs chunker count (exact). Re-run probe scorer: Recall matches Day 13 within noise. Re-run Day 5 completion + Day 9 smoke tests.

**Expected output:** All green in one log page. Any mismatch is classified (pipeline bug / index behaviour / scorer) before the day ends.

### Step 4 — Gate review
Week 2 exit items scored; KC-05/06/07 states updated; Week 3 scaffold levels noted from Day 12's diagnostic. 3-line log.

**Expected output:** Gate review committed. Week 3 starts from this page, not from memory.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Reindex exceeds 30 min | Serial embedding calls / no batching | Batch embedding requests + bounded parallelism within TPM quota; fixed when a re-run lands inside target (re-running the gate after a fix is allowed and logged) |
| Counts off by a handful | The classic: a few oversized documents rejected by the index | Find them by ID, name the cause (size limit), chunk the outliers finer; fixed at exact reconciliation |
| Recall shifted vs Day 13 on identical inputs | Index/HNSW approximate behaviour or a silent config drift | Diff the index definition against the repo copy; fixed when the drift (or the approximation note) is identified in writing |

## Independent verification (checkpoint)
The run log itself: one command, timer, spend, exact reconciliation, regression table. A second person could audit Week 2 from this log alone — that's the standard.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Mixed gate (Weeks 1–2, closed-book, 8 items): budget alerts · RBAC triple · schema fields · four configs · Recall definition · contamination control · decision-record flip condition · reindex targets.
2. Teach-back: why does the gate delete the index first? What class of bug does a rebuild expose that an incremental update hides?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Week 3 tomorrow: the retrieval shootout. Required reading first (20 min tonight or first thing): Pamela Fox's Reactor session 'Building RAG apps in Python' — link in the Resources panel.
