# Day 15 — Retrieval I — vector vs BM25 vs hybrid, honestly compared

**Week 3 · Build · 75 min** · Month 1 — Production RAG

## Objective
Run vector-only, BM25-only, and hybrid (RRF) retrieval over an expanded 60-question set and record Recall@10 per mode per category — verified by the comparison script's table regenerating identically on re-run.

## Why this exists
This is the experiment the whole corpus choice was designed for: Kubernetes YAML, flags, and error strings are where keyword retrieval earns its keep, and prose concepts are where vectors do. Knowing *where* each wins — not just that hybrid wins on average — is the engineering content of Week 3.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 14):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 12):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 8):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 14's independent verification ("Week 2 gate — one-command reindex, reconciled") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**New pattern A for the week — worked example first:** on a parallel mini-corpus (10 pages you choose), trace one query through all three modes by hand: the BM25 term matches, the vector neighbours, and how Reciprocal Rank Fusion merges two ranked lists without needing comparable scores. Then the real run is a completion problem: harness skeleton given, mode configurations blanked. Key fact to internalise: hybrid in AI Search = BM25 + vector fused by RRF in a single query — not two queries you merge yourself.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Expand the question set to 60
Add 30 questions in Week 2's category proportions, half mined from real phrasing (docs issue titles, your own Day 5–14 questions). Expected chunks mapped per question (document + section, config-independent).

**Expected output:** `probe-v2.jsonl` at 60 rows; every expected target verified to exist by script.

### Step 2 — Implement the three modes
Same index, same questions: (a) vector-only, (b) BM25-only (keyword), (c) hybrid. One scorer, k=10, per-category output.

**Expected output:** Three rows appear from one command. If a mode needs a different index shape, that's a finding — record it.

### Step 3 — Run + record
Full table: Recall@10 overall + per category, per mode. Log latency per mode while you're here (p50 is enough today).

**Expected output:** Table committed. The YAML/troubleshooting rows are the ones to read first — they test the corpus hypothesis.

### Step 4 — Write the interim read
5 sentences: where each mode wins, the surprise, what semantic ranker (tomorrow) would have to beat to earn its place.

**Expected output:** Interim read committed beside the table.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Hybrid ≈ vector overall, worse on YAML | Query construction dropping exact terms (over-eager rewriting or analysers) | Inspect 3 YAML queries term-by-term; fixed when the failing queries' key tokens demonstrably reach the keyword side |
| BM25 catastrophically bad on prose | Expected, not a bug — BM25 has no synonymy | Classify as 'mode property' in the table notes; the fix is hybrid, not BM25 tuning |
| Results differ between runs | HNSW approximation + index churn — or a scorer bug | Re-run one mode 3× and quantify jitter before comparing modes; fixed when jitter is measured and smaller than the deltas you claim |

## Independent verification (checkpoint)
Re-run the full comparison from a clean shell: table regenerates. Hand-check 3 questions (one per mode's best category) against the raw index responses.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Prediction (before tomorrow): state the Recall@10 delta semantic ranker must exceed to justify $1/1,000 requests past the free 1,000 — and your confidence.
2. Generative recall: what RRF actually computes, in one sentence, and why it sidesteps score normalisation.
3. Interleaved: Day 3's S1 argument · Day 9's overlap flaw · Day 13's flip condition. Closed-book.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: add semantic ranker as mode four, then freeze the retrieval winner that the API will ship.
