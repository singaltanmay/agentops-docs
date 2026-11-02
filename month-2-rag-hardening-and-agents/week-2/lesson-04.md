# pgvector on the same instance — corpus copy indexed

**Week 2 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Enable pgvector on the B1ms instance, create a vector table mirroring the winning chunk set, and load it with the existing embeddings — verified by a nearest-neighbour query returning the expected chunk for a known probe question.

## Why this exists
The plan's deliberate experiment: is a second vector store justified, or is AI Search alone sufficient? You can't answer it from blog posts — you run both on the same questions. This lesson builds the pgvector side; the head-to-head is the week-2 deep build.

## Prerequisites
Lesson 3 done; chunk embeddings exportable from the Month 1 pipeline.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 3 (Eval results move to Postgres)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 3 (Eval results move to Postgres)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
pgvector: Postgres extension providing a `vector` type and ANN indexes (HNSW/IVFFlat). **UNVERIFIED:** the exact steps to enable the extension on Azure Database for PostgreSQL Flexible Server for your server version (extension allow-listing parameter + `CREATE EXTENSION`) — follow the official Azure Postgres docs for your version and record what you actually did in the experiment log; do not trust any blog's parameter names.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Enable the extension per official docs
Follow the current Azure Postgres documentation to allow-list and create the `vector` extension in the `agentops` database.

**Expected output:** `SELECT extname FROM pg_extension;` lists `vector`. The doc name/section you followed is recorded in the experiment log.

### Step 2 — Create the mirror table
`chunks_pg` (chunk_id, doc_id, section_path, content, embedding vector(1536)) + an HNSW index. Exact DDL follows the pgvector docs for your installed version (**UNVERIFIED** here by design — copy the shape from the official pgvector README/docs, not from memory).

**Expected output:** Table + index exist; row count = AI Search index document count (reconcile, as always).

### Step 3 — Load the embeddings
Export chunk embeddings from the existing pipeline artefacts and bulk-load (no re-embedding spend — reuse, don't recompute).

**Expected output:** Load count reconciles; embedding spot-check: one chunk's vector matches the source artefact.

### Step 4 — Smoke-test retrieval
Embed one probe question with the same model, run top-5 nearest neighbours.

**Expected output:** The expected chunk for that question appears in the top 5 (it does in AI Search — this checks the mirror, not the universe).

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Extension creation refused | Allow-list parameter not set / server not restarted | Follow the Azure docs sequence exactly (parameter → restart → CREATE EXTENSION); log the working sequence |
| Row counts don't reconcile with AI Search | Export dropped multi-chunk docs or filter mismatch | Diff by doc_id counts per source; the gap names the bug |

## Independent verification (checkpoint)
`vector` extension live, mirror table loaded with reconciled counts, and a probe question's expected chunk in pgvector's top 5.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the experiment question this sets up, in one sentence, with its decision rule.
2. Prediction: on which metric do you expect pgvector and AI Search to differ most — pure vector Recall, hybrid quality, or latency? Commit to a prediction before the deep build.
3. Teach-back: why reuse existing embeddings instead of re-embedding for the mirror? What confound would re-embedding introduce?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
