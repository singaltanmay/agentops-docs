# LoRA experiment I — dataset from failure data + the envelope

**Week 3 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Define the LoRA experiment: a narrow task where prompting is measurably weak (from taxonomy/eval evidence — e.g. failure-category classification of traces, or support-intent routing), its dataset built from real artefacts, and the budget envelope + deletion plan written *before* any compute exists.

## Why this exists
The experiment's rules come straight from the plan: fine-tuning is a comparative experiment, not a pilgrimage. The task must be narrow, the dataset must come from your own eval/failure data (or the reserved Bitext support set), and the envelope rule from the resources doc applies in full: name, dollar cap, deletion command — written before creation.

## Prerequisites
Weeks 1–2 deployment frozen; taxonomy v3 + customer categories available as label sources. Budget: the Month 5 LoRA line is a **$40 cap**.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 3 (The head-to-head — multi-agent vs single-agent control)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 3 (The head-to-head — multi-agent vs single-agent control)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Task selection criteria (all must hold): (1) a measured prompting baseline exists and is mediocre; (2) the output is narrow (label/short structured format) so eval is mechanical; (3) ≥300 labelled examples are obtainable from artefacts (trace classifications from Month 4 labelling work are ideal; Bitext's 26.9k support rows are the sanctioned external source for a support-intent variant). **UNVERIFIED:** Azure ML GPU hourly pricing and Foundry fine-tuning prices for your region/model — the research could not verify them from Microsoft's pages; you must price the exact configuration in the Azure Pricing Calculator / Foundry *before* creating anything, and if the priced run can't fit the $40 envelope with margin, the experiment rescopes (smaller model / fewer steps / local run) rather than overrunning.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Pick the task + baseline
From the evidence: name the task, its prompting baseline score (run it if not current), and the eval that will judge both.

**Expected output:** Task card committed: task, baseline number + run ID, eval spec.

### Step 2 — Build the dataset
Assemble train/validation splits from the labelled artefacts (respecting the calibration sets' frozen status — training on calibration items would invalidate Month 4's judges; use *separate* labelled data or newly labelled items).

**Expected output:** Dataset committed with counts, split hashes, and a provenance note per source.

### Step 3 — Price it, in writing
Price the exact training configuration (Foundry fine-tuning or Azure ML GPU) from Microsoft's calculator/pages; record the quote + source + date in the experiment card.

**Expected output:** A priced plan exists that fits $40 with ≥25% margin — or the rescope is written instead.

### Step 4 — Write the envelope card
Resource names, creation commands, the deletion commands, the stop conditions (spend or wall-time), and the verdict rule ('kept only if it beats prompting on the eval by > noise floor').

**Expected output:** Envelope card committed and reviewed against the resources doc's ephemeral-experiment rule.

## Independent verification (checkpoint)
A priced, enveloped, pre-registered experiment exists — or a written rescope — with zero compute created so far.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the three task-selection criteria and how your pick meets each.
2. Prediction: the fine-tune's margin over prompting — commit a number/range now; Lesson 5 grades it.
3. Teach-back: why is training on the calibration set a *validity* failure, not just a data hygiene nit?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
