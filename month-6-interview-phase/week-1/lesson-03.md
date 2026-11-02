# Timed design #2 — the research agent (multi-source, citations, cost honesty)

**Week 1 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Run the second timed design on the research-agent archetype, with the drill scored against the frame rubric + one added lens-check: where multi-agent earns its cost, argued from your Month 5 head-to-head.

## Why this exists
Research agent is the second canonical archetype (and Anthropic's multi-agent showcase). Your unfair advantage: you've *measured* single vs multi on your own system — the drill converts that into interview behaviour.

## Prerequisites
Lessons 1–2 done; Month 5 multi-agent verdict at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 1, Lesson 2 (Write-up 1 — the RAG ablation story, published)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 (capstone evidence)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 1, Lesson 2 (Write-up 1 — the RAG ablation story, published)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Archetype traps to avoid in the room: proposing multi-agent by default (your data says where it loses); quoting Anthropic's +90% without its ~15× token cost; forgetting the eval design for open-ended research answers (your Month 4 answer: rubric judges, calibrated, with mechanical citation checks underneath).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Timed design #2 (45 min)
Design a research agent over mixed sources (web + internal docs) with cited, auditable output. Unaided; frame card allowed.

**Expected output:** Artefact + timing logged.

### Step 2 — Score + compare to design #1
Same rubric; note whether the Week 1 weak lenses improved.

**Expected output:** Score sheet #2 filled; lens trend recorded (two data points now).

### Step 3 — The multi-agent minute
Write the 60-second spoken segment: when your design goes multi-agent, when it refuses to, citing your head-to-head numbers.

**Expected output:** Segment scripted into the story bank.

### Step 4 — Patch the frame card
v3: add the research-archetype clarification questions (source trust, freshness, citation standard) that this drill exposed.

**Expected output:** Card v3 committed.

## Independent verification (checkpoint)
Design #2 scored with a visible trend vs #1; the multi-agent minute exists as a rehearsed, number-true script.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state your head-to-head's per-category verdicts (approximately) unaided — then check.
2. Prediction: an interviewer counters 'multi-agent is just cost'. Your two-sentence rebuttal, from your data only.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
