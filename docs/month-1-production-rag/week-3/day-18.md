# Day 18 — Minimal UI + per-stage tracing

**Week 3 · Long build · 2–3 hrs** · Month 1 — Production RAG

## Objective
Deploy a Next.js UI on Container Apps (ask → answer → expandable citations → 'wrong answer' label) with App Insights traces per RAG stage — verified by a labelled feedback record landing in Blob/JSONL from a real UI click.

## Why this exists
The UI is not polish; it's instrumentation. The feedback button manufactures the labelled failure data Week 4's taxonomy is built from, and per-stage traces (retrieve / rerank / generate with token + latency attributes) are what make 'the answer was slow and wrong' a diagnosable sentence instead of a vibe.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 17):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 15):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 11):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 17's independent verification ("Cited-answer API — structured outputs + refusals") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Independent production:** you know containers and identity now (KC-03/04 at completion rung). New content is observability discipline, taught directly: a trace you cannot filter by stage, question, or outcome is a log, not observability. Design the attributes first (stage, mode, top-k, tokens, latency, answerable, citation count), then instrument.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Build the UI (ruthlessly minimal)
One page: question box, answer, citations expandable to the chunk text + section path, and the label button writing {question, answer, chunk_ids, label, timestamp} to Blob via the API. No auth, no history, no styling rabbit holes — Month 4 adds access control thinking; today is the data path.

**Expected output:** Local UI round-trips against local API; a label click produces a well-formed JSONL record.

### Step 2 — Instrument the API
Span/attributes per stage; a single correlation ID from UI click to trace. Add a KQL query file to the repo: slowest 20 requests by stage, refusal rate, citation-count distribution.

**Expected output:** App Insights shows one end-to-end trace with 3 stage spans for a single question — screenshotted or it didn't happen (paste the query + result summary in the log).

### Step 3 — Deploy both containers
UI joins the Container Apps environment; identities per Day 4's map (UI needs no data-plane roles — say why in the log).

**Expected output:** Public UI URL answers a question end-to-end over HTTPS.

### Step 4 — Seed the failure dataset
Ask 10 questions, deliberately including 3 you know are shaky; label honestly. The JSONL now has its first real rows.

**Expected output:** ≥10 feedback rows in Blob, ≥3 labelled wrong/partial with a one-word reason each.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| UI works, traces are mush | Missing correlation / stage attributes not set | Add the attributes at the span level, redeploy, re-ask; fixed when the KQL filters return stage-separated rows |
| Label button writes nothing | UI→API payload mismatch or Blob role missing on the API identity | Trace one click end-to-end; fixed when the record lands — and the role fix goes through Bicep, not the portal |
| Citation expansion shows wrong chunk text | UI resolving IDs against a stale index snapshot | Resolve citations through the API at click time; fixed when expansion matches the Day 17 scripted check |

## Independent verification (checkpoint)
From the public URL: ask → expand a citation (text matches the index) → label it wrong → the record exists in Blob within a minute, and the App Insights trace for that question shows all three stages. Four artefacts, one flow.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: why does the UI get zero data-plane roles? State the principle and the Month 2 exception you'll have to think about (the agent).
2. Transfer: p95 latency doubles next week. Which trace attribute tells you whether to look at retrieval or generation first, and what's your first KQL move?
3. Generative recall: the feedback record's five fields — and which Week 4 activity each field feeds.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: rest/review + Week 3 diagnostic for evals. Monday: CI/CD — GitHub Actions deploys on merge, so the public URL stops depending on your laptop.
