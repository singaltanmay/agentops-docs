# Write-up 2 — the evals + judge-calibration story, published

**Week 1 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Publish write-up 2: 'Evals that mean something: failure taxonomies, calibrated judges, and CI gates' — built from the Month 4 calibration table, bias annex, and gate drill record.

## Why this exists
This is the wedge artefact — the one that matches the market gap (everyone demos agents; almost nobody can show a calibrated judge + a gate that blocked a real regression). It should read like a methods paper for practitioners.

## Prerequisites
Lesson 2's write-up as the format reference; Month 4 evidence pack open.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 1, Lesson 3 (Timed design #2 — the research agent (multi-source, citations, cost honesty))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 (capstone evidence)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 1, Lesson 3 (Timed design #2 — the research agent (multi-source, citations, cost honesty))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Anatomy applied: the failure-analysis method first (taxonomy from 100 read traces — the credibility anchor), then judges (binary, per-category, your labels, TPR/TNR table), the bias annex (three probes, three numbers — include them; they're the part nobody else publishes), the policy (bands), and the gate (with the sabotage drill as the worked example).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Outline from the evidence pack
Map Month 4 artefacts to the anatomy; the calibration table and drill record are the centrepieces.

**Expected output:** Outline committed with artefact links.

### Step 2 — Draft the methods + calibration sections
Failure analysis → judges → calibration loop → bias probes; tables for TPR/TNR and the bias numbers.

**Expected output:** Draft sections complete; numbers spot-checked against the pack (3 checks).

### Step 3 — Draft the gate story
The regression gate design (baseline comparison, bands) + the sabotage drill narrated with its evidence.

**Expected output:** Section complete; the drill's named metrics match the gate record.

### Step 4 — Publish + link
Publish; link from the project README's artefact list.

**Expected output:** Link live; README updated.

## Independent verification (checkpoint)
Write-up 2 published with calibration and bias numbers intact — the full honest version, not the highlight reel.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: the 90-second version — taxonomy → judges → calibration → gate — scripted for the story bank.
2. Generative: your three bias-probe numbers, unaided (approximately), then verified.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
