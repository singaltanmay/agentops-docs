# Write-up 3 — the red-team story, published + portfolio index

**Week 2 · Build · 75 min** · Month 6 — Interview Phase

## Objective
Publish write-up 3 ('Attacking my own agent: a red-team report') from the Month 4 security delta report, and build the portfolio index that orders all three write-ups + reports for a hiring manager's 10 minutes.

## Why this exists
The security write-up completes the trio (quality, evals, security — the three differentiators). The index matters as much as the pieces: it's the difference between a repo and a portfolio.

## Prerequisites
Write-ups 1–2 published; Month 4 delta report at hand.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 6 Week 1, Lesson 6 (Deep build — two full designs back-to-back (eval platform + doc-QA at scale))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 6 Week 1):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 6 Week 1, Lesson 6 (Deep build — two full designs back-to-back (eval platform + doc-QA at scale))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Write-up 3 anatomy: threat model in one page (trifecta framing up front), the attack programme (generated + fixed sets + AgentDojo), baseline numbers, the architectural fixes (in trifecta-leg terms), the Shields evaluation (both rates — including the false positives), after-numbers, and residual risks stated like an adult. Index: one page, ordered by the reader's questions (can he build it? can he measure it? can he secure it? can he ship it to a customer? — the deployment report is answer #4).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Draft write-up 3
Per the anatomy; before/after table as the centrepiece.

**Expected output:** Draft complete; numbers spot-checked vs the delta report (3 checks).

### Step 2 — Residual-risk section, written plainly
What still works against the system, and the accepted-risk reasoning.

**Expected output:** Section present; no risk is described as 'handled' that the report shows open.

### Step 3 — Build the portfolio index
One page linking: 3 write-ups, deployment report, ablation report, calibration table, runbook — each with a one-line 'what this proves'.

**Expected output:** Index committed at the portfolio's front door.

### Step 4 — Publish + link
Publish write-up 3; index updated everywhere the project is described.

**Expected output:** Links live and checked.

## Independent verification (checkpoint)
All three write-ups + the index are published; a hiring manager can reach every artefact in ≤2 clicks from the index.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: the 90-second red-team story — trifecta → baseline → architecture fix → delta — scripted for the story bank.
2. Generative: your before/after attack numbers for the two headline categories, unaided (approximately), then verified.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
