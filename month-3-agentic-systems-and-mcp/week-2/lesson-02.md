# The full tool surface over MCP — golden-set and eval tools

**Week 2 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Extend the MCP server to the planned tool surface: `search_corpus`, `get_golden_question`, `run_eval_subset` (10-task), each with the Month 2 contract discipline — verified by a client driving a mini eval loop entirely over MCP.

## Why this exists
A server with one toy tool is a tutorial. The planned surface — search / golden-set / eval — turns the MCP server into the Workbench's control plane, and is the exact artefact the roadmap promises ('your own MCP server exposing search / golden-set / eval tools').

## Prerequisites
Lesson 1 server working locally.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 1 (MCP fundamentals — your tools as a protocol server (local))):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 1 (MCP fundamentals — your tools as a protocol server (local))) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Design rule for the surface: read tools are free to expose; *action* tools (`run_eval_subset` spends money and minutes) inherit the budget + audit discipline — every call logs caller, args, and cost, and the eval tool enforces the same per-run ceilings as the harness. The golden-set tool serves questions *without* reference answers by default (answers are a separate privileged read — leaking them to the agent under test would poison every eval).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Add `get_golden_question`
Returns question + category + expected chunk IDs for a given ID or a random tuning-split question; reference answer withheld unless a `reveal` flag is set by an authorised caller role.

**Expected output:** Client fetches a question; the response contains no reference-answer field by default (assert it).

### Step 2 — Add `run_eval_subset`
Runs the 10-task agent eval (or 20-Q RAG subset) and returns the run ID + headline metrics; enforces the harness ceilings; writes the run to Postgres as usual.

**Expected output:** Client-triggered run completes; run row exists with the MCP caller recorded.

### Step 3 — Drive a mini eval loop over MCP
From the reference client: fetch 3 questions → answer via `search_corpus` → check expected chunks — a full loop with no direct calls.

**Expected output:** Loop transcript saved; chunk-hit result recorded for the 3 questions.

### Step 4 — Contract doc v2
Update the server contract: full tool list, per-tool privilege line, the answer-withholding rule, audit behaviour.

**Expected output:** Contract v2 committed; privilege lines match PRIVILEGES.md.

## Independent verification (checkpoint)
All three tools callable over MCP by a reference client; the answer-withholding assertion passes; an MCP-triggered eval run is indistinguishable in Postgres from a CLI-triggered one (except caller).

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the server's tools with a one-line privilege statement each.
2. Planted-bug: `get_golden_question` returns the reference answer in a `notes` field. Which eval property dies, and which Month 1 discipline (held-out rules) is the same shape?
3. Prediction: `run_eval_subset` is exposed to the agent under test. Describe the abuse case and the control you already built.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
