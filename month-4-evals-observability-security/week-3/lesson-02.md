# The regression gate — thresholds, baselines, and the red-run drill

**Week 3 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Wire the CI gate: on pull requests touching prompts/config/agent code, CI runs the smoke suites (promptfoo mechanicals + runner judges within policy bands) and fails the build on regression beyond the measured noise floor — verified by the deliberate-regression drill: a sabotaged prompt is blocked, then reverted to green.

## Why this exists
This is P3's most demonstrable artefact: 'CI blocks a deliberately regressed prompt' is a sentence you can say in an interview with a straight face only after this drill passes.

## Prerequisites
Lesson 1 configs reconciled; judge policy (Week 2) frozen; noise floors measured (Month 4 Week 1).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 1 (promptfoo as the CI harness — eval suites in CI shape)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 1 (promptfoo as the CI harness — eval suites in CI shape)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Gate design: compare against the **main-branch baseline run** (stored in Postgres), not fixed magic numbers — bars move only via deliberate baseline updates (a reviewed act, logged). Fail conditions: any mechanical check regression, or a gate-band judge metric dropping beyond its noise floor. Trend-band judges report but never block. Gate runtime budget: the smoke set's measured ~15 min is too slow for every PR — trim to a ≤8-min gate subset and keep the full smoke for nightly (record the trade-off).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Baseline mechanism
CI reads the latest `main` baseline run IDs from Postgres (or a committed baseline manifest if CI can't reach the DB — record which).

**Expected output:** A local dry-run compares a candidate run vs baseline and prints per-metric deltas.

### Step 2 — Wire the workflow
GitHub Actions job on PRs touching the watched paths: deploy-free (run against the staging API or a spun-up container — record the choice) → smoke subset → compare → fail/pass.

**Expected output:** A test PR shows the job running with a readable summary comment/log.

### Step 3 — The red-run drill
Deliberately regress: sabotage a system prompt (e.g. drop the citation instruction) on a branch; open the PR.

**Expected output:** Gate goes red; the failure output names the regressed metrics (citation checks + faithfulness judge) — not just 'eval failed'.

### Step 4 — Revert + baseline-update procedure
Revert the sabotage → green. Then document how a *legitimate* baseline change happens (who, what evidence, where logged).

**Expected output:** Green run recorded; baseline-update procedure committed in `evals/`.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Gate is flaky (same commit, both colours) | Judge variance inside the noise floor, or staging flakiness | Widen the fail margin to the measured floor for judge metrics; mechanicals must be deterministic — a flaky mechanical is a bug, full stop |
| Gate takes 25 minutes | Full suites in the PR path | Enforce the ≤8-min gate subset; move depth to the nightly job (Lesson 3) |

## Independent verification (checkpoint)
The drill is the verification: sabotage blocked with named metrics, revert green, baseline updates are a documented, logged act.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the gate's fail conditions and the baseline rule (vs fixed thresholds) with its rationale.
2. Prediction: a real improvement makes answers longer, tripping a verbosity-sensitive mechanical check. Gate red — correct behaviour or gate bug? Argue both, then state the resolution path.
3. Teach-back: why do trend-band judges report but never block? Connect to their calibration bands.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
