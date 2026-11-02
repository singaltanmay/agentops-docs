# Mock loop I — system design + project deep-dive

**Week 4 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Run mock loop I: a 45-minute system design (fresh archetype variant) + a 30-minute deep-dive grilling on the Workbench (architecture choices, numbers, failures) — scored as a loop, with a written gap list.

## Why this exists
Mocks are the mixed assessments of Month 6 (HOW-WE-LEARN rule 4 at career scale): unaided, mixed, scored against rubrics — and the gap list, not the score, is the product. Deep-dive rule: every answer must survive two levels of 'why' + one 'how do you know'.

## Prerequisites
Weeks 1–3 complete; frame frozen; bank at v1; demo env verified (Week 2 deep build). Conduct: instructor/peer as interviewer if available, else self-run with recorded artefacts and rubric scoring — marked `self-mock` honestly.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 3, Lesson 6 (Deep build — the full FDE exercise: discovery → plan → pitch, end to end)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 3, Lesson 6 (Deep build — the full FDE exercise: discovery → plan → pitch, end to end)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Gap-list discipline: each gap = (question, your answer's failure mode, the artefact that fixes it, the repair rep). Gaps are classified by the course taxonomy's spirit: knowledge gap / evidence gap (you know it, couldn't cite it) / delivery gap (evidence existed, answer rambled). The classes have different repairs — don't let one list blur them.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Design segment (45 min)
Fresh variant (e.g. support agent *with* a tool-using twist, or doc-QA with a freshness constraint). Frame card allowed.

**Expected output:** Artefact + rubric score recorded.

### Step 2 — Deep-dive segment (30 min)
Interviewer picks 3 Workbench decisions to grill (expect: AI Search vs pgvector, judge calibration honesty, trifecta fix).

**Expected output:** Q&A record; every 'how do you know' answered from an artefact or logged as an evidence gap.

### Step 3 — Gap list v1
Classify + repair-assign every gap from both segments.

**Expected output:** Gap list committed; top 3 repairs scheduled into Lessons 3–4.

### Step 4 — Interviewer debrief note
If a human/peer ran it: their 3-line impression, recorded verbatim. If self-mock: your 3-line self-impression, labelled as such.

**Expected output:** Debrief recorded with its provenance label.

## Independent verification (checkpoint)
Mock loop I is scored with a classified gap list whose top repairs are scheduled — not just noted.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: your top 3 gaps + their classes + their repairs, unaided — then check the list.
2. Prediction: in loop II, which gap class will shrink least? (Delivery gaps are usually the stubborn ones — commit your answer.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
