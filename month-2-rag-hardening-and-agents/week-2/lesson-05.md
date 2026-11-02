# Consolidation — state-layer mixed gate + LangGraph state design prep

**Week 2 · Review · 60 min (light)** · Month 2 — RAG Hardening + Agents

## Objective
Pass the Week 2 mixed gate and produce the agent state schema design (what LangGraph will checkpoint in Month 3) as a written design note — no agent code yet.

## Why this exists
Week 3 builds a raw loop; Month 3 rebuilds it in LangGraph with durable state. Designing the state shape now — from this week's schema work — prevents the Month 3 rewrite from becoming a redesign.

## Prerequisites
Lessons 1–4 done; pgvector mirror loaded.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 2, Lesson 4 (pgvector on the same instance — corpus copy indexed)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 2, Lesson 4 (pgvector on the same instance — corpus copy indexed)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Agent state design questions: what must survive a crash (conversation, tool results, step count, approvals), what is derivable (recompute instead of storing), what is sensitive (never checkpoint secrets/PII raw). The design note answers these against your actual Postgres schema.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Weeks 1–2: ablation protocol, rewriting/HyDE/contextual verdicts, B1ms budget facts, schema design, eval tables, pgvector's role.

**Expected output:** Score in PROGRESS.md; fragile KCs get repair items.

### Step 2 — Write the state design note
One page: state fields table (name, type, survives-crash?, source), mapped to Postgres tables where they persist.

**Expected output:** Note committed; every 'survives-crash = yes' field names its table/column.

### Step 3 — Pay down one debt item
Oldest debt-log item, repaired with evidence.

**Expected output:** Debt log shrinks by one.

### Step 4 — Spend check
Cost review vs the Month 2 column; Postgres has now billed ~2 weeks — compare actual vs the $17 estimate and note the storage rate you confirmed.

**Expected output:** Actual storage $/GB-mo recorded in the project README (replacing the UNVERIFIED estimate).

## Independent verification (checkpoint)
Gate recorded; state design note committed with persistence mapping; the Postgres storage rate is now a measured number in the README.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Transfer: Week 3's raw loop keeps state in memory. Which three fields from your design note will hurt most when the process dies mid-task? Rank them.
2. Teach-back: 'Why is Postgres in this architecture at all, if AI Search holds the vectors?' — answer with the four state categories it holds.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
