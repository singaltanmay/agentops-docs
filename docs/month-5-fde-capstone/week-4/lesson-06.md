# Deep build — Month 5 gate: the whole system, reviewed as a product

**Week 4 · Deep build · ~3 hrs** · Month 5 — FDE Capstone

## Objective
Run the Month 5 gate: full regression across all suites on the final build, the deployment report finalised (v3 = v2 + hardening + ops), and the Month 5 retrospective — including the honest 'what would I do differently' section that Month 6 interviews will draw on.

## Why this exists
Five months, one system. The gate is a product review, not a test run: quality, security, cost, operability, and the deployment story, all current on the same build, with the retrospective written while the evidence is undeniable.

## Prerequisites
All Month 5 weeks complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 4, Lesson 5 (Consolidation — capstone mixed gate (extensions + ops))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 4, Lesson 5 (Consolidation — capstone mixed gate (extensions + ops))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Retrospective standard (set in Month 1, kept): spend vs budget, surprises (numbers that changed your mind), and — new at this altitude — *judgement review*: the three decisions you'd reverse and the one you'd defend hardest, each tied to its evidence. This section is Month 6 raw material; write it like it.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full battery
All suites + leakage + redteam spot + long-task spot on the final build; weekly report generated.

**Expected output:** Runs tagged `month-5-gate`; the SLO table is fully current.

### Step 2 — Finalise the deployment report (v3)
Add hardening + ops sections; freeze the outcome table; the report now covers brief → outcome → extensions → operations.

**Expected output:** v3 tagged; every number cross-checked against the evidence pack.

### Step 3 — Judgement retrospective
Write the retrospective incl. the three reversals + one defence, each evidence-linked.

**Expected output:** Retro committed; Month 6's story bank (next month, Week 3) has its source list.

### Step 4 — Month 6 readiness
Confirm the portfolio inputs exist: 3 write-up sources (RAG ablations, evals/calibration, red team), demo-able system, runbook, reports.

**Expected output:** Readiness checklist committed; gaps become Month 6 Week 1 items, explicitly.

## Independent verification (checkpoint)
Month 5 closes with a final, current, cross-checked evidence base and a retrospective that Month 6 can build stories on without re-deriving anything.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (the big rehearsal): 'Walk me through the last five months as one system' — 4 minutes, phases as chapters, a number per chapter, ending with the judgement you'd reverse.
2. Generative: list Month 6's inputs and the one gap you're carrying into it deliberately.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
