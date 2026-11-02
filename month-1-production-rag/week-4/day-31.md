# Day 31 — Buffer / polish — close the month clean

**Week 4 · Buffer · flexible** · Month 1 — Production RAG

## Objective
Use the buffer for exactly three things: triage golden-v1.1 candidates, polish the repo README into the month's public summary, and leave production in its verified Month 1 state — verified by the closing checklist, not by new features.

## Why this exists
The buffer exists because every honest plan needs slack — the Month 1 plan built it in from the start. Its rule is strict: buffer absorbs overruns and polish; it never absorbs new scope. Anything new you want belongs in Month 2's backlog, where Day 30 already put the important things.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 30):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 28):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 24):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 30's independent verification ("Month 1 retrospective — spend, surprises, Month 2 backlog") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
No new concept, no new pattern — deliberately. If a Week 4 gate item is still open, today is its repair slot (compressed objective, gate intact, per the missed/blocked protocol). If everything is green, today is short — ending a month early and rested is a legitimate outcome, and the correct rehearsal for Month 2's harder material.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Triage v1.1 candidates
Each Day 29 candidate: accept (into a v1.1 draft, unapplied), defer, or reject with a one-line reason. v1.0 remains the frozen reporting standard.

**Expected output:** Candidates file fully dispositioned; v1.0 untouched.

### Step 2 — README as the month's summary
Architecture diagram or table, the headline numbers (Recall story, Ragas A-vs-B deltas, p95, Month 1 spend), how to run everything, links to decision records + the report. Write for the hiring manager you'll send it to in Month 6.

**Expected output:** README complete enough that the repo explains itself without you in the room.

### Step 3 — Optional: 3-minute demo capture
Ask three questions on camera/screen-record: one clean answer with citations, one refusal, one known failure honestly labelled. Optional — skip if energy is better spent resting.

**Expected output:** If made: the failure case is in it. A demo with a labelled failure is more credible than a flawless one, to exactly the audience you're targeting.

### Step 4 — Closing checklist + log
Production assertions green · spend final · Month 2 issue #1 confirmed as your next session's start · 3-line log for the month.

**Expected output:** Checklist committed. Month 1 is closed — on evidence, like everything else in it.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Buffer becomes a feature day | Scope creep wearing a buffer's clothes | Park it as a Month 2 issue and stop; fixed when today's commits contain no new capability |
| An open gate item needs more than today | A real overrun, not a discipline failure | Apply the week-behind rule: Month 2's first days become the repair, Month 2's lowest-value item drops — decided in writing today, not drifted into |
| README numbers don't match the artefacts | Summary written from memory | Re-pull every number from its CSV/table while writing; fixed when each figure traces |

## Independent verification (checkpoint)
Closing checklist committed with production green. Month 1's final state is a set of artefacts — repo, report, retro, frozen golden set — not a claim.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. One last teach-back, for the road: the whole system, query to citation, and the three numbers you'd quote to prove it's good. From memory. This is the Month 6 interview answer, v1.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Month 2 — the agent: LangGraph over this RAG, your own MCP server beside it, Postgres for state. It starts from Day 30's issue #1. Rest first.
