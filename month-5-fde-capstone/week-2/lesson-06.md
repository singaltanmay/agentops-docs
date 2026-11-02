# Deep build — deployment report v1 + stakeholder review

**Week 2 · Deep build · ~3 hrs** · Month 5 — FDE Capstone

## Objective
Complete deployment report v1 (brief → data → access → evals → field loop → requirement change → outcomes) and run a stakeholder review session (real, or a simulated review where you present and take hostile questions from the brief).

## Why this exists
The deployment report is the FDE portfolio artefact — the document that says 'I can land this in someone else's world'. The hostile-questions review is its stress test: every claim must survive 'how do you know?'

## Prerequisites
Week 2 lessons complete; report drafts from Weeks 1–2 assembled.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 5 (Consolidation — capstone mixed gate (deployment half))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 5 (Consolidation — capstone mixed gate (deployment half))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Report standard: every quantitative claim carries its run ID/instrument; the field-findings→changes chain is explicit (finding, decision, change, measured effect); limitations and the top miss are sections, not footnotes. Simulated-review rule: questions must target evidence (numbers, logs, decisions), and answers must point at artefacts, not memory.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Assemble report v1
Full structure per the objective; cross-link stakeholder log + runs.

**Expected output:** Report committed; link check passes (every cited run resolves).

### Step 2 — Self-interrogate
Write the 8 hardest questions a sceptical stakeholder/hiring manager would ask; answer each from artefacts in an appendix.

**Expected output:** Appendix exists; any answer that can't cite an artefact becomes a gap item, honestly listed.

### Step 3 — Run the review
Present (real or simulated); log questions + answers + resulting actions in the stakeholder log.

**Expected output:** Review entry complete; actions have owners (you) and dates (sequence positions).

### Step 4 — Freeze v1
Tag `deployment-report-v1`; note what Weeks 3–4 will append (extensions + LoRA verdict) without rewriting v1's claims.

**Expected output:** Tag + append-plan committed.

## Independent verification (checkpoint)
Deployment report v1 is tagged, evidence-linked, and has survived a hostile review with its gaps listed as items.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back (interview rehearsal): the 2-minute FDE story of this deployment — problem, mess, loop, change, outcome.
2. Generative: list the report's sections and the artefact each one cites.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
