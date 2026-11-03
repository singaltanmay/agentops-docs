# Day 17 — Cited-answer API — structured outputs + refusals

**Week 3 · Build · 60 min (light)** · Month 1 — Production RAG

## Objective
Ship `POST /ask` returning a structured answer (answer + citations[] with chunk IDs + `answerable: bool`) from the Day 16 winning retrieval config — verified by scripted calls where every citation resolves to a real chunk.

## Why this exists
This is the moment retrieval becomes a product contract. Structured outputs make citations machine-checkable rather than decorative, and the `answerable` flag is the refusal behaviour that separates a trustworthy RAG service from a confident fabricator — the property Week 4 will grade hardest.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 16):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 14):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 10):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 16's independent verification ("Retrieval II — semantic ranker + the winner ships") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**New pattern B (week's second spike, resting on a stable A):** generation with a schema. Direct instruction from the Learn how-to: JSON-Schema-constrained output, stable cacheable system-prompt prefix, citations drawn only from retrieved chunk IDs the model is given — never invented. Platform gotcha from the docs: Azure OpenAI does not support parallel function calls with structured outputs (`parallel_tool_calls=false`) — you don't use tool calls today, but pin the fact; Month 2 will.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Define the response schema
`{answer: string, citations: [{chunk_id, section_path}], answerable: boolean}` as a Pydantic model + JSON Schema for the AOAI structured-output request. The prompt rule, verbatim-worthy: 'Answer only from the provided chunks. If they do not contain the answer, set answerable=false and say so.'

**Expected output:** Schema committed; a malformed-output unit test fails loudly (that's its job).

### Step 2 — Wire retrieve → generate
Retrieve top-k per Decision 002 → assemble context with chunk IDs visible → gpt-4o-mini with the schema → validate. Log per-stage timing + tokens (App Insights custom properties) from the first request.

**Expected output:** One local `/ask` call returns a schema-valid answer with citations matching the retrieved set.

### Step 3 — Test the refusal path deliberately
Ask 5 questions whose answers are NOT in Concepts+Tasks (a feature that doesn't exist, an excluded reference topic). Count correct refusals.

**Expected output:** ≥4/5 return `answerable=false` with no fabricated citation. Below that: strengthen the prompt rule + lower the retrieval-score threshold — and log which lever you used.

### Step 4 — Citation resolution check (scripted)
For 10 sampled answers, resolve every cited chunk_id against the index programmatically.

**Expected output:** 100% resolve. A single dangling citation fails the day — this check becomes a permanent smoke test.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Model cites chunk IDs not in context | Hallucinated citation — the signature failure of naive RAG | Constrain: instruct + post-validate (drop/repair answers citing unknown IDs, count occurrences); fixed when the scripted check passes 10/10 and the counter exists in logs |
| answerable=false on answerable questions | Threshold too strict or prompt rule over-broad | Inspect the retrieved chunks for one case: chunks present but model refused → prompt; chunks absent → retrieval. Fix the layer that's actually wrong |
| Schema validation errors intermittently | Model drifting from schema under long contexts | Structured outputs (not 'please output JSON') + one retry with the validation error appended; fixed when 50 consecutive calls validate |

## Independent verification (checkpoint)
A script (not your eyes) calls /ask 15 times — 10 answerable, 5 not — and asserts: schema valid 15/15, citations resolve 100%, refusals ≥80%. Its output is the day's artefact.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: the response schema's three top-level fields and the prompt's refusal rule, near-verbatim.
2. Prediction: which fails first under a doubled corpus — citation resolution or refusal rate? Mechanism, please.
3. Debugging (planted): an answer is fluent, cited, and wrong — the chunk says the opposite of the answer. Which layer failed, and which Week 4 metric is built to catch exactly this? (Faithfulness.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow's long block: the Next.js UI + per-stage tracing. The 'wrong answer' button you build tomorrow becomes Week 4's failure-analysis data — design its payload tonight in one line: question, answer, chunk IDs, your label.
