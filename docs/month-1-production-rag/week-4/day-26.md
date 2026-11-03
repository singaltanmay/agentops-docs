# Day 26 — Rest / review — evals readiness check

**Week 4 · Review · 60–90 min** · Month 1 — Production RAG

## Objective
Consolidate Weeks 1–4's retrieval/generation concepts and verify the eval preconditions — verified by a mixed score sheet plus a checklist: golden-v1.0 frozen, /ask stable, judge model deployment confirmed.

## Why this exists
Tomorrow the judge arrives — a second model grading your first model. Everything Week 4 concludes depends on that setup being boring and correct. Today checks the boring parts while there's nothing at stake, and consolidates the concepts the Ragas metrics are about to name formally.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 25):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 23):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 19):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 25's independent verification ("Golden set IV — adversarial rows + freeze golden-v1.0") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new build concept. One idea, taught directly, that tomorrow needs: **the judge is a measurement instrument with its own error rate.** Bastani/Hamel discipline applies to it too — you'll sample-check judge verdicts against your own Day 16-style hand scores before trusting any aggregate. A judge you haven't calibrated is a random number generator with good grammar.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Mixed check (10 items, Weeks 1–4)
Spread: 2 infra, 3 retrieval, 2 generation, 3 golden-set design. Confidence-tagged, classified on miss.

**Expected output:** Score sheet logged; any KC dropping to fragile gets a named repair slot in Days 27–28 warm-ups.

### Step 2 — Precondition checklist
golden-v1.0 tag present · /ask assertions green · gpt-4.1-mini judge deployment exists (second deployment, stronger than the generator — deliberate: judge ≠ generator) · Batch API mechanics skimmed (50% saving on judge runs where tooling allows).

**Expected output:** Checklist all-green or the gap becomes Monday's first step, named today.

### Step 3 — Calibrate expectations
Re-read your Day 22 + Day 24 predictions (worst category; recall-vs-faithfulness). Write the scores you'd *expect* per Ragas metric, roughly, with reasons.

**Expected output:** Expectations page committed — tomorrow's surprises get measured against this, not against a retrofitted memory.

### Step 4 — Rest, actually
Close the loop: log the week, stop. The Ragas days are dense; arriving rested is a strategy, not a reward.

**Expected output:** Log written. Laptop closed.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Judge deployment missing/quota-blocked | Week 4's one external dependency surfacing late — exactly what this checklist exists to catch | Create it today via Bicep (it's a deployment, not a new resource class); fixed when a one-call judge smoke test returns |
| /ask assertions flaky today | Production drift before the big measurement — must be understood first | Diagnose to a named cause before Monday; running evals on a flaky target manufactures taxonomy noise |
| Expectations page feels pointless | It feels that way until Day 29 — pre-registered expectations are what make 'surprising' an objective word | Write it anyway, briefly. Future You is the audience. |

## Independent verification (checkpoint)
Checklist + score sheet + expectations page, all committed. Readiness is a paper state before it's a compute state.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: judge ≠ generator — why, and what goes wrong when the same model grades its own outputs?
2. Interleaved final-form: pick any 3 KCs and state their current state + the evidence. If you can't cite evidence, the state is 'unknown' — mark it so.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: Ragas wiring on 20 rows first — faithfulness, context recall/precision, factual correctness — before any full run.
