# Adoption + outcome measurement — did it work for the customer?

**Week 2 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Measure the deployment against the brief's success criteria (task outcomes from usage rounds, eval scores in-domain, cost per successful outcome) and draft the outcome section of the deployment report.

## Why this exists
Deployment success is the customer's outcomes, not your metrics — but your metrics are how you *know*. This lesson forces the join: every brief criterion gets its measured value or an explicit 'unmeasurable, because…' with the fix.

## Prerequisites
Lessons 1–3 done; two usage rounds of evidence available (Week 1 walkthrough + Week 2 sessions).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 3 (Customer-domain tuning — close the measured gaps)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 3 (Customer-domain tuning — close the measured gaps)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Outcome accounting: brief criteria table → measured value → instrument → verdict (met / missed / unmeasurable). Cost per successful outcome uses the Month 3 definition on customer traffic. Missed criteria get a cause from the taxonomy, not an excuse; unmeasurable criteria get an instrumentation fix item (they are Month 5 Week 4 hardening candidates).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Build the criteria table
Every brief success criterion listed with its instrument + query/run IDs.

**Expected output:** Table complete; no criterion lacks an instrument or an 'unmeasurable' flag.

### Step 2 — Compute + verdict
Fill measured values; verdict each criterion.

**Expected output:** Verdicts recorded; misses carry taxonomy causes.

### Step 3 — Cost-per-outcome for the deployment
Customer-env spend to date ÷ successful outcomes (define 'successful' from the criteria, mechanically).

**Expected output:** Figure computed with its definition stated; projected monthly version included.

### Step 4 — Draft the outcome section
Deployment report gains the outcome section: criteria table + narrative of the top win and the top miss.

**Expected output:** Draft committed; narrative cites the table, not adjectives.

## Independent verification (checkpoint)
The brief's criteria are all verdicted from instruments; cost per successful outcome is computed with a stated definition.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the brief's criteria with verdicts from memory (approximately) — then check.
2. Prediction: which criterion will a hiring manager probe hardest in an interview, and what's your honest answer?
3. Teach-back: 'Did the deployment succeed?' — the FDE answer: criteria, numbers, one miss with its cause.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
