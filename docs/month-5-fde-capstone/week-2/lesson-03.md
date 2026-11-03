# Customer-domain tuning — close the measured gaps

**Week 2 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Tune the customer deployment against its golden set (retrieval config, routing thresholds, prompt deltas — one variable at a time through the harness) and publish the before/after customer metrics.

## Why this exists
Tuning is Month 2's ablation discipline wearing a customer hat: same harness, same one-variable rule, same honest reporting — now with an audience that will quote your numbers back to you.

## Prerequisites
Lessons 1–2 done; customer baseline (Week 1) + field findings available.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 2 (The requirement change — absorb it like an FDE)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 2 (The requirement change — absorb it like an FDE)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Candidate levers, in order of expected value from the field findings: chunking deltas for the customer's doc shapes, audience-aware routing tweaks, refusal thresholds on the adversarial slice, judge spot-check follow-ups. Each lever: hypothesis from a counted failure category, subset test, full customer-suite confirmation, stakeholder translation.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Pick the top 2 levers from evidence
Levers chosen from counted failure categories (field + golden), hypotheses written before touching config.

**Expected output:** Hypotheses committed with their target metrics.

### Step 2 — Subset-test both
Harness runs on the customer tuning split (held-out customer slice untouched).

**Expected output:** Two subset results recorded; losers dropped without ceremony.

### Step 3 — Confirm winners on the full suite
Full customer-suite run per winner; compare vs Week 1 baseline.

**Expected output:** Before/after table complete with run IDs.

### Step 4 — Translate for the stakeholder
Log entry: what improved, in task terms ('troubleshooting answers now cite the right runbook section'), with the metric in parentheses.

**Expected output:** Entry written; no naked metrics, no overclaiming (deltas stated with the noise floor).

## Independent verification (checkpoint)
Customer metrics moved (or honestly didn't) with run-ID-backed before/after and a stakeholder translation that respects the noise floor.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state your two levers, their hypotheses, and their verdicts.
2. Planted-bug: a tuning change lifts the tuning split +6 but the field sessions feel worse. Name two mechanisms and the instrument that arbitrates.
3. Transfer: which tuning, if any, generalises back to the main Workbench config? Argue via the failure categories, not the scores.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
