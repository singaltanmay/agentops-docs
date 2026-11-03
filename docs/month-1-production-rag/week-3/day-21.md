# Day 21 — Week 3 gate — the product, audited

**Week 3 · Gate · 75 min** · Month 1 — Production RAG

## Objective
Audit the deployed product against every Week 3 exit criterion and write the access-control design note — verified by the gate sheet: 4-mode table present, 100% citations resolve, refusals ≥80%, both containers CI-deployed.

## Why this exists
Week 3's claims are user-visible, so its gate is an audit, not a vibe: each criterion gets re-measured today against production, including the unanswerable probes. The design note (audience metadata + OData filter pattern from the access-control session) banks Week 3's thinking for Month 4's security build.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 20):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 18):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 14):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 20's independent verification ("CI/CD — deploy on merge, from GitHub Actions") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
Assessment + one small design task. The design note applies the Reactor access-control pattern at the level Month 1 needs: an `audience` filter field on chunks + the filter expression at query time + what real per-user trimming would additionally require (identity propagation, index-time security) — written now, while the retrieval code is fresh, implemented in Month 4.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Re-run the 4-mode table summary + production assertions
Probe-v2 table confirmed frozen; Day 17's 15-call script + a fresh 10-question unanswerable set against production.

**Expected output:** Refusals on the fresh set ≥80%; citations 100%. A miss on either is a gate repair task today, scoped small.

### Step 2 — Measure p95 honestly
From App Insights: /ask p95 over all production calls so far, split by stage. The research target was <4s at this scale — report the actual number either way.

**Expected output:** p95 + stage split in the gate sheet. Missing the target with a named dominant stage passes the gate; an unexplained miss does not.

### Step 3 — Write the access-control note
`docs/decisions/003-access-control.md`: the audience-filter design, its limits (filtering is not trimming), and the Month 4 implementation sketch.

**Expected output:** Note committed; the `audience` field already exists in the index schema (Day 9 foresight, paying off).

### Step 4 — Gate review
KC-08…KC-11 states from evidence; Week 3 retro; spend check (Basic has been running ~10 days — forecast the month and compare with the $116 plan).

**Expected output:** Gate sheet committed. Month-to-date spend within plan ±20% or the variance is named.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Fresh unanswerable set refuses worse than Day 17's | Overfit refusal behaviour to the 5 known probes | Widen the probe phrasing variety, fix at the layer the failures indicate; fixed when a *second* fresh set also clears 80% |
| p95 dominated by one stage you didn't expect | Measurement correcting intuition — the point of measuring | Name the stage + first hypothesis in the gate sheet; optimisation itself is Month 3 work |
| Citations resolve but expansion text mismatches production answers | Index rebuilt since answers were generated (stale answer cache in your test, not the product) | Re-ask fresh questions for the audit; fixed when fresh answers' citations expand correctly |

## Independent verification (checkpoint)
The gate sheet is the verification: four criteria, each with today's measured value and the artefact proving it. Anything asserted without an artefact is marked UNVERIFIED on the sheet itself.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Mixed gate (Weeks 1–3, 10 items, closed-book): budget · RBAC · chunking decision · RRF · ranker economics · schema · refusal rule · OIDC · p95 stage split · contamination control.
2. Teach-back: filtering vs trimming in document-level security — the distinction, and why conflating them is a security bug, not a wording issue.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Week 4 tomorrow: the golden set. Required reading tonight: Hamel Husain, 'Your AI Product Needs Evals' — in full, it's the week's operating manual.
