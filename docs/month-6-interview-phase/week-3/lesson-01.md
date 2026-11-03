# The story bank — P1–P4 as STAR stories with numbers

**Week 3 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Convert the five months into a story bank: 8–10 STAR stories (Situation, Task, Action, Result), each anchored to a measured result and an artefact — covering build depth, a failure, a trade-off, a security call, and the deployment.

## Why this exists
Behavioural rounds are evidence rounds in disguise: 'tell me about a hard problem' is scored on specificity. Stories built from the retrospective + evidence packs are specific by construction — this lesson is assembly, not invention.

## Prerequisites
Week 2 gate passed; Month 5 retrospective (judgement section) + evidence packs at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 2, Lesson 6 (Deep build — the full timed coding set + demo environment check)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 2, Lesson 6 (Deep build — the full timed coding set + demo environment check)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Story rules: every Result carries a number + its artefact; every story names the decision *you* made (not the team's, not the tutorial's); each story is written at two lengths (60-second and 3-minute) — the 60-second version is the interview default, the 3-minute is for deep-dives. Mandatory coverage: the biggest measured win, the honest failure (Month 1 taxonomy's top class or the LoRA verdict if rejected), a trade-off reversed (from the retro's three reversals), the security call (trifecta fix), the customer moment (requirement change).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Draft the story list
Map the mandatory coverage + 3–5 flex stories (multi-agent verdict, judge calibration surprise, gate drill) to source artefacts.

**Expected output:** List committed; every story names its source artefact + headline number.

### Step 2 — Write the 60-second versions
All stories at 60-second length (130–150 words spoken).

**Expected output:** Drafts complete; read-aloud timing spot-checked on 3.

### Step 3 — Write 3-minute versions for the top 4
The four likeliest deep-dives (win, failure, deployment, security) at full length.

**Expected output:** Drafts complete; each ends with the 'what I'd do differently' line where honest.

### Step 4 — Numbers audit
Every number in the bank checked against its artefact (the Month 4/5 cross-check discipline, applied to stories).

**Expected output:** Audit done; any number that can't be traced is cut or corrected — no exceptions.

## Independent verification (checkpoint)
A numbers-audited story bank exists at two lengths per story, with mandatory coverage complete.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the bank's stories with their headline numbers, unaided (approximately) — then spot-check two.
2. Teach-back: deliver the failure story's 60-second version as written. Does it end on the fix + the instrument that now catches it?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
