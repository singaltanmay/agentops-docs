# The runbook — operate the Workbench without you

**Week 4 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Write the operations runbook: architecture map, SLOs + where they're read, the ten operator procedures (deploy, rollback, budget incident, judge drift, gate failure, credential rotation, corpus refresh, customer onboarding) each with commands and expected outputs.

## Why this exists
A system only its author can operate is a demo with uptime. The runbook is the platform artefact that converts your tacit knowledge into procedures — and writing it exposes every place the system still depends on your memory.

## Prerequisites
Lessons 1–2 done (drill results feed the procedures).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 4, Lesson 2 (Hardening II — failure drills: kill things on purpose)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 4, Lesson 2 (Hardening II — failure drills: kill things on purpose)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Procedure standard (Month 1's lesson shape, applied to ops): each procedure = trigger, steps with exact commands, expected output per step, failure branch, and the evidence it leaves. Two procedures get *executed* cold as the verification (budget incident + credential rotation — the two with security flavour). Anything you cannot write a procedure for is a system gap: log it as such rather than writing fiction.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Draft the ten procedures
From the drills, gates, and lessons: assemble the runbook in the project repo (`ops/runbook.md`).

**Expected output:** All ten drafted; each cites its source lesson/drill.

### Step 2 — Cold-execute two
Budget-incident + credential-rotation procedures, executed from the document alone (no memory assists — mark every place you had to improvise).

**Expected output:** Both complete; improvisation points are document bugs, fixed on the spot.

### Step 3 — Gap list
Procedures that couldn't be written honestly become the gap list with owners (Month 6 polish or accepted-risk notes).

**Expected output:** Gap list committed; accepted risks are named as accepted, not hidden.

### Step 4 — Link from the deployment report
Report gains the operations section pointing at the runbook + drill report.

**Expected output:** Links resolve; the report's ops claims match the runbook's contents.

## Independent verification (checkpoint)
A runbook whose two hardest procedures were cold-executed from the document alone, plus an honest gap list.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the ten procedures and the trigger for each.
2. Prediction: which procedure will rot first as the system changes, and what in the weekly routine would catch the rot?
3. Teach-back: 'How is this operated?' — answer as if handing over to another engineer, in 5 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
