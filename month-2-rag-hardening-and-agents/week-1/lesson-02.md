# Query rewriting — multi-query and decomposition, measured

**Week 1 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Add query rewriting (multi-query expansion + question decomposition) behind a harness flag and measure it on the tuning split — kept or dropped on the numbers.

## Why this exists
User questions rarely match document phrasing. Rewriting is the cheapest retrieval lever after hybrid — but it costs latency and tokens on every query, so it must earn its place.

## Prerequisites
Lesson 1 harness working; Month 1 retrieval shootout numbers at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 1 (Ablation harness — freeze the experiment protocol)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 3 (retrieval shootout)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 1 (Ablation harness — freeze the experiment protocol)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Multi-query: generate N paraphrases/sub-questions with `gpt-4o-mini`, retrieve per variant, fuse (RRF). Decomposition: split multi-hop questions into sequential sub-questions. Both are prompt+plumbing, no new services. Measure retrieval metrics *and* added latency/cost per query — a Recall win that doubles p95 may still lose.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement multi-query behind a flag
Add `rewrite: none|multi` to the harness config. Implementation: one `gpt-4o-mini` call producing 3 variants, one retrieval per variant, RRF fusion into the existing ranker stage.

**Expected output:** Flag off = bit-identical results to Lesson 1's base run; flag on = retrieval logs show 4 query variants.

### Step 2 — Run the comparison
`ablate` with rewrite off vs on, everything else frozen.

**Expected output:** Two rows appended; Recall@5/@10 and p95 both visible for both.

### Step 3 — Read the failures it created
Diff per-question results: list questions that got *worse* with rewriting and read 5 of them.

**Expected output:** A short note in the results file names the regression pattern (e.g. rewrites drifting off the user's exact error string/YAML key).

### Step 4 — Decide and record
Write the keep/drop decision with numbers into the ablation report draft. If kept, note the exact conditions (e.g. only when the raw query's top-1 score is low).

**Expected output:** Decision record committed; if conditional, the condition is implemented behind the same flag before you move on.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Rewrites hurt exact-match questions | Paraphrase drift replaces rare exact terms (flags, error codes) | Always include the raw query as one of the fused variants — never replace it |
| Latency doubles for +0.01 Recall | Real possibility — and a result | Record it and drop or gate the feature; the harness exists to make this call cheap |

## Independent verification (checkpoint)
Two harness rows (rewrite off/on) plus a written decision that cites both the quality delta and the latency/cost delta.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: sketch the multi-query data flow, naming where fusion happens.
2. Prediction: a question contains the exact string `CrashLoopBackOff`. Which rewrite failure do you expect, and what design choice prevents it?
3. Teach-back: when is query rewriting the *wrong* layer to fix a retrieval miss? Name the failure class it cannot fix.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
