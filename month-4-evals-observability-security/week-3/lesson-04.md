# Observability deepening — dashboards from the span schema

**Week 3 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Build the standing operational views from Month 3's spans: per-path latency/cost/error dashboards (KQL-backed) + failure-category overlay — verified by reproducing one known incident (a budget-stop spike from a staged run) in the views.

## Why this exists
Month 3 built the spans; this lesson makes them a surface an operator (or an interviewer) can read in 60 seconds. Dashboards built from the same schema as the eval data keep ops and evals telling one story.

## Prerequisites
Lessons 1–3 done; span schema live since Month 3.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 3 (Nightly deep eval + drift watch)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 3 (Nightly deep eval + drift watch)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Views (KQL over App Insights/Log Analytics, saved + exported to the repo as queries): (1) path overview — volume, success, p50/p95, cost per success per path; (2) failure lens — spans grouped by taxonomy category; (3) budget/gate lens — budget stops, gate decisions, compaction events over time. **UNVERIFIED:** Azure Workbooks vs Grafana vs portal dashboards for your setup — pick what your workspace supports; the *queries* are the artefact, committed as `.kql` files so the views are reproducible.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the three KQL views
One `.kql` per lens, parameterised by time window; save into the project repo.

**Expected output:** Each query runs and returns rows for the last 7 days.

### Step 2 — Stage the known incident
Run the Month 2 runaway task batch (budget stops) + a gated-write batch.

**Expected output:** Fresh spans exist for both event families.

### Step 3 — Verify the lenses see it
Failure lens shows the budget-stop spike; budget/gate lens shows the gate decisions with timestamps matching the staged runs.

**Expected output:** Both views reproduce the staged incident; a screenshot/export is committed to the ops notes.

### Step 4 — Retention + cap sanity
Re-check the Log Analytics daily cap against the new volume (dashboards don't change ingestion, but the nightly + online evals did).

**Expected output:** Cap still ≥ projected volume or adjusted with the spend note updated.

## Independent verification (checkpoint)
Three committed KQL lenses reproduce a staged incident accurately; the ops surface and the eval surface provably read the same data.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: name the three lenses and the question each answers in one line.
2. Prediction: a latency regression appears in the path overview but evals are green. Which lens do you open second, and what are you hunting?
3. Teach-back: why commit queries as files instead of only building portal dashboards? (Reproducibility — connect to Month 1's IaC rule.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
