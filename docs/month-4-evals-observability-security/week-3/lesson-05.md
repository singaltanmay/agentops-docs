# Consolidation — gates mixed gate + red-team prep

**Week 3 · Review · 60 min (light)** · Month 4 — Evals, Observability & Security

## Objective
Pass the Week 3 mixed gate and stage Week 4's red team: freeze the target build, inventory the attack surface from threat model v1, and prepare the attack suites (promptfoo redteam config draft).

## Why this exists
Red teaming a moving target produces uninterpretable results. The freeze + inventory discipline here is what makes Week 4's before/after numbers real.

## Prerequisites
Lessons 1–4 done; threat model v1 (Month 3) at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 3, Lesson 4 (Observability deepening — dashboards from the span schema)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 3, Lesson 4 (Observability deepening — dashboards from the span schema)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Freeze rule: Week 4 attacks run against the current tagged build; hardening fixes land on a branch and are re-tested as the 'after' — never patch mid-measurement. Inventory: every entry point (chat/API, MCP tools, ambient intake, issue content, corpus documents) × every effect (answers, writes, gates, spend).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Weeks 1–3: judges + bands, promptfoo division, gate design, nightly, KQL lenses.

**Expected output:** Score in PROGRESS.md; repairs scheduled.

### Step 2 — Freeze + tag the target
Tag the full system build `redteam-target-v1`; record run IDs for its current eval state (the security 'before' baseline pairs with these).

**Expected output:** Tag + baseline runs committed.

### Step 3 — Attack-surface inventory
From threat model v1: the entry × effect matrix, each cell marked testable-now / needs-fixture / out-of-scope-with-reason.

**Expected output:** Inventory committed; Week 4's lessons map onto its rows.

### Step 4 — Draft the redteam config
promptfoo redteam config skeleton naming the target endpoints + purpose statement (its generator builds cases from your stated purpose/tools).

**Expected output:** Config draft committed (generation itself is Week 4 Lesson 1).

## Independent verification (checkpoint)
Target frozen and baselined; inventory maps every Week 4 lesson to surface rows; redteam config drafted.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three hardening changes — for each, gate / nightly / red-team: which instrument must re-run before it ships?
2. Teach-back: why freeze before attacking — and what the 'after' measurement must hold constant to be comparable.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
