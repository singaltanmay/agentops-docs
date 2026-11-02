# Calibration II — judge bias checks (position, verbosity, self-preference)

**Week 2 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Stress the calibrated judges for known LLM-judge biases: position bias (swap order in pairwise contexts), verbosity bias (pad a bad answer, truncate a good one), and self-preference (judge scoring its own model family's outputs) — quantifying each effect on your judges.

## Why this exists
A judge can be calibrated on your set and still be systematically biased on the next distribution. These three biases are the literature's named failure modes (MT-Bench judge study) — checking them is what 'calibrated' means when an interviewer pushes.

## Prerequisites
Lesson 3 declarations done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 3 (Calibration I — fix the judge from its disagreements)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 3 (Calibration I — fix the judge from its disagreements)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Method per bias: construct paired variants from calibration items (not new labels — transform, don't relabel): order-swapped pairs for any comparative judging; length-padded/truncated variants where the *content* verdict is known; family-swap by scoring generator-model outputs vs judge-model outputs on the same items (your generator is `gpt-4o-mini`, judge `gpt-4.1-mini` — same vendor family, so treat self-preference as a live risk, measured by comparing judge verdicts against labels split by output source).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Verbosity probe
Pad 15 known-bad outputs with fluent filler; truncate 15 known-good ones. Re-judge.

**Expected output:** Flip rates recorded per judge; a flip rate >10% on padding is a finding with a named mitigation (length-normalised rubric line).

### Step 2 — Position probe (where comparative)
If any judge compares two outputs, run both orders on 20 pairs.

**Expected output:** Consistency % recorded; inconsistency >15% bars that judge from comparative use.

### Step 3 — Self-preference split
Split calibration results by output source model; compare judge-vs-label agreement per source.

**Expected output:** Agreement gap recorded; a gap >8 points is reported in the calibration table as a limitation.

### Step 4 — Write the bias annex
Calibration table gains a bias annex: three probes, three numbers, three mitigations or acceptances.

**Expected output:** Annex committed; every number from a run, not an impression.

## Independent verification (checkpoint)
Bias annex exists with measured flip/consistency/gap numbers and a mitigation or explicit acceptance per bias.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: name the three biases and the probe that measures each.
2. Prediction: which bias is most dangerous for *online* evals (Week 3) specifically, and why?
3. Teach-back: 'My judge is calibrated' — expand into the full honest sentence, with bands and biases, as you'd say it in an interview.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
