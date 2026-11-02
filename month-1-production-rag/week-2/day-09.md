# Day 9 — Chunking — four configurations, one index design

**Week 2 · Build · 75 min** · Month 1 — Production RAG

## Objective
Implement chunking as a configurable stage with ≥4 configurations and create the AI Search index schema they share — verified by each config producing chunk counts + token stats you record in the experiment file.

## Why this exists
Chunking is the highest-leverage RAG decision you'll make this month and the one most often set by copying a default. Here it's an experiment with a judge (Day 10's probe set), not an opinion. The demo baseline (~1,000 chars, 10% overlap) is in the matrix specifically so you can beat — or vindicate — it with numbers.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 8):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 6):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 2):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 8's independent verification ("Ingestion I — your own heading-aware parser") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**New pattern:** an experiment harness. Worked example (parallel): the harness shape — fixed inputs, one variable, logged outputs — demonstrated on a toy two-config run over 10 pages. Then you build the real matrix: {heading-aware ~800 tokens, heading-aware ~400 tokens, fixed 1,000-char/10%-overlap (demo baseline), fixed 500-char} — the research matrix verbatim. Embeddings enter tomorrow; today is chunk geometry + index design (fields: chunk id, parent doc id, section path, content, vector field 1,536-dim, filterable version/audience).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Build the chunker as a pure function
Input: parsed document + config. Output: chunks with stable IDs (`docid#n`), char/token counts, overlap applied only where the config says so. Deterministic: same input → same chunks, always.

**Expected output:** Unit check: re-running produces byte-identical output (diff clean). Non-determinism here poisons every later comparison.

### Step 2 — Run all four configs locally
For each: total chunks, mean/median tokens, % chunks containing code, % chunks cut mid-code-block (target ~0 for heading-aware).

**Expected output:** Experiment file has a 4-row table. Mid-code cuts in fixed configs are expected data — record, don't fix.

### Step 3 — Create the index (Free tier, for now)
Define the index via the SDK/REST from code (index definition lives in the repo, not the portal): fields above, vector profile HNSW, `text-embedding-3-small` dimensionality.

**Expected output:** Index created from code; re-running the definition script is idempotent or cleanly recreates.

### Step 4 — Embed + index config A only (today)
Embed the ~800-token heading-aware config with your own pipeline and upload. Count spend as you go.

**Expected output:** Index document count == chunker count for config A; embedding spend for the run recorded (expect cents — the full corpus is ~$0.11 at $0.022/1M per the research math; a wildly larger bill means a loop, stop and look).

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Chunk counts differ between runs | Non-deterministic ordering or overlap bug | Sort inputs, seed nothing random; fixed when two runs diff clean |
| Index rejects documents | Field type mismatch (classic: vector dimension or key field) | Compare schema field-by-field with the payload; fixed when upload reports 100% succeeded |
| Token counts implausible (10× expected) | Counting chars as tokens or re-embedding duplicates | Validate on one hand-counted page; fixed when the spot-check matches within tolerance |

## Independent verification (checkpoint)
The experiment file's four rows exist AND index count for config A matches the chunker's count exactly. Exact match is the standard — 'close' in an index is silent data loss.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved recall (unlabelled): Day 2's two monitoring caps · Day 4's three-part RBAC shape · today's four configs. All closed-book.
2. Prediction: rank the four configs by Recall@5 *before* tomorrow's measurement, with one reason per rank. Tomorrow grades it — predictions written in advance are the cheapest misconception detector there is.
3. Spot the flaw: a config with 95% overlap scores highest on recall. Why is that score suspect?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: the 30-question probe set and the first Recall@5/@10 numbers. Prep: draft 5 questions tonight whose answers you know live on specific pages — they'll join the set.
