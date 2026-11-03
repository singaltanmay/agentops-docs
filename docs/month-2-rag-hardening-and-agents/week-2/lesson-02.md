# App-state schema — users, conversations, feedback labels

**Week 2 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Design and migrate the app-state schema (users, conversations, messages, feedback labels) in Postgres, and switch the API's feedback-label writes from Blob/JSONL to Postgres — verified by a label placed in the UI appearing as a row.

## Why this exists
Month 1's feedback button wrote JSONL because Postgres didn't exist yet. Feedback labels are future eval data; they belong in a queryable store before the agent (Week 3) starts generating far more of them.

## Prerequisites
Lesson 1 server live; Month 1 UI feedback flow working against JSONL.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 1 (Postgres joins — provision B1ms in IaC with stop/start discipline)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 5):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 1 (Postgres joins — provision B1ms in IaC with stop/start discipline)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Schema discipline: surrogate keys, `created_at` everywhere, foreign keys on, and feedback as its own table (label, question id, answer snapshot, chunk IDs cited) — the answer *snapshot* matters because answers change when the pipeline changes; a label against a vanished answer is worthless.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the migration
SQL migration file in the repo (`infra/migrations/0001_app_state.sql` or your migration tool's equivalent): `users`, `conversations`, `messages`, `feedback_labels` with the snapshot columns above.

**Expected output:** Migration applies cleanly to a fresh database (drop + re-apply once to prove it).

### Step 2 — Switch the write path
API feedback endpoint writes to Postgres via a connection string pulled from Key Vault/app settings; JSONL path deleted, not dual-written.

**Expected output:** UI label → row visible via `psql` within seconds; `git grep` shows no JSONL feedback code left.

### Step 3 — Backfill the Month 1 labels
One-off script imports the existing JSONL labels with their snapshots.

**Expected output:** Row counts match the JSONL line count; spot-check 3 rows against the file.

### Step 4 — Add the read query you'll actually use
A saved query/view: labels per week by type (wrong-answer / wrong-citation / other).

**Expected output:** Query returns the Month 1 counts; this exact view is named in the eval lessons that consume it.

## Independent verification (checkpoint)
Fresh-database migration applies; a live UI label lands as a row; backfill counts reconcile; the labels-per-week view returns correct Month 1 numbers.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: sketch the four tables and their relationships from memory.
2. Planted-bug: a schema stores feedback with only `answer_id` pointing at a mutable answers table. Plant the failure scenario: what breaks in Month 4's failure analysis?
3. Prediction: why snapshot the answer text instead of recomputing it later from the pipeline?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
