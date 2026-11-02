# Contextual retrieval — chunk context prefixes, measured

**Week 1 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Implement contextual retrieval (prepend a generated context sentence to each chunk before embedding) on a corpus subset and measure its retrieval effect — kept, dropped, or scoped on the numbers.

## Why this exists
Chunks lose their document context when split ('this flag defaults to…' — which flag?). Anthropic's contextual-retrieval pattern is the standard fix and is directly named in the role skill lists this course targets.

## Prerequisites
Lessons 1–3 decisions recorded; ingestion pipeline from Month 1 re-runnable.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 3 (HyDE-style hypothetical-document retrieval, measured)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 3 (HyDE-style hypothetical-document retrieval, measured)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
For each chunk, generate a short context prefix situating it in its document (title, section path, what this chunk is about), prepend before embedding; BM25 index keeps the original text. Cost: one small-model call per chunk — use the Batch API (50% off) and prompt caching (stable document prefix) to keep the one-time indexing cost trivial.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Generate prefixes for a subset
Run prefix generation over one docs section (~100 chunks) with `gpt-4o-mini` via Batch where the tooling allows; store prefix as chunk metadata.

**Expected output:** Subset re-indexed; a sampled chunk shows its prefix in the index payload.

### Step 2 — Measure on subset questions
Filter the tuning split to questions sourced from that section; ablate prefixes off vs on.

**Expected output:** Two rows appended, scoped note in the results file ('subset: <section>').

### Step 3 — Cost the full-corpus rollout
From the subset run, compute per-chunk cost and project the full corpus; write the number down *before* deciding.

**Expected output:** Projection recorded in the decision (chunks × unit cost = total).

### Step 4 — Decide: full rollout, scoped, or drop
If kept: run the full re-index as a Container Apps Job (Month 1 pattern) and re-run the base ablation.

**Expected output:** Decision + (if kept) full-corpus harness row committed.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Prefixes leak answer text into retrieval artificially | Prefix generator saw the golden questions | Generate prefixes from the document only; the generator prompt never contains questions |
| Subset win doesn't replicate full-corpus | Subset was unrepresentative | That's why the decision offers 'scoped' — record which sections benefit |

## Independent verification (checkpoint)
Subset ablation rows + rollout cost projection + a decision whose scope (full/scoped/drop) matches the evidence.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the prefix-generation prompt's constraints from memory (inputs allowed, inputs forbidden).
2. Prediction: BM25 on prefixed text vs original text — which do you index for keyword search, and why?
3. Teach-back: contextual retrieval vs query rewriting — which failure class does each fix? Give one example question for each.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
