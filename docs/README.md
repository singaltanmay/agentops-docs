# AgentOps Workbench — Course Guideline

This repo is the **ground truth** for a 6-month, self-taught level-up: from frontend/UI
engineering into **Agentic AI / Applied AI Engineering**, built around ONE cumulative
production system — **AgentOps Workbench** — hosted entirely on Azure, with
deployment spend kept within the learner's verified subscription credit
allowance. Original course cost estimates are in USD; this learner's Visual
Studio offer is billed in INR and showed about INR 12,500 starting credit, so
verify and adapt the spend plan before creating paid resources.

It is not a syllabus to read. It is a sequence of lessons to *do*, in order, gated by
evidence. If this repo and anyone's memory disagree about the plan, this repo wins.

## What gets built

| Phase | Months | System state at the end |
|---|---|---|
| P1 — Production RAG | 1–2 | Ingestion → hybrid retrieval → reranking → cited-answer API + UI, 160-Q golden set, Ragas report |
| P2 — Agentic system | 2–3 | Raw agent loop → LangGraph, your own MCP server, durable state, human-approval gate |
| P3 — Evals / observability / security | 3–4 | Per-step tracing, calibrated LLM judge, CI regression gates, OWASP LLM red-team suite |
| P4 — FDE capstone | 4–5 | Deployment for a "customer", read-only multi-agent extension, one LoRA experiment (kept only if it beats prompting on evals) |
| Interview phase | 6 | LLM system-design drills, portfolio artefacts, targeted applications |

Full trajectory, definitions of done, and budget: [ROADMAP.md](ROADMAP.md).
Architecture and dataset decisions: [resources/](resources/).

## Fixed constraints (do not renegotiate mid-course)

- **Azure only.** AI Search **Basic** ($73.73/mo — Standard S1 at $245.28 blows the budget alone), `gpt-4o-mini` + `text-embedding-3-small`, Postgres Flexible **B1ms** joins in Month 2.
- **Advanced only.** No basics, no beginner tutorials, no paid courses.
- **One cumulative build.** Every lesson leaves the system running and better than yesterday.
- **Dataset:** Kubernetes docs (Concepts + Tasks) + filtered closed GitHub issues. Fallback: SEC EDGAR. See [resources/datasets.md](resources/datasets.md).
- **Time shape:** weekday sessions are short (~75 min, around a full-time job); one weekend day is the deep-build block; the other weekend day is off.

## How a learning session works

Lessons are **sequence numbers, not calendar dates** (Day 1, Day 2, …). You advance
when the evidence says so, not when the calendar does. The full instructor model is in
[HOW-WE-LEARN.md](HOW-WE-LEARN.md); the short version:

1. **Open with retrieval, not reading.** Every session starts with a closed-book
   warm-up: yesterday, 3 days ago, 7 days ago (spaced 1d/3d/7d), confidence-tagged.
2. **Expected output before execution.** Every step states what you should see
   *before* you run it. If reality differs, that's the lesson.
3. **Mastery = unaided probe.** A lesson is done when its verification passes AND
   you pass an unaided probe (generative / prediction / transfer / planted-bug /
   teach-back). Saying "done" never counts.
4. **Blocked → hint ladder first.** A step the instructor demonstrates is logged
   **assisted, not mastered**, with a repair probe within 48 h.
5. **Missed day → resume in prerequisite order.** Never double up. A gap of ≥4 days
   starts with a reactivation half-day.
6. **Close with your own 3-line log:** what I built / what broke and why / what I
   still can't do unaided. Record it in [PROGRESS.md](PROGRESS.md).

## How progress is recorded

[PROGRESS.md](PROGRESS.md) is the tracker: one row per lesson, status one of
`not started` / `in progress` / `assisted` / `mastered`, plus an evidence entry
(checkpoint result + probe result + date) for every status change. A lesson with no
evidence entry has not happened, whatever the checkbox says.

## Repo map

Course materials live in `docs/`; application code, infrastructure, ingestion,
evaluations, and data live alongside it in the same repository. Use branches
for lesson work: Week 1 (including Day 1) uses `month1_week1`, tracking
`origin/month1_week1`. Do not create a separate workbench repository.
See the [project README](../README.md) for the root layout. The map below is
relative to `docs/`.

```
README.md                  ← you are here
HOW-WE-LEARN.md            ← the instructor model, as operating rules
ROADMAP.md                 ← 6-month trajectory, definitions of done, budget
PROGRESS.md                ← tracker + evidence log
month-1-production-rag/    ← Days 1–31, four week folders, one file per day
month-2-rag-hardening-and-agents/
month-3-agentic-systems-and-mcp/
month-4-evals-observability-security/
month-5-fde-capstone/
month-6-interview-phase/   ← each: month README + week-1..4, one file per lesson
resources/
  azure-architecture-and-budget.md
  datasets.md
  glossary.md
```

## Ground-truth rule

Official documentation for the pinned versions is ground truth. Anything in these
lessons that could not be verified against the sources is labelled **UNVERIFIED** —
treat it as a hypothesis to check, never as a fact to build on.
