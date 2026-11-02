# Deep build — long-task endurance run + context report

**Week 3 · Deep build · ~3 hrs** · Month 3 — Agentic Systems + MCP

## Objective
Construct a long-task suite (tasks needing 15+ steps / multiple compactions / at least one gate) and run it end to end, producing the context report: completion rate, compactions per task, fact retention across compactions, cost per success vs Month 2's short-task numbers.

## Why this exists
Short tasks hide context failure. This suite is the honest stress test of everything Week 3 built — and its report is a portfolio-grade artefact ('long-horizon agent reliability' is the field's open problem; your numbers, however small-scale, are real).

## Prerequisites
Week 3 lessons complete; long-task staging uses the issues + docs corpus (multi-part troubleshooting investigations are the natural source).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 3, Lesson 5 (Consolidation — context-engineering mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 2 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 3, Lesson 5 (Consolidation — context-engineering mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Suite design: 8–12 tasks, each with staged checkpoints (facts planted early that must be used late — retention is scored mechanically, not by a judge's impression). Gate tasks run with a scripted approver (approve after delay) so the suite is reproducible; the delay also tests thread expiry settings from Week 1.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Build the long-task suite
`evals/long-tasks-v1.jsonl`: task, planted facts, checkpoint questions, expected artefacts.

**Expected output:** Suite validates; each task names its retention probes.

### Step 2 — Run it
Full suite through the current build; traces + notes preserved per task.

**Expected output:** Run in Postgres tagged `long-tasks-v1`; completion + budget-stop + gate outcomes all present or explained.

### Step 3 — Score retention + reliability
Per task: completed?, compactions, planted-fact retention %, cost. Aggregate: completion rate and cost per success, compared to the 50-task short benchmark.

**Expected output:** Context report table committed; retention scored mechanically from the probes.

### Step 4 — Write the context report
Findings: where long tasks die (taxonomy), what compaction saved, what it lost, next fixes (feeding Month 4).

**Expected output:** Report committed with run ID; top long-task failure class named with a Month 4 owner.

## Independent verification (checkpoint)
The context report exists, its retention numbers come from mechanical probes, and long-task cost-per-success is comparable to (and compared with) the short-task figure.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'How does your agent handle tasks longer than its context window?' — the full mechanism, with one number.
2. Prediction vs reality: which did you expect to kill more long tasks — budget stops, compaction loss, or tool errors? State the actual ranking from the report.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
