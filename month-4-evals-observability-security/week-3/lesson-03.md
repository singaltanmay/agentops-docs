# Nightly deep eval + drift watch

**Week 3 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Add the nightly job: full suites + held-out spot check (rotating slice, flagged + logged per the standing rules) + trend deltas vs the last 7 nights — delivered as a morning report artefact; verify by running it once on demand.

## Why this exists
The PR gate is shallow by design (8 minutes). Depth lives here: full suites nightly are where slow regressions and judge drift surface while they're still cheap.

## Prerequisites
Lesson 2 gate live.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 2 (The regression gate — thresholds, baselines, and the red-run drill)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 2 (The regression gate — thresholds, baselines, and the red-run drill)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Nightly composition: full golden + agent-50 runs (runner), promptfoo full configs, online-eval trend snapshot, and a **rotating held-out slice** (10 of the 30, rotating — each exposure logged; the slice informs, it never tunes: any change motivated by it must be validated on the tuning split before shipping). Report shape: deltas vs 7-night median, new failure categories, judge-band status, spend.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Compose the nightly job
Scheduled GitHub Actions (or Container Apps Job — record the choice) running the full battery in sequence with per-suite failure isolation.

**Expected output:** On-demand run completes all suites; one suite's failure doesn't skip the rest (demonstrate by the report's completeness).

### Step 2 — Held-out rotation wiring
Rotation state (which slice, when last exposed) stored + logged; report flags held-out results in a separate, fenced section.

**Expected output:** Report shows the fenced section; the exposure log line exists.

### Step 3 — Trend + delta report
Morning report artefact (markdown in the repo or a run summary): the delta table, new categories, band status, spend vs budget line.

**Expected output:** Report generates from tonight's on-demand run with real deltas (vs the Month 3/4 baselines where 7 nights don't exist yet — labelled as such).

### Step 4 — Alert discipline
Define what earns an immediate flag vs the weekly review (gate-band metric below floor 2 nights running; new failure category; spend anomaly).

**Expected output:** Alert rules committed; everything else is report-only — alert fatigue is a design bug.

## Independent verification (checkpoint)
Nightly battery runs on demand with a complete, fenced report; alert rules are written and deliberately narrow.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the nightly's four components and the held-out slice's two rules (fenced, never-tunes).
2. Prediction: the held-out slice drops 8 points while tuning-split metrics are flat. Give the two most likely explanations and the *allowed* next step for each.
3. Transfer: Month 5's customer traffic joins the nightly. What must be added before their data touches this job (privacy, suites, judges)?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
