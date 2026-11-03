# Deep build — Month 3 gate: full-system review + Month 4 readiness

**Week 4 · Deep build · ~3 hrs** · Month 3 — Agentic Systems + MCP

## Objective
Run the complete Month 3 gate: full agent eval + long-task spot suite + MCP contract checks + weekly report, all on the current build; write the Month 3 retrospective and confirm the Month 4 backlog (from taxonomy v2) as issues.

## Why this exists
The gate converts a month of building into a defensible system state: numbers current, contracts frozen, backlog evidence-based. Month 4 (evals/observability/security) then starts from instruments, not archaeology.

## Prerequisites
All Month 3 weeks complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 4, Lesson 5 (Consolidation — Month 3 mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 4, Lesson 5 (Consolidation — Month 3 mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Gate composition mirrors the month: quality (evals), durability (resume drill), security surface (contract + threat-model draft current), operations (weekly report + spend). Anything red gets an issue and an owner — Month 4's plan absorbs it explicitly.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full eval battery
50-task agent eval + 6 long tasks + MCP abuse-suite re-run on the frozen server.

**Expected output:** All runs tagged `month-3-gate`; deltas vs `langgraph-v1` tabled.

### Step 2 — Weekly report + SLO review
Generate the weekly report; review each SLO: met / missed / mis-set (adjust mis-set SLOs with rationale — that's calibration, not cheating).

**Expected output:** Report committed; SLO changes (if any) justified in one line each.

### Step 3 — Threat-model refresh
Update the Week 2 draft with Month 3's realities (hosted UI, ambient intake, compaction notes as stored content).

**Expected output:** Threat model v1 committed — this is Month 4 Week 4's working document.

### Step 4 — Retrospective + Month 4 issues
Spend vs ≈$165; surprises; taxonomy-v2 top-3 → Month 4 issues (judge calibration, CI gates, red team) with the failure counts attached.

**Expected output:** Retro + issues committed; Month 4 Week 1 prereqs confirmed.

## Independent verification (checkpoint)
Gate battery runs are tagged and tabled; threat model v1 and the evidence-linked Month 4 backlog exist; the month closes with every number current.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Walk me through your agent platform' — 3 minutes: architecture, durability, MCP, context, observability, with at least three numbers.
2. Generative: list Month 4's first three work items in prerequisite order and the evidence that ordered them.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
