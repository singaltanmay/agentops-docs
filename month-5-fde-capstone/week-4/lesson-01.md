# Hardening I — load, caching, and cost optimisation

**Week 4 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Profile the deployed system under a realistic load shape (replayed task mix), then apply the top cost/latency optimisations (prompt caching discipline, response caching where safe, container settings) — measured before/after on the weekly-report metrics.

## Why this exists
Production hardening is measured, not vibes: replay a real task mix, find the actual bottleneck (it's rarely the one you'd guess), fix the top one or two, and prove it on the same replay.

## Prerequisites
Week 3 deep build done; weekly report + span data flowing.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 6 (Deep build — extensions integrated: multi mode + LoRA verdict into the deployment)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 6 (Deep build — extensions integrated: multi mode + LoRA verdict into the deployment)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Load shape: replay from traces (the Month 3/4 task mix at 5–10× rate) — synthetic uniform load would optimise for a fiction. Optimisation candidates in expected order: cached-input share (stable prefixes — verify the cache is actually hitting; cached input is half price), retrieval latency (index/sku posture within Basic), container cold starts on the customer path, judge sampling on online evals. Every change goes through the gate; perf work is not exempt.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Build the replay
A replay script driving the deployed env with the recorded task mix at a stated rate; captures p50/p95, error rate, cost per success.

**Expected output:** Replay completes; baseline profile committed (the 'before').

### Step 2 — Find the bottleneck
From spans: the top latency contributor + the top cost contributor (they're usually different).

**Expected output:** Both named with span evidence; optimisation targets chosen from them, not from intuition.

### Step 3 — Apply top 1–2 fixes via the gate
Implement, PR-gate, deploy to the customer env.

**Expected output:** Fixes merged with gate evidence; no fix ships on 'should help'.

### Step 4 — Re-run + report
Same replay; before/after table into the deployment report's hardening section.

**Expected output:** Table committed; deltas stated with the replay's own variance (run it twice if deltas are small).

## Independent verification (checkpoint)
A replay-based before/after exists for the top bottleneck fixes, with cost per success among the headline numbers.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: name your top latency and top cost contributors and the fix applied to each.
2. Prediction: prompt-cache hit rate on agent traffic vs RAG traffic — which is higher, and what structural feature decides it?
3. Transfer: the customer doubles traffic next month. Which line of the Month 5 budget breaks first, and what's the pre-agreed response?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
