# Consolidation — deployment-readiness gate

**Week 1 · Review · 60 min (light)** · Month 5 — FDE Capstone

## Objective
Pass the Week 1 mixed gate and run the deployment-readiness review: brief vs build checklist (access, evals, SLOs, cost) with go/no-go per item for Week 2's deployment.

## Why this exists
FDE deployments fail on readiness gaps discovered live. The checklist converts Month 4's instruments into a go/no-go ritual while fixes are still cheap.

## Prerequisites
Lessons 1–4 done.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 4 (The customer golden set — evals in the customer's domain)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 4 (The customer golden set — evals in the customer's domain)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Readiness areas: data (ingested, reconciled), access (leakage battery green), evals (baseline taken, judges spot-checked), operations (SLOs defined for the customer paths, weekly report extended), cost (projected customer traffic inside the envelope), security (threat model delta for the customer surface written).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Month 4 + Week 1: calibration, gates, trifecta, trimming, brief anatomy.

**Expected output:** Score in PROGRESS.md; repairs scheduled.

### Step 2 — Readiness review
Walk the six areas; each gets go / no-go + the fix if no-go.

**Expected output:** Checklist committed with verdicts; any no-go has a dated fix item.

### Step 3 — Threat-model delta
One section appended to threat model v1: customer surface changes (new corpus = new untrusted content; new users = new callers).

**Expected output:** Delta committed; new abuse cases map to existing or new controls.

### Step 4 — Pay down one debt item + spend check
Debt repaired; Month 5 spend so far vs ≈$187 tracked (LoRA envelope untouched so far — confirm).

**Expected output:** Both recorded.

## Independent verification (checkpoint)
Readiness checklist with honest verdicts exists; Week 2 deploys (or fixes first) from evidence.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three readiness findings (one per area) — go or no-go, and the evidence you'd demand.
2. Teach-back: the difference between 'deployed' and 'ready to deploy' — in this project's own checklist language.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
