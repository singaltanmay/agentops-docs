# Compaction + structured note-taking

**Week 3 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Implement context compaction (summarise old history into a structured note state — facts, decisions, open threads — when the budget threshold hits) — verified by a long task completing post-compaction with its key facts intact, checked by staged probes.

## Why this exists
Compaction is how long tasks survive their own history. Done naively (free-text summary) it silently drops exactly the facts the task needs; done as structured note-taking, it becomes the agent's external memory.

## Prerequisites
Lesson 1 metering live; budget ceiling firing on long tasks.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 3, Lesson 1 (Context budgets — what the model sees, metered)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 2 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 3, Lesson 1 (Context budgets — what the model sees, metered)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Design: at ~70% of the context ceiling, compact: replace raw history with a **note object** (schema: `facts[]`, `decisions[]`, `open_threads[]`, `artefacts[]` — each entry sourced to a step). The note lives in graph state (checkpointed, Lesson 3 of Week 1). Raw history stays in Postgres/traces for audit — compaction changes what the *model sees*, not what the *system remembers*.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define the note schema
Note object as a typed state field with the four sections above; empty at task start.

**Expected output:** Schema in code; state round-trips through the checkpointer with a populated note.

### Step 2 — Implement the compaction node
When projected context > threshold: summarise history-so-far into the note (judge model not required; generator model + strict schema), swap history for the note, log a `compaction` trace event with before/after token counts.

**Expected output:** Staged long task shows a compaction event; context drops below threshold; task continues.

### Step 3 — Fact-retention probes
Stage a task with 5 planted facts early (versions, names, a chosen option); after forced compaction, probe each fact via the agent's answers.

**Expected output:** ≥4/5 facts correctly used post-compaction; any lost fact is taxonomy-coded (`compaction loss`) with the note entry inspected.

### Step 4 — Tune the threshold once
If retention is perfect and compaction fires constantly, raise the threshold one step; if facts were lost, lower it. Record the final value + evidence.

**Expected output:** Threshold + evidence committed to config + log.

## Independent verification (checkpoint)
A long task completes across a compaction with ≥4/5 planted facts retained; the compaction event is a first-class trace citizen.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the note schema's four sections and the rule distinguishing system memory from model-visible context.
2. Planted-bug: compaction summarises a *tool error* as a fact ('the deployment uses X' — actually the tool had failed and X was the error text). Which design element prevents this class?
3. Transfer: Month 5's multi-agent design gives sub-agents isolated contexts. What do they exchange at the boundary — raw history, notes, or answers? Argue from today's evidence.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
