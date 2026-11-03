# Day 16 — Retrieval II — semantic ranker + the winner ships

**Week 3 · Apply · 75 min** · Month 1 — Production RAG

## Objective
Add hybrid + semantic ranker as the fourth mode, complete the 4-mode comparison, and record the retrieval decision — verified by the decision record citing Recall@10 + hand-scored correctness on 30 answers.

## Why this exists
The semantic ranker is the one component you cannot self-host or inspect — a proprietary L3 reranker over the top ~50 hybrid results (first 1,000 requests/mo free, then $1/1,000). The only honest way to adopt a black box is to measure what it buys on your questions and write down the price of the dependency.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 15):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 13):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 9):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 15's independent verification ("Retrieval I — vector vs BM25 vs hybrid, honestly compared") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Apply pattern A, scaffold faded:** no worked example today — the harness is yours now. New content is judgement, taught directly: Recall tells you the chunk was *present*; it doesn't tell you the answer was *right*. So today adds a thin human layer — hand-score answer correctness on 30 questions for the top two modes — the seed of Week 4's judge calibration thinking.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Enable semantic ranking
Semantic configuration on the index + `vector_semantic_hybrid`-style query from the SDK (per Microsoft Learn's FastAPI RAG tutorial shape). Run mode 4 on the 60 questions.

**Expected output:** Fourth row in the table, produced by the same scorer. Ranker request count logged (you're inside the free 1,000 — note when you wouldn't be).

### Step 2 — Hand-score 30 answers
Generate answers (your Day 5 completion path + retrieved chunks) for 30 questions under modes 3 and 4. Score correct / partial / wrong against the pinned docs, by hand, blind to mode if you can manage it.

**Expected output:** 30×2 scoresheet committed. Disagreements with Recall (right chunk, wrong answer) flagged — they're Week 4 gold.

### Step 3 — Decide
Decision record 002: winning mode + top-k for the product (tuned from these tables, not guessed) + ranker keep/drop + the cost note.

**Expected output:** Decision committed; the API work tomorrow consumes exactly these parameters.

### Step 4 — Freeze probe-v2 + tables
Tag in git. These numbers are the 'before' picture for Week 4's ablation.

**Expected output:** Tag exists; tables immutable from here.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Ranker improves Recall@10 but not hand-scored correctness | Reranking surfaces plausible chunks the generator uses badly — a generation problem wearing a retrieval costume | Note it as a Week 4 failure-taxonomy seed; the decision can still keep the ranker if correctness is not worse — but say which metric governed |
| Ranker requests cost more than expected | Agentic-retrieval or per-query fan-out quietly enabled (token-metered past free allowance) | Audit query construction; fixed when request counts per question are explainable line-by-line |
| Hand-scoring feels arbitrary | No rubric — fix the rubric, not the scores | Write 3-line criteria for correct/partial/wrong *before* rescoring; fixed when a re-score of 5 agrees with the first pass |

## Independent verification (checkpoint)
Decision record 002's every number traces to the frozen tables, and 5 hand-scored answers re-score identically under the written rubric.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Transfer: a question type where the ranker *hurt* — construct one and explain the mechanism.
2. Teach-back: Recall@10 vs answer correctness — why a serious eval reports both, and which one Ragas will approximate in Week 4.
3. Grade Day 11's prediction (which ingestion path you'd curse) and Day 15's ranker threshold against today's data. Log both outcomes.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: the product slice — /ask API with structured outputs and citations. Required first: Microsoft Learn structured-outputs how-to (link in Resources) — note the parallel-tool-calls constraint.
