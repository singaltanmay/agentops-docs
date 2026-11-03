# Live trace-debugging drill — diagnose an agent from its trace

**Week 2 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Run three planted-fault trace diagnoses (from Month 3–5 trace shapes with faults injected: a routing error, a compaction loss, a silent tool-scope failure): given only the trace, find the fault, classify it (taxonomy), and state the fix — timed, scored.

## Why this exists
Debugging-an-agent-trace live is a named exercise in real loops (and the exact skill Shen & Tamkin found AI-assisted engineers weakest at). Your taxonomy is the home-field advantage — the drill proves you can *use* it at speed, on traces you didn't write.

## Prerequisites
Lessons 1–2 done; taxonomy v3 in memory (closed-book drill — the taxonomy is the thing being tested).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 2, Lesson 2 (Coding reps I — production Python under interview conditions)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 2, Lesson 2 (Coding reps I — production Python under interview conditions)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Drill protocol: per trace — 5 min silent read, then narrate: symptom → hypothesis → the trace evidence that discriminates it → fix at the owning layer. Scoring: correct fault (5), correct layer (3), discriminating evidence cited (2). Faults are drawn from the real taxonomy categories so the drill measures transfer, not trivia.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Trace A: routing error
Diagnose per protocol.

**Expected output:** Score recorded with the narration notes.

### Step 2 — Trace B: compaction loss
Diagnose per protocol — the planted fact vanishes at a compaction boundary.

**Expected output:** Score recorded.

### Step 3 — Trace C: silent scope failure
A tool returns a scoped-down result that looks like success. Diagnose.

**Expected output:** Score recorded; this is the hard one — partial credit is expected and logged honestly.

### Step 4 — Write the drill retro
Per trace: your first hypothesis vs the real fault (calibration data), and the trace-reading habit that would have shortened each.

**Expected output:** Retro committed; habits feed Lesson 5's gate.

## Independent verification (checkpoint)
Three scored diagnoses with narration notes exist; your first-hypothesis accuracy is measured, not assumed.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: the drill protocol's narration order, and why evidence comes before fix.
2. Teach-back: teach the trace-reading method (where your eyes go first, second, third) in 4 sentences — this becomes an interview answer about debugging agents.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
