# The customer brief — scope, constraints, success criteria

**Week 1 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Stand up the capstone as a real engagement: a written brief naming the customer (a real user if findable — OSS maintainer, local business, campus lab — else a rigorous simulated enterprise), their corpus, their users, and measurable success criteria — agreed before any building.

## Why this exists
FDE work starts from an ambiguous brief, not a spec. The discipline of converting ambiguity into written, measurable criteria — with the constraints inherited from Month 4 (SLOs, security posture, cost envelope) — is the skill this month certifies.

## Prerequisites
Month 4 gate passed; Month 4 retrospective's constraints note at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Deep Build — Month 4 gate):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Deep Build — Month 4 gate) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Brief anatomy: problem statement in the customer's words; corpus + data sensitivity; user population + access model; success metrics with target values (task outcome, eval scores, cost per outcome — measured with Month 4's instruments); non-goals (explicit); decision log + stakeholder log locations. Simulated-customer rule: the simulation must include *friction* — messy data, a permission boundary, one mid-month requirement change (scheduled now, sprung in Week 2) — or it teaches nothing an internal project wouldn't.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Choose the customer track
Real if a real user commits to 2 feedback sessions; else simulated with the friction rules above. Record the choice + rationale.

**Expected output:** Track recorded in the brief; a simulated track names its friction events explicitly.

### Step 2 — Draft the brief
One document in the repo (`capstone/brief.md`) covering the anatomy above; success metrics reference Month 4 instruments by name.

**Expected output:** Brief committed; every metric names its measuring instrument.

### Step 3 — Constraints import
Copy Month 4's inherited constraints (SLOs, security posture incl. trifecta rules, ≈$187 month envelope with the LoRA carve-out) into the brief as binding.

**Expected output:** Constraints section present verbatim-ish; any relaxation is a written decision with a reason.

### Step 4 — Kickoff the stakeholder log
Create `capstone/stakeholder-log.md`: dated entries for every customer interaction/decision (real or simulated).

**Expected output:** Log exists with the kickoff entry; the Week 2 requirement-change event is scheduled in your private notes (not in the log — it must arrive as a surprise to practice on).

## Independent verification (checkpoint)
A committed brief with measurable criteria, imported constraints, and a live stakeholder log; the customer track is chosen and defended in writing.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the brief's success metrics and the instrument that measures each.
2. Prediction: which brief element will the Week 2 requirement change most likely stress — corpus, permissions, or metrics? Commit now.
3. Teach-back: how does an FDE brief differ from the internal roadmap you've been working from? Name the two structural differences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
