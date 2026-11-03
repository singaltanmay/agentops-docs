# The system-design frame — quality / latency / cost / evals / security, every time

**Week 1 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Install the five-lens frame you'll run on every LLM system-design question, and prove it on a first timed design (support agent) scored against the frame's rubric.

## Why this exists
Interviewers for roles #1–#3 run the same underlying exam: design an LLM system and defend the trade-offs as one problem — quality, latency, cost, evals, security. Your five months map onto those lenses one-to-one; the frame makes the mapping automatic under pressure.

## Prerequisites
Month 5 gate passed; evidence pack assembled. Drill discipline (whole month): every drill is timed, performed unaided (no notes beyond what's stated), and scored against a rubric written *before* the drill. A drill you score yourself counts only when the rubric is mechanical enough that a stranger would score it the same — record the artefact (doc, recording, transcript) for every drill; Month 6 runs on evidence like every other month.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Deep Build — Month 5 gate):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 (capstone evidence)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Deep Build — Month 5 gate) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
The frame: (1) clarify + scope (users, scale, the 3 metrics that matter); (2) architecture sketch (ingest → retrieve → generate/agent → tools, with the state layer named); (3) the five lenses in order — quality (retrieval/generation design + failure modes), latency (p50/p95 budget per stage), cost (per successful outcome, with the unit economics), evals (golden set, judges, gates — built *before* tuning, say so), security (OWASP map, trifecta check, approval gates); (4) the honest limitation + what you'd measure first in production. Timebox for a 45-min interview design: 5 clarify / 10 sketch / 25 lenses / 5 close.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the frame card
One page: the frame + per-lens prompt questions + your Workbench's one-line answer per lens (the concrete example you'll reach for).

**Expected output:** Card committed to `interview/` in the repo (or the course repo's Month 6 folder — pick one home and keep it).

### Step 2 — Timed design #1: support agent
45 minutes, unaided, written artefact: design a customer-support agent for a SaaS product (docs + tickets). Frame card allowed (it's a frame, not content).

**Expected output:** Artefact exists, timed honestly (start/stop logged).

### Step 3 — Score against the rubric
Rubric: each lens present? numbers estimated (not hand-waved)? failure modes named? eval plan concrete? security architectural (not 'add a filter')?

**Expected output:** Score sheet filled; the two weakest lenses named — they set this week's drill emphasis.

### Step 4 — Patch the frame card
Add the two questions you wished you'd asked in clarification, from the scoring.

**Expected output:** Card v2 committed; additions are specific, not generic.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Design is all architecture, no numbers | Sketch ate the lens time | Hard timeboxes with a visible timer; an estimate with stated assumptions beats a precise silence |
| Security lens = 'prompt injection filter' | Filter-thinking from habit | Re-run the lens with the trifecta + approval-gate vocabulary from Month 4 before the next drill |

## Independent verification (checkpoint)
A scored, timed design artefact exists; the frame card is at v2; your two weakest lenses are named in writing.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: recite the frame (stages + timeboxes + five lenses) unaided.
2. Prediction: in design #1, which lens did the clock squeeze out? (Check your score sheet after answering.)
3. Teach-back: why does the evals lens come *before* security in the frame's order — and when would you swap them?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
