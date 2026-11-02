# Deep build — the eval platform v1 freeze

**Week 1 · Deep build · ~3 hrs** · Month 4 — Evals, Observability & Security

## Objective
Freeze eval platform v1: full runs of all suites with the new scorers + category metrics, the weekly report upgraded to show category trends, and a platform README documenting how to add a suite, a check, and an eval spec.

## Why this exists
Platforms are defined by their extension points. Freezing v1 with docs is what makes Week 2–4 (judge, CI, red team) integrations instead of archaeology.

## Prerequisites
Week 1 lessons complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 5 (Consolidation — evals mixed gate + labelling prep)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 5 (Consolidation — evals mixed gate + labelling prep)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Documentation rule: the README's three how-tos (add a suite / add a mechanical check / add an eval spec) must each be followable by future-you in <30 min — write them from the week's actual commits, not from intention.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full battery run
All suites, current build, new scorers; tag `eval-platform-v1`.

**Expected output:** Runs in Postgres; category metrics present for all five specs.

### Step 2 — Weekly report upgrade
Report gains: per-category metric trend (last 4 runs), scorer coverage %, smoke-set status.

**Expected output:** Report renders with real trend data (history backfilled from envelope-compatible runs where possible).

### Step 3 — Platform README
`evals/README.md`: architecture, envelope, the three how-tos, held-out rules, noise-floor method.

**Expected output:** README committed; each how-to references the real files/commands.

### Step 4 — Freeze + retro note
Tag the platform state; one-paragraph note: what v1 deliberately does NOT do (judge — Week 2; gates — Week 3).

**Expected output:** Tag + note committed.

## Independent verification (checkpoint)
Tagged `eval-platform-v1` with full runs, trend-capable reporting, and a README whose how-tos match reality.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Describe your eval platform' — suites, envelope, deciders, and how a new failure becomes a gated eval, in 5 sentences.
2. Generative: the three extension points and the file/command each starts from.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
