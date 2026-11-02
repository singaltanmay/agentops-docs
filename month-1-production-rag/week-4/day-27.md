# Day 27 — Ragas wiring — 20 rows before 160

**Week 4 · Build · 75 min** · Month 1 — Production RAG

## Objective
Run Ragas (current API) on 20 golden rows with gpt-4.1-mini as judge and produce per-question scores — verified by a results CSV whose 5 spot-checked rows match your own hand judgement of the same answers.

## Why this exists
Every eval framework fails first on plumbing: dataset shape, metric names that changed across versions, judge auth. Twenty rows expose all of that for cents. The metrics, precisely: *faithfulness* (is the answer supported by the retrieved context?), *context recall / precision* (did retrieval bring the needed chunks, and how much noise came with them?), *factual correctness* (does the answer match the reference?). Each answers a different question — conflating them is Week 4's characteristic misconception.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 26):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 24):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 20):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 26's independent verification ("Rest / review — evals readiness check") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Worked example → completion:** the Ragas docs' own evaluate-and-improve walkthrough is the worked example (note its shape: baseline → failure CSV → iterate — failure analysis, not dashboard-watching). Your completion task: adapt it to your `EvaluationDataset` built from golden rows + live /ask outputs, judge = gpt-4.1-mini deployment, generator traffic kept separate. Version warning from the research: much third-party Ragas content targets the pre-0.4 API and will not run — docs or it didn't happen.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Assemble the evaluation dataset
For 20 tuning-split rows: question, /ask answer, retrieved chunk texts, reference answer — in Ragas's expected shape, built by script from golden-v1.0 + the live API.

**Expected output:** Dataset object builds; row count = 20; a printed sample row reads correctly to a human (you).

### Step 2 — Configure metrics + judge
Faithfulness, LLMContextRecall, LLMContextPrecisionWithReference, FactualCorrectness; judge model = your gpt-4.1-mini deployment; embeddings per Ragas's needs. Pin the Ragas version in requirements and the log.

**Expected output:** One metric runs end-to-end on 2 rows without error. Version + config committed.

### Step 3 — Run the 20
Full 4 metrics × 20 rows. Log wall-time + judge cost — you'll extrapolate the 130-row tuning run from this and decide on Batch.

**Expected output:** Results CSV written; cost/time per row known; the full-run estimate is a number, not a guess.

### Step 4 — Spot-check the judge (non-negotiable)
Hand-judge 5 rows' answers yourself (supported? correct?) before reading Ragas's scores for them. Compare.

**Expected output:** Agreement noted honestly. A judge disagreeing with you on >2/5 gets investigated (prompt? metric definition? your rubric?) before any full run — scaling an uncalibrated judge is the week's one unforgivable shortcut.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Import/API errors from tutorial code | Pre-0.4 API in third-party content — predicted by the research | Work only from current Ragas docs; fixed when the docs' own example shape runs unmodified first |
| Judge scores look random vs your hand check | Judge prompt/metric semantics misunderstood — or your expectations are wrong; both are live possibilities | Take one disagreement apart completely: read the answer, the chunks, the reference, the metric's definition. Fixed when that one case is fully explained, whichever side was wrong |
| Cost/time per row alarming | Judge verbosity / no batching | Apply Batch where the tooling allows (50%); cap judge output; fixed when the 130-row estimate fits a sane evening + budget |

## Independent verification (checkpoint)
Results CSV exists AND the 5-row judge-vs-you comparison is written down with its verdict. The second artefact is the one that makes the first trustworthy.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: the four metrics, one clause each, stating what each cannot see.
2. Debugging: faithfulness is high, factual correctness is low, on the same rows. Reconstruct the situation — what did retrieval and generation each do?
3. Prediction: state the full-run headline scores you expect tomorrow, per metric. Sealed until Day 28.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: the full tuning-split run, twice — winning config vs the vector-only ablation. The ablation is the point: it prices what hybrid + ranker actually bought.
