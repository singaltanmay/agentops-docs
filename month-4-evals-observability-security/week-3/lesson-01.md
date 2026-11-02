# promptfoo as the CI harness — eval suites in CI shape

**Week 3 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Stand up promptfoo locally against the Workbench (Azure OpenAI provider) running a first eval derived from the golden set — verified by a promptfoo run producing a pass/fail table you can reconcile with the runner's numbers.

## Why this exists
One tool now serves both CI evals and Week 4's red team — promptfoo is built for exactly this double duty, with Azure OpenAI as a first-class provider. Learning its shape on a friendly eval first keeps Week 4 focused on attacks, not tooling.

## Prerequisites
Week 2 gate passed. Tooling: promptfoo docs (promptfoo.dev) — getting-started + red-teaming guide are this week's reading.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 2, Lesson 6 (Deep build — online eval wiring: sampled production scoring)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 2, Lesson 6 (Deep build — online eval wiring: sampled production scoring)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
promptfoo model: a config names providers (your deployed API or the Azure OpenAI deployments), prompts, and assertions (deterministic + model-graded). Map your world onto it deliberately: the *system under test* is your API (not a bare model), assertions reuse the scorer map's mechanical checks where promptfoo supports them, and its model-graded assertions are *not* your calibrated judges (different prompts, uncalibrated) — promptfoo gates on mechanicals + your runner's judges, a division Week 3 Lesson 2 makes concrete. **UNVERIFIED:** exact config keys/provider IDs for your promptfoo version — its official docs govern; record the version.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Install + first config
Install promptfoo (per its docs), write a config hitting your `/ask` endpoint with 10 golden questions + citation-presence assertions.

**Expected output:** `promptfoo eval` completes; the table shows per-question pass/fail (command per the official getting-started).

### Step 2 — Reconcile with the runner
Same 10 questions through your runner; compare verdicts item by item.

**Expected output:** Verdicts agree, or every disagreement is explained by a named assertion difference (not 'tools differ').

### Step 3 — Add the agent smoke slice
Second config: the 10-task agent smoke set (Month 4 Week 1) against the agent endpoint, mechanical assertions only.

**Expected output:** Config runs; failures match the runner's smoke results.

### Step 4 — Record the mapping doc
`evals/promptfoo-map.md`: which suites/assertions live in promptfoo vs the runner, and why.

**Expected output:** Map committed; the judge-division rule is written in it.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| promptfoo hits the model, not your system | Provider pointed at raw Azure OpenAI | The system under test is the deployed API — a bare-model eval measures a system you don't ship |
| Assertion pass rates look better than the runner's | Assertions weaker than the scorer map | Reconcile item-by-item (Step 2) — never average away a disagreement |

## Independent verification (checkpoint)
promptfoo runs two reconciled configs locally; the promptfoo-vs-runner division of labour is documented.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the division rule (what promptfoo gates, what the runner owns) and the reason uncalibrated model-graded assertions don't gate.
2. Prediction: promptfoo and the runner disagree on 3/10 questions. List the investigation order before touching either config.
3. Transfer: a teammate wants promptfoo to *replace* the runner. Argue the two losses (envelope/history, calibrated judges) in 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
