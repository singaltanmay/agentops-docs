# Coding reps I — production Python under interview conditions

**Week 2 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Run timed production-Python reps (not puzzle DSA): streaming response handling, retry-with-backoff + idempotency, paginated API ingestion, and a token-budget middleware — each as a 15-minute unaided implementation with tests.

## Why this exists
AI-engineer coding screens test the Python you'll actually write (LLM plumbing, data wrangling, failure handling) more than whiteboard exotica. Reps target fluency: correct, idiomatic, edge-aware, *fast enough to leave time to talk*.

## Prerequisites
Week 1 gate passed. Reps are closed-book except language/stdlib docs.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 2, Lesson 1 (Write-up 3 — the red-team story, published + portfolio index)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 2, Lesson 1 (Write-up 3 — the red-team story, published + portfolio index)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Rep format: problem statement (2–3 sentences, production-flavoured) → implement ≤15 min → run the supplied-style tests (write 3 asserts if none given) → 3-minute self-review against the rep rubric (correctness, edge cases named aloud, complexity stated). The rubric is the point: interviewers score the *narration* of edges as much as the code.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Rep 1: streaming + partial-failure handling
Consume a (stubbed) streaming completion; assemble output; handle a mid-stream error with a typed result, not an exception leak.

**Expected output:** Implementation + asserts pass inside the timebox (or the overrun is logged honestly with the sticking point).

### Step 2 — Rep 2: retries + idempotency
Wrap a flaky client: exponential backoff with jitter, max attempts, idempotency key propagation.

**Expected output:** Asserts cover: success-after-2-failures, give-up path, key stability across retries.

### Step 3 — Reps 3–4: pagination + budget middleware
Paginated ingestion with checkpointing; a middleware enforcing a per-day token ceiling (Month 2's pattern, from memory).

**Expected output:** Both reps attempted under time; self-reviews written for all four reps.

### Step 4 — Log the fluency gaps
Per rep: time, result, the one gap (API recall / edge blindness / speed). Gaps become Lesson 4's warm-up material.

**Expected output:** Gap log committed; no gap is recorded as 'silly mistake' — name the mechanism.

## Independent verification (checkpoint)
Four timed reps with self-reviews and a mechanism-named gap log exist.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the retry wrapper's contract (attempts, backoff shape, idempotency rule) from memory.
2. Prediction: which rep type will a *platform*-team screen weight most, and which will an FDE screen weight most? (Different answers — say why.)

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
