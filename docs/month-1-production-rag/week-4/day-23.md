# Day 23 — Golden set II — docs batch 2 + multi-hop

**Week 4 · Apply · 75 min** · Month 1 — Production RAG

## Objective
Add ~35 more docs-derived rows including ≥10 multi-hop questions whose answers require two chunks — verified by the validator plus a two-chunk traceability check on every multi-hop row.

## Why this exists
Multi-hop rows are where golden sets earn their keep: they discriminate retrieval depth (did both chunks arrive?) from generation skill (were both used?), a distinction Week 4's metrics need and single-chunk questions cannot make. Cumulative target after today: ~70 rows.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 22):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 20):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 16):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 22's independent verification ("Golden set I — design + first docs-derived batch") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Apply, scaffold fading:** yesterday's schema and validator are fluent; today's new content is one idea — a multi-hop question is only valid if removing *either* chunk makes it unanswerable. Test each candidate with that subtraction check while writing; questions that survive on one chunk are reclassified, not forced.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Write 25 standard rows
Same discipline as Day 22, categories weighted toward yesterday's gaps.

**Expected output:** Running total ~60 docs-derived standard rows, validator green.

### Step 2 — Write ≥10 multi-hop rows
Each cites exactly 2 chunks from different pages/sections; apply the subtraction check to each and record it in notes.

**Expected output:** 10 rows pass subtraction: with either chunk removed, your own reference answer becomes unsupportable — verified by you, in writing, per row.

### Step 3 — Interleave a self-audit
Swap roles: pick 5 of Day 22's rows and attack them — ambiguous? answerable from memory without the chunk? heading-lifted?

**Expected output:** Attack notes logged; rows fixed or cut. Cutting your own rows is instrument quality, not lost work.

### Step 4 — Checkpoint the set
Commit as `golden-wip` with counts by category + split.

**Expected output:** Counts table in the commit message / set README.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Multi-hop rows that are secretly single-hop | Two chunks cited, one sufficient | Subtraction check catches it — reclassify honestly; fixed when every multi-hop row has its subtraction note |
| Batch 2 quality visibly below batch 1 | Fatigue / rushing the quota | Slow down and cut the day's target; a 55-row set you trust beats 70 you don't — the quota is recoverable on Day 25, trust isn't |
| Validator passes rows a human rejects | Schema checks shape, not meaning — as designed | The human audit steps are the meaning layer; if they keep catching the same flaw, promote it into the validator (e.g. heading-phrase overlap check) |

## Independent verification (checkpoint)
Validator green + subtraction notes on all multi-hop rows + audit notes on Day 22's batch. Three different checks, three different failure classes — that's the pattern.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved (unlabelled): Day 8's schema fields · Day 15's RRF sentence · Day 17's refusal rule · today's subtraction check.
2. Transfer: design a multi-hop question whose two chunks live in different *modes'* strengths (one YAML, one prose). Why is that the hardest retrieval case you own?
3. Calibration: predict your Day 22 attack-audit hit rate before running it next time — write the number first.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow (light): mining closed GitHub issues for the troubleshooting batch. Prep: none — the filter criteria get defined in-session.
