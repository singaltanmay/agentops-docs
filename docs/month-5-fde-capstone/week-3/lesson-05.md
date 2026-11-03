# LoRA experiment II — run it, eval it, verdict it

**Week 3 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Execute the experiment inside the envelope: train, evaluate the fine-tuned model vs the prompting baseline on the same eval, write the keep/reject verdict — and delete the compute the same day, whatever the verdict.

## Why this exists
The verdict is the deliverable, and 'reject, with numbers' is a fully successful outcome (the plan says so, and interviewers believe it precisely because most people only report wins). The deletion is part of the experiment's definition of done — an envelope honoured only on good days is not an envelope.

## Prerequisites
Lesson 4 envelope card + priced plan committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 4 (LoRA experiment I — dataset from failure data + the envelope)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 4 (LoRA experiment I — dataset from failure data + the envelope)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Execution discipline: training config frozen in the experiment card before the run; eval runs identical items for both arms; if the fine-tune endpoint/compute must exist for eval, it is created, used, and deleted inside this lesson's window. **UNVERIFIED:** the exact fine-tuning job steps for your chosen path (Foundry vs Azure ML) — the official docs for that path govern the mechanics; this lesson governs the protocol around them.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Train
Run the training job per the priced plan; log wall-time + actual cost against the envelope.

**Expected output:** Training completes (or fails inside the envelope — a failed run within budget is data, recorded as such).

### Step 2 — Evaluate both arms
Same eval items, same scorer: prompting baseline vs fine-tuned.

**Expected output:** Two comparable results with run IDs; delta + noise floor stated.

### Step 3 — Verdict + write-up
Keep (integrate behind the eval, note the new operational burden) or reject (archive the dataset + card as the artefact). Either way, the write-up goes in the deployment report appendix.

**Expected output:** Verdict committed with numbers; if kept, the integration is a scoped follow-up item, not done silently here.

### Step 4 — Delete the compute
Execute the envelope card's deletion commands; verify absence in the resource group + cost view.

**Expected output:** Deletion verified; final experiment spend recorded against the $40 cap.

## Independent verification (checkpoint)
A verdict backed by same-eval numbers exists, and the resource group provably contains no experiment compute afterwards.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Tell me about your fine-tuning experiment' — task, data, baseline, result, verdict, cost. 90 seconds.
2. Generative: state the envelope's final accounting (cap, spent, margin) and the verdict rule that fired.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
