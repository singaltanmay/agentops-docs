# Hardening II — failure drills: kill things on purpose

**Week 4 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Run the failure drills against the deployment: kill the agent mid-task, stop Postgres briefly, expire the MCP credential, and saturate the budget circuit breaker — verifying each recovery matches the documented behaviour.

## Why this exists
Resilience claims from Months 2–3 (resume, budgets, gates) were proven in dev. Drills re-prove them on the deployment, where config drift goes to hide — and produce the runbook's evidence base (next lesson).

## Prerequisites
Lesson 1 done; runbook skeleton started (it absorbs this lesson's outputs).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 4, Lesson 1 (Hardening I — load, caching, and cost optimisation)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 4, Lesson 1 (Hardening I — load, caching, and cost optimisation)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Drill discipline: each drill has a written expected behaviour *before* execution (from the original lessons' contracts), an operator (you) who does not peek at internals mid-drill, and a verdict (matches / deviates) with deviations becoming hardening items. Drills run against the customer env's staging posture, never against anything a real user is touching.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Drill 1: kill + resume
Mid-task process kill on a long task; resume; verify tool-call parity (Month 3 contract).

**Expected output:** Verdict recorded with trace evidence.

### Step 2 — Drill 2: dependency loss
Stop Postgres (the Month 2 stop/start machinery) during light traffic; observe API/agent behaviour; restart; verify recovery + no corrupt state.

**Expected output:** Behaviour matches the written expectation or the deviation is logged with its mechanism.

### Step 3 — Drill 3: credential + budget
Revoke the MCP client credential (Month 3 drill, deployment edition); trip the per-day budget breaker with staged volume.

**Expected output:** Both controls behave as designed in the deployed config — config drift, if any, is the finding.

### Step 4 — Write the deviations
Every deviation becomes a runbook 'known behaviour' entry or a fix item — nothing stays as oral tradition.

**Expected output:** Drill report committed; deviations dispositioned.

## Independent verification (checkpoint)
Four drills executed against written expectations with verdicts; deviations are items, not surprises saved for later.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the four drills and their expected behaviours from memory — then check against the report.
2. Planted-bug: a drill 'passes' because the operator restarted the service manually mid-drill. Why is the drill now invalid, and what discipline prevents it?
3. Teach-back: which drill result would you show a sceptical platform interviewer first, and why?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
