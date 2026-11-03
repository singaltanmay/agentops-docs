# One eval runner — RAG and agent suites behind a single harness

**Week 1 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Unify the Month 1–3 eval assets (golden RAG set, 50-task agent set, long-task suite) behind one runner with shared run records in Postgres — verified by one command producing a combined run summary across all three suites.

## Why this exists
P3's claim is a *platform*: one way to run, record, and compare every eval the system has. Three harnesses with three formats can't gate CI (Week 3) or feed one judge (Week 2).

## Prerequisites
Month 3 gate passed; taxonomy v2 + top-3 targets committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Deep Build — Month 3 gate):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Deep Build — Month 3 gate) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Unification contract: every suite emits the same run envelope (suite, config hash, git commit, scorer versions, per-item rows with item ID, outcome, scores, cost, trace ID). Suite-specific scorers stay suite-specific — the envelope is what's shared. Held-out discipline carries over unchanged: the runner refuses held-out items without the explicit flag + warning.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define the run envelope
Schema doc + Postgres alignment: the existing `eval_runs`/`eval_results` gain suite + trace-ID columns via migration.

**Expected output:** Migration applies; a Month 3 historical run still queries correctly.

### Step 2 — Port the three suites
Golden RAG, agent-50, long-tasks each runnable via `python -m evals.run --suite <name>` (adapt names to your repo — the one-command shape is the spec).

**Expected output:** Three commands, three run rows, one envelope shape (diff the row schemas).

### Step 3 — Combined summary view
Saved view: latest run per suite with headline metrics side by side.

**Expected output:** View returns 3 rows with current numbers; spot-check one against its tagged run.

### Step 4 — Regression smoke set
Define the 15-minute smoke subset (10 RAG + 10 agent + 2 long) used by CI in Week 3.

**Expected output:** Smoke run completes inside 15 min wall-clock; its cost is recorded.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Historical runs break after the migration | Envelope change altered old columns' meaning | Additive migration only; old runs get `suite` backfilled from their tags, never reinterpreted |
| Smoke set drifts from the full suites | Smoke items edited separately | Smoke = a stored ID list *into* the frozen suites, never copies |

## Independent verification (checkpoint)
One runner, three suites, one envelope; the smoke subset exists with a measured wall-time and cost.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the run envelope's fields and the one discipline (held-out) the runner enforces mechanically.
2. Prediction: Week 3's CI gate needs a pass/fail per suite. Which envelope field makes 'compared to which baseline?' answerable?
3. Transfer: Month 5's customer domain adds a fourth suite. What do you write, and what do you refuse to rewrite?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
