# Deep build — pgvector vs AI Search head-to-head + verdict

**Week 2 · Deep build · ~3 hrs** · Month 2 — RAG Hardening + Agents

## Objective
Run the same tuning-split questions through pgvector (vector-only) and AI Search (vector-only, then hybrid) and write the verdict: what role, if any, pgvector plays in this architecture — decided by numbers.

## Why this exists
This is the experiment the whole week built toward, and a classic interview question ('why not just pgvector?'). Your answer will be a measured table, not an opinion.

## Prerequisites
pgvector mirror loaded and reconciled; harness can target both stores (add the pgvector retrieval path in this session).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 5 (Consolidation — state-layer mixed gate + LangGraph state design prep)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 5 (Consolidation — state-layer mixed gate + LangGraph state design prep)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Fair-comparison discipline: same chunks, same embeddings, same questions, same scorer. Compare like-for-like first (vector-only vs vector-only), then compare each store's *best* mode (pgvector+BM25-in-Postgres is possible but is a different build cost — if you test it, label the extra engineering honestly). Record latency p50/p95 per store at this corpus size.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Add the pgvector retrieval path to the harness
Harness gains `store: pgvector` (vector search over `chunks_pg`).

**Expected output:** Harness run with `store=pgvector` produces a normal results row in Postgres.

### Step 2 — Run the three-way comparison
pgvector vector-only vs AI Search vector-only vs AI Search hybrid — frozen questions/scorer.

**Expected output:** Three comparable rows (plus per-category) in `eval_runs`.

### Step 3 — Latency pass
Record p50/p95 query latency per store over the tuning split.

**Expected output:** Latency columns filled for all three rows; measurement method noted (same client, same session).

### Step 4 — Write the verdict into the ablation report
Verdict must name: the quality delta, the latency delta, the operational delta (one store vs two), and the decision (AI Search primary / pgvector role if any, e.g. offline experiments).

**Expected output:** Verdict section committed; it cites run IDs, not vibes.

### Step 5 — Reconcile with your Lesson 4 prediction
One paragraph: where your prediction was wrong and what that teaches about the corpus.

**Expected output:** Paragraph present in the report.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| pgvector 'wins' suspiciously | Comparison confound: different chunk sets or embeddings | Reconcile chunk counts and embedding provenance before believing any win |
| Hybrid comparison is unfair to pgvector | Category error: hybrid is a Search feature | That's the point of the two-stage comparison — report both stages separately |

## Independent verification (checkpoint)
Three run IDs in Postgres back every number in the verdict; the verdict names a decision and the conditions that would reverse it.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Why not just use pgvector for everything?' — 5 sentences, at least two numbers.
2. Transfer: the corpus grows 20×. Which measured quantity from today do you re-check first, and what result would flip the verdict?
3. Prediction vs reality: state your Lesson 4 prediction error in one line.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
