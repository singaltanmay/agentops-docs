# Deep build — gate hardening rehearsal: break it, fix it, prove it

**Week 3 · Deep build · ~3 hrs** · Month 4 — Evals, Observability & Security

## Objective
Rehearse the full change loop on a real improvement: pick the top taxonomy-v3 category, ship a fix through the PR gate + nightly path, and document the loop's timing and evidence — the exact motion Month 5's field-findings cycle will reuse.

## Why this exists
The platform's value is the loop, not any single gate. Running one real fix end-to-end (with timings) proves the loop's cost — if a fix takes two days of ceremony, the platform is wrong, and better to learn that this week than in Month 5.

## Prerequisites
Week 3 lessons complete; a real top-category fix candidate identified.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 5 (Consolidation — gates mixed gate + red-team prep)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 5 (Consolidation — gates mixed gate + red-team prep)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Loop accounting: log wall-time per stage (implement, PR gate, review of eval evidence, merge, nightly confirmation). The fix itself follows normal discipline (harness first, subset, then full) — the rehearsal measures the *platform's* overhead on top of the fix's own work.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement the fix on a branch
Target: top taxonomy-v3 category (from Week 1 counts). Harness subset first.

**Expected output:** Subset shows the intended direction (or the fix is rethought before any CI time is spent).

### Step 2 — Run the PR gate
Open the PR; gate runs; record its verdict + wall-time + the evidence it surfaced.

**Expected output:** Gate verdict recorded; any red is diagnosed to a named metric (Lesson 2's standard).

### Step 3 — Merge + nightly confirmation
Merge; the nightly (run on demand) confirms on full suites + the category metric.

**Expected output:** Category metric moved as intended on the full run, or the delta is explained in the loop log.

### Step 4 — Write the loop report
One page: fix summary, per-stage timings, evidence links, one friction item + its proposed platform fix.

**Expected output:** Report committed; the friction item becomes a backlog issue (Month 5 hardening will triage it).

## Independent verification (checkpoint)
One real fix travelled the whole loop with timings and evidence; the loop's friction is named, not vibes.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): 'Tell me about a time your evals caught — or would have caught — a regression' — use today's loop, with numbers.
2. Generative: the loop's stages in order, with the evidence each stage produces.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
