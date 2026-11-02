# Deep build — two full designs back-to-back (eval platform + doc-QA at scale)

**Week 1 · Deep build · ~3 hrs** · Month 6 — Interview Phase

## Objective
Run the two remaining archetype designs at full length back-to-back (design an eval platform; design doc-QA at 100× your Workbench's scale), scored, with a written cross-design retrospective.

## Why this exists
Stamina and transfer: the eval-platform design tests whether your Month 4 platform generalises (it should — you built one), and scale doc-QA tests which of your design choices were scale accidents vs scale truths.

## Prerequisites
Week 1 lessons complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 1, Lesson 5 (Consolidation — design-drill mixed gate + frame card freeze)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 (capstone evidence)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 1, Lesson 5 (Consolidation — design-drill mixed gate + frame card freeze)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Cross-design discipline: after both, the retrospective answers one question per design — 'which Workbench decision did I reuse, and did it survive the new constraints?' Reuse is good (it's your experience); unexamined reuse is the failure mode (100× scale kills several Month 1–5 choices — name them before the interviewer does).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Full design #3: eval platform (45 min)
Design the eval/observability platform for a company with 40 LLM features: suites, judges, gates, online sampling, cost governance.

**Expected output:** Artefact + score sheet; your Month 4 platform appears as experience, generalised (not copied).

### Step 2 — Full design #4: doc-QA at scale (45 min)
Doc-QA over 50M documents, multi-tenant, with permission trimming and a p95 latency SLO.

**Expected output:** Artefact + score sheet; scale-driven changes to your Month 1 design are listed explicitly.

### Step 3 — Cross-design retrospective
One page: reused decisions + verdicts (survived / scale-killed), per design.

**Expected output:** Retro committed; at least two scale-killed choices named (there are always two).

### Step 4 — Update the story bank seeds
Add the two strongest design moments (a trade-off you defended well) as story seeds for Week 3.

**Expected output:** Seeds recorded with their numbers.

## Independent verification (checkpoint)
Four full scored designs now exist (one per archetype); the retrospective names which of your real decisions scale and which don't.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: 'Which of your Workbench choices would you *not* repeat at 100× scale?' — the interview answer, scripted.
2. Generative: the four archetypes + the heaviest lens for each, unaided.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
