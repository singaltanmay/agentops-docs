# Consolidation — Month 2 mixed gate

**Week 4 · Review · 60 min (light)** · Month 2 — RAG Hardening + Agents

## Objective
Pass the Month 2 mixed gate: interleaved assessment across ablations, state layer, loop, tools, budgets, and workflow patterns.

## Why this exists
The gate is the promotion mechanism (HOW-WE-LEARN rule 4): Month 3 builds on all of this, and anything fragile is cheaper to repair now than mid-migration.

## Prerequisites
Weeks 1–4 lessons complete; baseline agent run tagged.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 4, Lesson 4 (Agent eval wiring — success, cost, and failure, per run)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 4, Lesson 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 4, Lesson 4 (Agent eval wiring — success, cost, and failure, per run)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
No new concept. Mixed, unlabelled items only.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (10–12 items)
Closed-book across the month: ablation protocol, the three technique verdicts, Postgres roles, pgvector verdict, loop mechanics, tool contracts, four budget controls, routing rubric, evaluator loop, parallelization rule.

**Expected output:** Score in PROGRESS.md; every miss maps to a KC state change.

### Step 2 — Teach-back rehearsal
5 minutes, recorded or written: 'The Workbench agent architecture as of today' — loop, tools, budgets, router, evals.

**Expected output:** Teach-back artefact exists; gaps in it become repair items, not embarrassments.

### Step 3 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

### Step 4 — Spend check
Month 2 actuals vs ≈$152; Postgres stop/start compliance eyeballed from the bill.

**Expected output:** Variance explained in one line in the retro.

## Independent verification (checkpoint)
Gate + teach-back recorded; Month 3's prerequisite list (LangGraph state design note, baseline run, taxonomy) all confirmed present.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three anonymised traces (RAG miss, agent loop failure, routing error) — classify and name the owning layer for each.
2. Teach-back: the single most decision-relevant number from Month 2, and the decision it drove.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
