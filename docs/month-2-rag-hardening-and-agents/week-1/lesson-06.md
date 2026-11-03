# Deep build — reranker depth and top-k sweep; ablation report draft

**Week 1 · Deep build · ~3 hrs** · Month 2 — RAG Hardening + Agents

## Objective
Sweep semantic-ranker depth and top-k on the tuning split, then assemble the full ablation report draft (Month 1 baseline → current best) with per-category breakdowns.

## Why this exists
Top-k and ranker depth are the two knobs everyone guesses at. A sweep converts them into the report's most quotable table — and per-category breakdowns are where the real story hides (aggregate wins often mask category regressions).

## Prerequisites
Week 1 lessons complete; harness supports per-category result slicing (add it in this session if missing).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 5 (Consolidation — ablation table v1 and the Week 1 mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 5 (Consolidation — ablation table v1 and the Week 1 mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Sweep design: vary one knob per run series (top-k ∈ {5, 10, 20, 50} into generation; ranker candidate depth where configurable), hold the rest at the current best config. **UNVERIFIED:** the exact AI Search parameter names/limits for semantic-ranker candidate depth for your pinned API version — confirm in the official AI Search docs before scripting the sweep; if a knob isn't exposed, sweep what's exposed and say so in the report.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Add per-category slicing
Extend the harness results with per-category aggregates (factoid / how-to / config-YAML / troubleshooting / multi-hop / unanswerable).

**Expected output:** One run now emits the aggregate row + 6 category rows.

### Step 2 — Run the top-k series
4 runs, top-k ∈ {5, 10, 20, 50}, rest frozen at current best.

**Expected output:** 4 rows + category rows appended; a quality-vs-latency curve you can plot from the CSV.

### Step 3 — Run the ranker series
Ranker off / on at the best top-k; plus candidate-depth variants if the pinned API exposes them (see concept note).

**Expected output:** Rows appended; any UNVERIFIED parameter use is flagged in the report draft, not hidden.

### Step 4 — Draft the ablation report
Structure: protocol → baseline → each technique (question, method, numbers, verdict) → current best config → per-category table → open questions for Months 3–4.

**Expected output:** Report draft committed; every number in it traces to a harness row (spot-check 3).

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Best aggregate config regresses a category | Aggregate hides category trade-offs | Report both; choose per-category routing only if the win is large and the complexity is justified in writing |
| Sweep results are noisy run-to-run | Judge variance | Repeat the two candidate-best configs once; report the delta as the noise floor |

## Independent verification (checkpoint)
The report draft exists, its spot-checked numbers match harness rows exactly, and the current-best config is a single named configuration the API actually runs.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Transfer: the report will be read by a hiring manager in 4 minutes. Which single table do you put first, and why?
2. Planted-bug: the instructor shows a sweep table where Recall@10 *falls* as top-k rises from 20 to 50. Is that possible? Explain the mechanism or refute it.
3. Teach-back: state your current best config and the evidence chain behind each of its choices, without looking.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
