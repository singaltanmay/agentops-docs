# Day 25 — Golden set IV — adversarial rows + freeze golden-v1.0

**Week 4 · Long build · 2–3 hrs** · Month 1 — Production RAG

## Objective
Complete the set to 160 rows with ~25 unanswerable/adversarial questions, split off 30 held-out rows, and freeze `golden-v1.0` — verified by the frozen tag, the category counts matching the recipe, and the held-out list sealed from tuning.

## Why this exists
The unanswerable slice is the set's conscience: questions about features that don't exist, versions that aren't pinned, and content deliberately excluded from the index — where the correct behaviour is 'not in the corpus,' with no fabrication. Freezing matters as much as finishing: a golden set that keeps moving makes every future comparison meaningless.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 24):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 22):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 18):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 24's independent verification ("Golden set III — issue-derived troubleshooting rows") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Independent production, lowest scaffold of the month so far:** you design the adversarial categories yourself from one principle — each row must have a *plausible fabrication available* (a similar real feature, a neighbouring version, an excluded reference topic). An unanswerable question nobody could be tempted to hallucinate an answer to tests nothing.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Write ~25 unanswerable/adversarial rows
Mix: nonexistent feature (~8), wrong-version premise (~6), excluded-content (~6), false-premise troubleshooting (~5). Reference answer for each = the correct refusal + what IS true nearby, where applicable. expected_chunk_ids empty by design — validator must treat that as valid *only* for this category.

**Expected output:** 25 rows validate under the category-aware rule; each has its temptation noted (which fabrication it baits).

### Step 2 — Fill remaining gaps to 160
Per Day 24's rebalance note: top up the thinnest categories with docs/issue rows under full Day 22–24 discipline.

**Expected output:** Total = 160 rows; category counts within a few of the recipe (≈95 / 40 / 25).

### Step 3 — Split and seal the held-out 30
Stratified by category, flagged `heldout`, listed in a sealed file. Rule restated in the set README: held-out rows are run for reporting, never for tuning decisions.

**Expected output:** Held-out list committed; the tuning split is 130 rows. Any future temptation to peek gets logged — the log is the enforcement.

### Step 4 — Freeze
Git tag `golden-v1.0`; set README with recipe, counts, provenance rules, contamination controls, freeze date.

**Expected output:** Tag exists; the set is now an instrument with a version number — cite it that way forever after.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Adversarial rows are answerable after all | The 'nonexistent' feature exists in the pinned branch (your knowledge drifted) | Check against the pinned docs by search, not memory; genuinely-answerable rows move categories — that's the check working |
| Validator rejects empty chunk lists | Validator written before this category existed | Category-aware validation; fixed when the full 160 validate and a deliberately-wrong row (empty chunks, factoid category) still fails |
| Temptation to keep polishing past 160 | Freeze avoidance — the set is never 'ready' | Freeze at 160 by rule. Improvements queue for v1.1 *after* the first report; note them in a parking file |

## Independent verification (checkpoint)
Tag + counts + a 10-row random audit across all categories (provenance, subtraction where relevant, temptation notes) — audited by the same standards as Days 22–24, applied to the frozen artefact.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: why does freezing beat continuous improvement for an eval set? Name the comparison that a moving set silently invalidates.
2. Debugging (planted): a held-out row leaks into a tuning decision via a well-meaning summary statistic. Trace how, and state the hygiene rule it breaks.
3. Generative recall: the four adversarial sub-types + the recipe percentages, closed-book.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: rest/review. Monday: Ragas wiring — the frozen set meets the judge. Required first: Ragas docs 'Evaluate and Improve a RAG App' (current API only; pre-0.4 tutorials will not run).
