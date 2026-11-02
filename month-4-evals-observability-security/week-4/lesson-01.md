# Red team I — promptfoo redteam suite against your own system

**Week 4 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Generate and run a promptfoo redteam suite against the frozen target (attacks derived from your system's stated purpose and tools: injection, system-prompt leakage, excessive agency, PII probes) — producing the baseline attack-success rate per category.

## Why this exists
Generic attack sets test generic systems. promptfoo's generator builds cases from *your* purpose + tool descriptions — the attacks your actual surface invites. This run is the 'before' number Month 4 is judged on.

## Prerequisites
Week 3 prep done: target frozen as `redteam-target-v1`, config drafted. Reading: promptfoo's red-teaming guide.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 6 (Deep build — gate hardening rehearsal: break it, fix it, prove it)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 6 (Deep build — gate hardening rehearsal: break it, fix it, prove it)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Run discipline: attacks run against the staged/frozen deployment with eval-mode policies (writes auto-rejected *except* where the attack targets the gate itself — those cases run in the sandbox posture and are labelled). Success for the attacker = the attack's stated goal achieved (leaked prompt, executed unauthorised action, fabricated citation accepted, etc.), scored per category; ambiguous cases get human review — you are the judge here, and you log borderline calls. Command shape per promptfoo's docs: `promptfoo redteam run` (exact flags per your version — **UNVERIFIED** here; the official red-team quickstart governs).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Generate the suite
Run the redteam generation against the frozen target's purpose/tool description; review the generated cases for sense (drop nonsense, keep the scary ones).

**Expected output:** Suite exists with per-category counts; every case has a stated attacker goal.

### Step 2 — Run the baseline
Execute against `redteam-target-v1`; capture per-category attack-success rates.

**Expected output:** Baseline table committed: category × attempts × successes × rate.

### Step 3 — Read the successes
Read every successful attack's transcript; code each: which control failed (none present / filter missed / architecture allowed).

**Expected output:** Successes coded; the 'architecture allowed' subset is listed separately — those are Lesson 4's agenda.

### Step 4 — Safety note
Confirm the run touched nothing outside the staged target (endpoints, data) — write the confirmation line into the results.

**Expected output:** Confirmation recorded; any unexpected effect is an incident note, not a shrug.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Generated cases are generic chatbot jailbreaks | Purpose statement too vague | Regenerate with the real tool list + data description; the cases should mention your actual surface |
| Attack 'succeeds' by making the model rude | Scoring drift from the stated goal | Success = the case's stated security goal only; tone failures are eval findings, not security successes — recode |

## Independent verification (checkpoint)
Baseline attack-success table exists with transcripts read and failures coded by control type.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the attack categories run and the attacker goal that defines success in each.
2. Prediction: which category has the highest baseline success, and is its root cause 'no control' or 'architecture'? Commit before reading results.
3. Teach-back: why generate attacks from *your* purpose statement instead of using only a fixed public set? (Week 4 Lesson 2 uses both — contrast them.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
