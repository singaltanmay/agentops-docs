# The requirement change — absorb it like an FDE

**Week 2 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Absorb the brief's scheduled mid-engagement requirement change (new user group, new corpus section, or a new task type — per the Week 1 private note): scope it, re-plan against the instruments, and deliver the smallest version that satisfies it — with the trade-offs written for the stakeholder.

## Why this exists
Requirements change mid-deployment in every real engagement. The graded skill is the response shape: impact analysis from the instruments (what breaks, what it costs, what slips), not reflexive building or reflexive refusal.

## Prerequisites
Lesson 1 loop done. (Instructor: spring the Week 1-scheduled change now if not already sprung.)

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 1 (Field findings loop I — first usage, first fixes)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 1 (Field findings loop I — first usage, first fixes)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Response protocol: (1) restate the change in measurable terms; (2) impact analysis — corpus/access/evals/SLO/cost deltas, each from the relevant instrument; (3) options with costs (full / minimal / defer), recommendation included; (4) stakeholder decision logged; (5) build the chosen scope through the normal loop. The golden set grows a slice for the new requirement *before* the feature ships (Month 1 rule, again).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Restate + impact analysis
Written impact note: five delta areas quantified or explicitly unknown.

**Expected output:** Note committed; unknowns are named as unknowns with the probe that would resolve them.

### Step 2 — Options + decision
Present options (in the log for simulated; live for real); record the decision + rationale.

**Expected output:** Decision entry exists with the rejected options' costs preserved.

### Step 3 — Extend the golden set first
New slice for the requirement (10–20 items) added to the customer suite; baseline the *unbuilt* state (expect failures — that's the point).

**Expected output:** Slice committed; pre-build run shows the gap honestly.

### Step 4 — Build the chosen scope
Smallest satisfying version through the gate loop.

**Expected output:** Post-build run shows the slice's improvement; stakeholder log updated with what shipped vs deferred.

## Independent verification (checkpoint)
The change is absorbed with a written impact analysis, a logged decision, evals-first delivery, and no silent scope growth.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the response protocol's five steps and the evals-first rule within it.
2. Prediction vs reality: compare with your Week 1 Lesson 1 prediction about which brief element would be stressed. Score yourself honestly.
3. Teach-back: 'The customer asked for X mid-deployment' — narrate your response as an interview story, with the numbers.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
