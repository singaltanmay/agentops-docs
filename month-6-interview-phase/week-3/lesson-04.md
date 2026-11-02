# Behavioural reps — the hard questions, answered from the bank

**Week 3 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Run behavioural reps on the eight likeliest hard questions (conflict, failure, ambiguity, a decision reversed, a security call, working with a customer, learning something hard fast, why this pivot) — each answered from the story bank in ≤2 minutes, scored for specificity.

## Why this exists
Reps convert the bank from documents into reflexes. Scoring is specificity-first: a number, a named artefact, a decision you owned — generic answers score zero even when they're 'good'.

## Prerequisites
Lessons 1–3 done; story bank audited.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 3, Lesson 3 (FDE drill II — ambiguous brief → shipped plan in 90 minutes)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 3, Lesson 3 (FDE drill II — ambiguous brief → shipped plan in 90 minutes)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Rep protocol: question drawn unseen → 30 seconds to pick the story → answer ≤2 min → score (specificity 0–3, structure 0–2, honesty 0–2 — the honesty point is forfeited by any claim the bank's audit wouldn't support) → one-line fix note. Two questions get a follow-up probe ('how do you know?' / 'what would you do differently?') — the probe is where rehearsed answers usually die; practise surviving it.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Reps 1–4
Four questions under the protocol.

**Expected output:** Scores + fix notes recorded per rep.

### Step 2 — Reps 5–8 with probes
Four more, each with a follow-up probe.

**Expected output:** Probe survival noted per rep (held / wobbled / folded — honestly).

### Step 3 — Repair the weakest answer
Rewrite the weakest story's 60-second version from its fix note; re-deliver it once.

**Expected output:** Repaired version committed to the bank (v-marked).

### Step 4 — Bank freeze
Story bank reaches `bank-v1` for the mock loop; later changes only from mock evidence.

**Expected output:** Freeze tagged.

## Independent verification (checkpoint)
Eight scored reps with probe outcomes exist; the bank is frozen at v1 with at least one evidence-driven repair inside it.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: map the 8 questions to their stories, unaided.
2. Prediction: which probe type ('how do you know?' vs 'differently?') is your weaker one — and which story does it threaten most?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
