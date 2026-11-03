# Eval design from the taxonomy — per-category eval specs

**Week 1 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Write an eval spec for each top taxonomy category: the item source, the decider (mechanical/judge), the pass bar, and the regression alarm — verified by each spec being runnable or judge-ready (Week 2) with no undefined terms.

## Why this exists
A taxonomy says what breaks. Eval specs say how you'll *know* it broke again, forever, in CI. This translation step is where most teams' eval efforts quietly die — specs stay vague and nothing ever gates.

## Prerequisites
Lesson 3 taxonomy v3 + judge target list.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 3 (Failure-analysis sprint — 100 traces, read by you)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 3 (Failure-analysis sprint — 100 traces, read by you)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Spec template (per category): `items` (existing suite slice or new items — how many, from where), `decider` (check name or judge rubric ID), `metric` (rate/score), `bar` (current measured level → gate level), `alarm` (what a regression looks like in the weekly report). Bars start at measured reality (Lesson: SLO discipline from Month 3) and tighten deliberately, never aspirationally on day one.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Draft specs for the top 5 categories
One spec per category using the template; item sources reference real suite IDs/slices.

**Expected output:** 5 specs committed; no spec references an item set that doesn't exist.

### Step 2 — Build any missing item slices
Where a category lacks items (expect 1–2 gaps), author items from real traces (anonymised shapes from the reading log) and add them to the relevant suite as a named slice.

**Expected output:** New slices exist in the suites, tagged with their taxonomy category; counts match the specs.

### Step 3 — Wire spec metrics into the runner
Each spec's metric computes from a normal run (no special tooling).

**Expected output:** A full run emits all 5 category metrics into the run summary.

### Step 4 — Set bars + alarms
Bars = current levels (from the run just made); alarms = drop > noise floor (measure the floor by repeating one suite).

**Expected output:** Bars + the measured noise floor recorded in the specs.

## Independent verification (checkpoint)
Five runnable eval specs with real item slices, computed metrics, measured bars, and a quantified noise floor.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the spec template's six fields and why 'bar' starts at measured reality.
2. Prediction: a category's metric improves 10 points after a prompt change, but its slice is 12 items. Alarm or celebration? Use the noise floor.
3. Transfer: which Month 1 category (retrieval miss etc.) maps onto which v3 category — and which v3 categories have no Month 1 ancestor?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
