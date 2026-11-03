# Day 19 — Rest / review — retrieval consolidation

**Week 3 · Review · 60–90 min** · Month 1 — Production RAG

## Objective
Pass a mixed Week 3 check (retrieval modes, ranker economics, schema, refusal behaviour) — verified by the score sheet plus the Day 17 assertion script re-run green against the deployed API.

## Why this exists
Week 3 built the product; today proves you own the concepts underneath it before CI/CD and evals build on top. Same rule as Day 12: consolidation is scheduled learning, and fragile prerequisites get repaired here, cheaply.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 18):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 16):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 12):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 18's independent verification ("Minimal UI + per-stage tracing") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new concept. The diagnostic twist today is calibration: Week 4 asks you to hand-write 160 reference answers other people (and a judge model) will trust. Your Day 16 hand-scoring consistency is the rehearsal — review where your scores moved under the rubric.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Mixed check (8 items, interleaved, closed-book)
2 retrieval (RRF mechanism, per-category winners) · 2 generation (schema, refusal rule) · 2 platform (ranker pricing, structured-output constraint) · 2 debugging scenarios from the taxonomy classes. Confidence-tagged.

**Expected output:** Score sheet logged; errors classified slip / misconception / gap.

### Step 2 — Re-score 5 answers
Take 5 Day 16 sheets, re-score blind under the rubric. Compare.

**Expected output:** Agreement ≥4/5 with yourself. Lower = the rubric needs a sharper line; sharpen it today, Week 4 depends on it.

### Step 3 — Re-run two checkpoints
Day 17's 15-call assertion script (against production) + Day 14's probe scorer.

**Expected output:** Both green, or the breakage is today's repair job — production drift found on a review day is the system working.

### Step 4 — Evals diagnostic (for Week 4)
Attempt closed-book: faithfulness vs factual correctness — same thing? What does context recall measure that Recall@k doesn't? Wrong answers are data; they set Days 27–28's scaffold.

**Expected output:** Diagnostic recorded unedited.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Production assertion script fails intermittently | Real flakiness (cold starts, quota) vs assertion too strict | Classify 3 failures individually before touching anything; fixed when the failure mode is named, not when the script is loosened |
| Self-scoring agreement low | Rubric ambiguity on 'partial' | Rewrite the partial criteria with two worked examples from your own sheets; fixed at ≥4/5 on a fresh 5 |
| Review feels skippable because 'the product works' | Illusion of competence — the named anti-pattern | The Bastani result in one line: practice performance lied, unaided performance told the truth. Do the check. |

## Independent verification (checkpoint)
Score sheet + re-score agreement + two green checkpoints, logged. The day's output is evidence about you, not about the system — file it that way.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (hardest so far): explain the full /ask path — query → modes → fusion → ranker → context assembly → schema → validation → citation check — in 6 sentences, closed-book.
2. Calibration statement: after 3 weeks, write your honest over/under-confidence direction and one behaviour you'll change for Week 4's golden-set work.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: GitHub Actions CI/CD. Prep: repo secrets inventory (which values are secrets vs config — after Day 4, the honest answer should be 'almost none').
