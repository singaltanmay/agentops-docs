# Field findings loop I — first usage, first fixes

**Week 2 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Run the first structured usage round (real users or simulated task sessions from the brief), harvest failures through the taxonomy, and ship the top fix through the Month 4 gate loop — logging everything in the stakeholder log.

## Why this exists
The FDE loop is deploy → observe → fix → productise. This lesson runs it at full speed once, with the platform doing the measuring and the stakeholder log doing the remembering.

## Prerequisites
Week 1 deep build deployed; acceptance battery green.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 6 (Deep build — deployment v1: the customer environment)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 6 (Deep build — deployment v1: the customer environment)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Usage-round design: 5–8 task sessions drawn from the brief's real user tasks (not your demo questions), observed via traces + a short user debrief per session. Failures enter taxonomy v3+customer categories; fixes ship only through the PR gate (Month 4) — customer pressure is not a reason to bypass the gate, and the log records one instance of *not* bypassing it if pressure arises.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Run the sessions
Execute the task sessions; capture traces + debrief notes per session.

**Expected output:** Session records complete: task, outcome, trace ID, debrief line.

### Step 2 — Harvest + rank failures
Code failures to the taxonomy; rank by (user impact × frequency).

**Expected output:** Ranked list in the stakeholder log with trace links.

### Step 3 — Ship the top fix
Implement → subset → PR gate → merge → nightly/on-demand confirmation, per the Month 4 loop.

**Expected output:** Fix merged with gate evidence; loop timings logged (compare Month 4's rehearsal).

### Step 4 — Report back
Stakeholder log entry in customer language: what we saw, what changed, what's next.

**Expected output:** Entry written; claims match the merged evidence.

## Independent verification (checkpoint)
One full field loop completed with a merged, gate-verified fix and a customer-language report-back.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the field loop's stages and where the gate sits in it (and why it stays).
2. Prediction: the top user-impact failure will be a category the golden set under-weights. Which one — commit before the harvest.
3. Transfer: which finding so far is a *product* change (all customers benefit) vs a *deployment* fix (this customer only)? The distinction is the FDE→product pipeline.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
