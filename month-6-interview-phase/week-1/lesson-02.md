# Write-up 1 — the RAG ablation story, published

**Week 1 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Turn the Month 2 ablation report into the public write-up: 'How I optimised a production RAG system' — every claim traced to a run ID, readable by a hiring manager in 6 minutes.

## Why this exists
The write-ups are interview artefacts, not content marketing: they let a hiring manager verify your claims before the loop, and they give *you* rehearsed, number-true stories. This one carries the RAG chapter.

## Prerequisites
Lesson 1 frame installed; Month 2 ablation report + Month 5 deployment metrics at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 1, Lesson 1 (The system-design frame — quality / latency / cost / evals / security, every time)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 (capstone evidence)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 1, Lesson 1 (The system-design frame — quality / latency / cost / evals / security, every time)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Write-up anatomy (all three share it): the system in one paragraph + diagram; the measurement setup (golden set, protocol — before any results); 3–5 findings, each = question, method, numbers, decision; the honest limitation; what production changed because of it. Numbers rule: no number without its run/protocol provenance; deltas stated with noise floors where Month 4 measured them.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Outline from the report
Map ablation report sections to the anatomy; cut anything that isn't a finding or a decision.

**Expected output:** Outline committed; each finding names its run IDs.

### Step 2 — Draft the findings
Write the 3–5 findings (expect: hybrid vs vector, contextual retrieval verdict, pgvector verdict, top-k/ranker sweep) at hiring-manager altitude — method in 2 sentences, numbers in a table, decision in 1 sentence.

**Expected output:** Draft complete; every table's numbers spot-match their runs (check 3).

### Step 3 — The limitation + production paragraphs
Write the contamination caveat + judge-noise honesty, and what the customer deployment (Month 5) confirmed or complicated.

**Expected output:** Both paragraphs present; limitation is specific, not boilerplate.

### Step 4 — Publish + link
Publish where your portfolio lives (repo README/blog — the venue from the Month 5 packaging); link from the project README.

**Expected output:** Link live; project README's artefact list updated.

## Independent verification (checkpoint)
Write-up 1 is published, internally consistent with the run record, and linked from the project.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: deliver finding #1 as a 60-second spoken answer (write the script; it goes in the story bank, Week 3).
2. Generative: the write-up's five numbers you'd quote from memory in an interview — write them, then verify against the artefact.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
