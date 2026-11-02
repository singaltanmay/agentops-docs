# Hardening + Prompt Shields — defence in depth, measured

**Week 4 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Implement the top hardening items (session splitting / tool scoping / gate coverage) and evaluate Azure AI Content Safety Prompt Shields (user-prompt + document attacks) as an added layer — then re-run Lessons 1–2 suites for the 'after' numbers.

## Why this exists
Defence in depth, in the right order: architecture first (Lesson 3's list), classifier layer second (Prompt Shields screens inputs *and retrieved documents* — the document-attack detection is the one that matters for RAG). Shields is a layer with known limits, evaluated like any other component: measured, not trusted.

## Prerequisites
Lessons 1–3 done; hardening list prioritised.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 4, Lesson 3 (The lethal-trifecta audit — tool combinations, not tools)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 4, Lesson 3 (The lethal-trifecta audit — tool combinations, not tools)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Budget note: Content Safety Free tier (5,000 text records/mo) covers this evaluation; Standard is $0.38/1,000 records if you exceed it (region variance — re-check before enabling; Month 4 budget line allows ~$8). **UNVERIFIED:** Prompt Shields' exact API shape/enablement in Foundry for your setup — the official Prompt Shields documentation governs; record what you enabled (user-prompt, document, or both).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement top architectural fixes
Top 2–3 items from the hardening list (expect: untrusted-content sessions lose the write tool; eval-spend tool scoped per client; gate coverage extended).

**Expected output:** Fixes land on a branch; PRIVILEGES.md updated; unit/staged checks green.

### Step 2 — Enable + evaluate Prompt Shields
Enable per official docs; run the deepset set + Lesson 1's injection cases through the shielded path; record detection/false-positive rates.

**Expected output:** Shield metrics committed: injection detection %, legitimate-traffic false-positive % (the second number decides deployability).

### Step 3 — Re-run the attack battery
Lessons 1–2 suites against the hardened build (same cases, same scoring).

**Expected output:** 'After' table exists, cell-by-cell comparable to baseline.

### Step 4 — Write the security delta report
Before/after per category + the trifecta matrix re-verdicted + residual risks stated plainly (what still works against you).

**Expected output:** Report committed; residual risks are named, not softened.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| After-numbers improve only on Lesson 1's generated cases | Overfitting to the generated set | Weight the fixed sets (Lesson 2) + fresh generated cases (regenerate with a varied purpose statement) before claiming the delta |
| Shields blocks legitimate traffic | Classifier layer doing architecture's job | Scope Shields to screening + logging on the paths where false positives hurt least; record the scoping decision |

## Independent verification (checkpoint)
Before/after attack table with architectural fixes as the headline change, Shields measured (both rates), and residual risks written down.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list your hardening changes in trifecta-leg terms (which leg each removes/bounds).
2. Prediction: Shields' false-positive rate on legitimate *security-research-flavoured* user questions (your own Month 4 questions!) — high or low, and what does that teach about classifier layers?
3. Teach-back: 'Defence in depth' for this system — the layers in order, and which layer you'd remove last.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
