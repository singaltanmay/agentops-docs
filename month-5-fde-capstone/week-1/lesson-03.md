# Permissions become real — document-level access control

**Week 1 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Implement the access model from the brief: the Month 1 `audience` seam becomes enforced document-level security trimming (users see only their audience's chunks, in retrieval *and* citations) — verified by cross-audience leakage tests.

## Why this exists
Month 1 planted this seam deliberately (the access-control design note + filter field); Month 5 is when it pays off. Retrieval-time trimming is the production pattern — post-filtering after generation leaks through citations and counts.

## Prerequisites
Lessons 1–2 done; brief's access model written.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 2 (Messy data onboarding — the customer's corpus, honestly)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 2 (Messy data onboarding — the customer's corpus, honestly)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Mechanism: every chunk carries its audience metadata (set at ingestion from the inventory's owner/access data); every query executes with the caller's audience as an index filter (OData filter on the filterable field — the Month 1 design), so unauthorised chunks never enter context, rankings, or citation lists. Test posture: leakage tests are security tests — they join the red-team suite as regression cases, not one-off checks. **UNVERIFIED:** the exact AI Search filter syntax for your pinned API version — official AI Search security-trimming docs govern.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Tag the corpus
Extend ingestion to stamp audience metadata per chunk from the inventory mapping; re-index the customer corpus.

**Expected output:** Index audit: every chunk has a non-null audience; counts per audience reconcile with the inventory.

### Step 2 — Enforce at query time
API requires a caller audience (token claim or header in the capstone's auth posture); the retrieval call always includes the filter — no code path skips it.

**Expected output:** Code audit: the filter is constructed in exactly one place, used by all retrieval paths (RAG, agent search tool, MCP).

### Step 3 — Leakage test battery
For each audience pair: questions whose answers live only in the other audience's docs; assert refusal/no-citation, plus citation audits on normal questions.

**Expected output:** Battery green: zero cross-audience chunks retrieved or cited across the battery; battery committed as a security regression suite.

### Step 4 — Red-team spot check
Run Lesson 1 of Month 4's injection/leakage categories scoped to cross-audience extraction.

**Expected output:** Spot results recorded in the security notes; any success becomes a hardening item before Week 2.

## Independent verification (checkpoint)
Cross-audience leakage battery is green and committed as a regression suite; enforcement is single-point and covers all three retrieval paths.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the trimming mechanism and why post-generation filtering fails (two leak channels).
2. Prediction: the agent's search tool runs with the *service's* audience, not the caller's. What breaks, and which audit from Month 4 should have caught the design flaw?
3. Teach-back: security trimming vs the lethal trifecta — how do they interact in the ambient-run session type?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
