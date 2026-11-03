# Context budgets — what the model sees, metered

**Week 3 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Instrument and enforce context budgets in the agent: per-section token accounting (system / history / tool results / retrieved chunks) with hard caps — verified by a long-task trace showing section sizes and a cap firing on an oversized tool result.

## Why this exists
Context engineering is a named posting requirement and the agent-quality lever nobody demos. You can't engineer what you don't meter: this lesson makes context a measured, budgeted resource like tokens-per-task already are.

## Prerequisites
Weeks 1–2 done; traces flowing.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 6 (Deep build — MCP server hardening pass + contract freeze)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 2 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 6 (Deep build — MCP server hardening pass + contract freeze)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
The context window is a budget, not a bucket. Sections compete: history grows, tool results balloon, retrieved chunks crowd out the question. Today's discipline: measure each section per step; cap tool results (truncate with a marker + a 'fetch more' path via search), cap history (Lesson 2), and keep the stable system prefix first (prompt caching: cached input is half price — architecture follows pricing, as established in Month 1).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Section accounting
Extend traces: per step, token counts per context section (estimate with the model's tokenizer for the pinned SDK — **UNVERIFIED:** the exact counting helper for your stack; a consistent estimator matters more than a perfect one).

**Expected output:** Trace shows 4 section counts per step on a staged task.

### Step 2 — Tool-result caps
Tool results over the cap are truncated with an explicit marker + chunk IDs retained so the agent can re-fetch precisely.

**Expected output:** A staged oversized result is capped; the agent's follow-up re-fetch of a named chunk succeeds.

### Step 3 — Context budget config
Per-task context ceiling in config; breaching it triggers Lesson 2's compaction (today: a hard stop with a budget note, so the need is measured).

**Expected output:** A long staged task hits the ceiling and stops gracefully; the trace shows which section ate the budget.

### Step 4 — Report the distribution
Query the week's traces: median/p95 section shares across tasks.

**Expected output:** Distribution noted in the log — this decides Lesson 2's compaction targets.

## Independent verification (checkpoint)
Section-metered traces exist; caps demonstrably fire; the section-share distribution is recorded and motivates the compaction design.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: name the four context sections and the cap mechanism for the two that grow unboundedly.
2. Prediction: which section dominates p95 context on troubleshooting tasks, and why? Check against your distribution after answering.
3. Teach-back: 'Lost in the middle' — what does it imply for where the question and the freshest tool result should sit in the prompt?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
