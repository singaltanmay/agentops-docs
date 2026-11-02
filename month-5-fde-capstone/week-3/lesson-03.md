# The head-to-head — multi-agent vs single-agent control

**Week 3 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Run the pre-registered comparison (15 research tasks, cost-normalised control) and write the verdict: where multi-agent earns its tokens, where it doesn't, and what ships as the default mode.

## Why this exists
This verdict is a Month 6 interview set-piece either way it lands: 'I built multi-agent, measured it against my single agent at equal cost, and here's where each wins' is a senior answer. An unmeasured multi-agent demo is a junior one.

## Prerequisites
Lesson 2 build live; protocol frozen in Lesson 1.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 2 (Build the orchestrator-workers extension)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 2 (Build the orchestrator-workers extension)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Execution discipline: identical task set, identical judges/mechanicals, cost-normalisation enforced by equal total token ceilings per task (the control may spend its ceiling on longer single-agent runs — that's the fair fight). Failures coded to the taxonomy + the pre-mortem list (did the predicted failures actually occur?).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Run both arms
15 tasks × (multi, control) with ceilings enforced; full traces.

**Expected output:** 30 runs in Postgres under the protocol's tag; ceiling breaches = protocol violations, logged as such.

### Step 2 — Score + code failures
Success per the protocol's scorers; failures coded (taxonomy + pre-mortem mapping).

**Expected output:** Results table complete; every failure has a code.

### Step 3 — Write the verdict
Per-category verdicts + the default-mode decision + the token-cost reality vs Anthropic's ~15× reference point (yours will differ — say how and why).

**Expected output:** Verdict committed in the deployment report's extension appendix; default mode set in config accordingly.

### Step 4 — Reconcile predictions
Score Lesson 1's category predictions + Lesson 2's cost guess against results.

**Expected output:** Prediction scorecard appended — calibration is a habit, not an event.

## Independent verification (checkpoint)
A cost-normalised, pre-registered verdict exists with per-category winners and a default mode set from evidence.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Should I build multi-agent?' — answer with your data: when yes, when no, what it cost.
2. Generative: state the comparison's fairness rules and the one result that would have flipped your default.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
