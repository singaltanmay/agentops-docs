# Day 11 — Ingestion II — integrated vectorization, head-to-head

**Week 2 · Long build · 2–3 hrs** · Month 1 — Production RAG

## Objective
Build the AI Search integrated-vectorization path (indexer + SplitSkill + AzureOpenAIEmbeddingSkill over Blob) and write the head-to-head debuggability verdict — verified by the indexer completing with 0 unexplained errors and its chunk counts reconciled against your parser's.

## Why this exists
Production teams inherit both patterns; the skill is choosing with evidence. The research directive is explicit: build ingestion both ways in Month 1 and measure which you can debug better. Today the platform shows its strengths (declarative, scheduled, no code) and its weakness (errors surface as indexer warnings, not stack traces).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 10):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 8):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 4):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 10's independent verification ("The probe set — 30 questions with known answers") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Worked example → independent:** follow Microsoft Learn's integrated-vectorization tutorial shape once (parallel, on a 20-page subset) — skillset with SplitSkill + embedding skill + index projections. Then build the full-corpus version unaided. Watch for the moment the tutorial's defaults (chunk size, overlap) differ from your Day 10 winner: the platform must be bent to your measured config, not the reverse.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Move AI Search Free → Basic
Change the Bicep SKU parameter to `basic` and redeploy. Confirm the tier in the portal and note the prorated cost start in the README. From here the $73.73/mo meter is running — the month's dominant fixed cost, accepted deliberately.

**Expected output:** Tier shows Basic; README cost log notes the switch date.

### Step 2 — Build the skillset path on a subset
Data source = Blob corpus container; skillset = SplitSkill (your winning size) → AzureOpenAIEmbeddingSkill (your Day 2 deployment, keyless where supported); index projections into the same index schema. Run on 20 pages.

**Expected output:** Indexer run: succeeded, 20 pages, errors = 0. Projected chunk count for the subset roughly matches your parser's for the same pages (boundary differences explained, not ignored).

### Step 3 — Run the full corpus
Full indexer run, timed. Capture warnings verbatim into the experiment file.

**Expected output:** Run completes; document count reconciles with Day 6 manifest ± explained deltas; warnings all classified (real problem vs noise).

### Step 4 — Write the verdict
One page: your pipeline vs platform — debuggability (time to answer 'why is this chunk wrong?' in each), control, ops burden, cost shape. Pick the primary for Week 3 and name the condition that would flip the choice.

**Expected output:** Verdict committed. Week 3 builds on the winner; the loser stays runnable — it's your fallback and your interview story.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Indexer succeeds with warnings you can't interpret | Platform opacity — the known weakness, arriving as predicted | Drill one warning to ground truth (which document, which skill); fixed when every warning class has a one-line plain-language translation in your notes |
| Skillset chunks ignore your size config | SplitSkill parameters set in the wrong unit (characters vs tokens is the classic) | Re-check the skill's parameter docs on Microsoft Learn; fixed when a known page's chunks match the intended geometry |
| Basic tier redeploy changes the service URL/keys story | Tier change treated as a new service by your config | Confirm endpoint + identity assignments post-upgrade; fixed when Day 9's smoke tests pass unchanged against Basic |

## Independent verification (checkpoint)
Two independent ingestion paths now produce reconciled counts for the same corpus. The verification is the reconciliation itself, printed in the experiment file — plus the verdict page existing in the repo.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: explain index projections to an imaginary backend colleague — what problem do they solve that a flat indexer doesn't?
2. Debugging probe: a page is missing from the platform index but present in yours. Give your ordered search for the cause in the platform path (data source? skill error? projection? filter?) — order and reasoning, closed-book.
3. Prediction: which path will you curse during Week 3's retrieval debugging, and why? Write it down.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: rest or review. Monday: the embedding A/B (3-small vs 3-large on one config) folded into the chunking decision, then Week 2's gate.
