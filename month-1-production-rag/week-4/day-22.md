# Day 22 — Golden set I — design + first docs-derived batch

**Week 4 · Build · 75 min** · Month 1 — Production RAG

## Objective
Define the golden-set schema and write the first ~35 docs-derived questions with reference answers + expected chunk IDs — verified by a schema validator passing on every row and each answer spot-checked against its cited chunk.

## Why this exists
Week 4's deliverable is a measurement instrument: 160 questions whose quality caps every conclusion you'll draw for the next five months. The recipe (research §3.2): ~60% docs-derived, ~25% issue-derived, ~15% unanswerable/adversarial — and every answer requires a citation to a chunk ID, because scoring checks the citation, not just the text. That is the contamination control doing real work.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 21):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 19):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 15):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 21's independent verification ("Week 3 gate — the product, audited") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**New pattern for Week 4 — instrument design.** Direct instruction (Hamel, read last night): evals are unit tests for AI products; error analysis precedes metrics; a golden row is a *claim* (question, reference answer, source chunk, category) that a stranger could re-verify from the pinned docs alone. Categories: factoid / how-to / config-YAML / troubleshooting / multi-hop / unanswerable. Write questions in user language, not doc headings — heading-copied questions measure memorisation.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Freeze the schema
Row: `id, question, reference_answer, source_page, expected_chunk_ids[], category, notes`. Validator script: schema + chunk existence + category vocabulary. The 30 held-out rows get a `split: heldout` flag and are never tuned against — mark them as you write, not later.

**Expected output:** Validator runs; an intentionally broken row fails it (test the test).

### Step 2 — Write batch 1: 35 docs-derived rows
Spread across concepts/tasks and 4 categories. For each: answer from the pinned page, record the chunk, move on — ~2 min/row is the pace; agonising is scope creep.

**Expected output:** 35 rows validate; every expected chunk exists.

### Step 3 — Spot-check like an auditor
Re-derive 5 random rows from the raw docs as if you'd never seen them. Compare with your written answers.

**Expected output:** 5/5 materially agree. A disagreement means the row is ambiguous — rewrite the question or the answer today, while the fix is cheap.

### Step 4 — Log the writing, honestly
Time per row, categories that were hard to write (multi-hop usually), and any doc ambiguity found — doc bugs you discover are golden-set gold: they become troubleshooting rows.

**Expected output:** Session note committed with the batch.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Questions drift toward heading paraphrases | Writing from the doc's structure instead of a user's need | Rewrite the offender as a scenario ('my pod's DNS…'); fixed when the question contains no phrase lifted from its source heading |
| Reference answer longer than the chunk supports | Answer smuggling in your own expertise — ungradeable later | Trim to what the cited chunks support, or add the supporting chunk; fixed when every claim in the answer traces to a cited chunk |
| Pace collapses (5+ min/row) | Perfectionism on wording | Timebox: a clear, sourced, imperfect row beats a polished one — the set needs breadth; note slow categories for Day 24's plan |

## Independent verification (checkpoint)
Validator green on 35 rows + the 5-row audit re-derivation matching. The instrument checks itself before it ever measures the product.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: the golden recipe percentages + the six categories + why held-out rows are flagged at write time.
2. Prediction: which category will show the worst Week 4 scores, and which failure class (retrieval vs generation) will dominate it? Written down; Day 29 grades it.
3. Teach-back: why does citation-checking beat answer-text matching as the contamination control? 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: batch 2 (next ~35 docs-derived) + the first multi-hop questions. Bring today's session note — its 'hard categories' line sets tomorrow's order.
