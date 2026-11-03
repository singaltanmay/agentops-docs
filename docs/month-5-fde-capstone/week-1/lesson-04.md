# The customer golden set — evals in the customer's domain

**Week 1 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Build the customer-domain golden set (60–100 Q from the customer's corpus + their real questions where available), wire it as the runner's fourth suite, and take the baseline measurements — before any customer-specific tuning.

## Why this exists
Month 4's platform claim gets proven here: a new domain becomes measurable in days because the envelope, scorers, and judges already exist. The baseline-before-tuning order is the Month 1 rule, kept under customer pressure.

## Prerequisites
Lesson 2 corpus live; Lesson 3 access control enforced (golden items carry audience tags).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 3 (Permissions become real — document-level access control)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 3 (Permissions become real — document-level access control)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Set design mirrors Month 1's recipe at customer scale: majority docs-derived, a slice of real-user questions (stakeholder log + issue-style requests), an adversarial/unanswerable slice including cross-audience traps (Lesson 3's battery overlaps deliberately). Judge reuse: the calibrated judges apply, but spot-check 15 customer items by hand — domain shift can break calibration, and the spot check is how you'd know.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Author the set
60–100 items with reference answers, expected chunks, category + audience tags; freeze as `customer-golden-v1`.

**Expected output:** Set validates + freezes; category/audience mix recorded.

### Step 2 — Wire suite #4
Runner gains the customer suite; mechanical scorers (citation, refusal, audience) apply unchanged.

**Expected output:** Baseline run completes via the standard one-command path.

### Step 3 — Baseline + judge spot check
Record baseline metrics; hand-check 15 judge verdicts on customer items against your own reading.

**Expected output:** Baseline tabled; spot-check agreement noted — a big drop vs Month 4 calibration triggers a recalibration item, not silent acceptance.

### Step 4 — Report to the stakeholder log
Translate the baseline into customer language: what the system can/can't do today, in their terms.

**Expected output:** Log entry written; no raw metric names without a one-line gloss.

## Independent verification (checkpoint)
Customer suite is a first-class runner citizen with a frozen v1 set, a baseline, and a judge spot check on the new domain.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the customer set's composition and the two Month 1 rules it inherited.
2. Prediction: which Month 4 judge degrades most on the customer domain, and what does the spot check's design (15 items) let you conclude — and not conclude?
3. Transfer: the customer's corpus updates weekly. What does that do to a *frozen* golden set, and what's the versioning answer?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
