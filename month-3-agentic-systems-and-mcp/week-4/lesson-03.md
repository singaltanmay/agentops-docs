# Failure analysis II — agent traces at volume

**Week 4 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Apply the Hamel method to the agent: read 30+ recent traces (from the long-task suite + benchmarks), open-code, and update the failure taxonomy to v2 with counts and owners — the Month 4 eval backlog falls out of this table.

## Why this exists
Month 1's taxonomy covered RAG. The agent's failure surface is bigger (routing, tools, budgets, compaction, gates) and Month 4's eval/judge work must target *counted* failures, not imagined ones.

## Prerequisites
Taxonomy v1 (Month 2) + all Month 3 traces available.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 4, Lesson 2 (Cost/latency routing across the whole system + SLOs)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 4, Lesson 2 (Cost/latency routing across the whole system + SLOs)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Method (unchanged since Month 1, applied bigger): read traces yourself, open-code in a scratch pass, group, count, and for each category name the owning layer + the eval that would catch a regression. Sampling rule: all failures + a random slice of successes (successes hide near-misses — budget stops that 'worked' are failures wearing a costume).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Sample and read
Pull all failed runs + 10 successes from the long-task + benchmark runs; read every trace end to end.

**Expected output:** Reading log lists trace IDs read (target ≥30); scratch codes recorded.

### Step 2 — Taxonomy v2
Merge new categories (compaction loss, gate friction, MCP faults, routing-at-scale) into the taxonomy doc with counts.

**Expected output:** Taxonomy v2 committed; every category has count + example trace + owning layer.

### Step 3 — Rank the Month 4 backlog
Order categories by (count × severity); the top 3 become Month 4's named eval/judge targets.

**Expected output:** Backlog list committed and linked from the taxonomy.

### Step 4 — Sanity: interleave with Month 1
Check overlap: which RAG-era categories still appear inside agent traces? Mark the shared ones.

**Expected output:** Shared categories marked — Month 4's judge rubric inherits both taxonomies' language.

## Independent verification (checkpoint)
Taxonomy v2 with counts exists; Month 4's top-3 eval targets are named from evidence; the reading log proves the sample was actually read.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list taxonomy v2's top 5 categories with counts (approximately, from memory) and their owning layers.
2. Prediction: which category will Month 4's judge be *worst* at detecting, and why? (Calibration foreshadowing.)
3. Teach-back: the difference between a failure taxonomy and an error log — why does only one of them set an eval backlog?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
