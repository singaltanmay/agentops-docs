# Deep build — Month 2 gate: ablation report published + agent v1 review

**Week 4 · Deep build · ~3 hrs** · Month 2 — RAG Hardening + Agents

## Objective
Publish the completed ablation report (RAG techniques + pgvector verdict + workflow-pattern measurements), run the full agent eval as the month gate, and write the Month 2 retrospective with the Month 3 backlog.

## Why this exists
Month 2's definition of done is a published evidence chain: every Month 1 technique re-tested, every Month 2 addition measured, and an agent whose quality is a number with a baseline. This is also portfolio piece #1's final form.

## Prerequisites
All Month 2 weeks complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 4, Lesson 5 (Consolidation — Month 2 mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 4, Lesson 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 4, Lesson 5 (Consolidation — Month 2 mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Publishing discipline: the report links run IDs for every number; limitations are a section, not a footnote (judge noise floor, tuning-split size, contamination caveat).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Finish the ablation report
Fold in: reranker/top-k sweep, rewriting, HyDE, contextual retrieval, pgvector verdict, routing saving, evaluator-optimizer verdict, parallelization measurement.

**Expected output:** Report committed; spot-check 3 numbers against run IDs.

### Step 2 — Full agent eval gate run
50 tasks on the final Month 2 agent; compare against the Week 3 baseline run.

**Expected output:** Gate run tagged `month-2-gate`; delta table in the retro.

### Step 3 — Live demo check
From the public UI/API: one RAG question, one routed agent task, one refusal — end to end.

**Expected output:** All three behave per spec; traces visible.

### Step 4 — Retrospective + Month 3 backlog
Spend vs ≈$152, surprises (numbers that changed your mind), backlog as issues: LangGraph migration, MCP server, durable execution, approval gate, context engineering, agent UI.

**Expected output:** Retro + issues committed; Month 3 Week 1 prereqs confirmed.

## Independent verification (checkpoint)
Report + gate run + retro all committed and cross-linked; the Month 3 backlog exists as issues, not intentions.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Tell me about a retrieval system you optimised' — 2 minutes, at least four measured numbers, one honest limitation.
2. Generative: list the Month 3 backlog in prerequisite order and justify the first item.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
