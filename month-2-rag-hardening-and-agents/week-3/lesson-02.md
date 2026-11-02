# Tool design — schemas, error returns, and least privilege

**Week 3 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Harden the search tool into a designed interface: precise schema, structured error returns the model can recover from, and an explicit privilege statement — verified by three induced tool failures each producing a recoverable observation, not a crash.

## Why this exists
Tool design is the agent's API design. Most agent failures are tool-interface failures: ambiguous descriptions, silent errors, and over-privileged tools (OWASP LLM06, excessive agency — designed out here, red-teamed in Month 4).

## Prerequisites
Lesson 1 loop working.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 3, Lesson 1 (The raw agent loop — ReAct without a framework)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 2, Lesson 5):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 3, Lesson 1 (The raw agent loop — ReAct without a framework)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Rules applied today: (1) descriptions written for the *model* (when to call, when not to, what the args mean); (2) errors are observations — return `{error: ..., hint: ...}` so the loop can adapt; a tool never raises through the loop; (3) every tool gets a written privilege line: data it can read, actions it can take (today: read-only corpus), and what it must never do.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Rewrite the search tool contract
Description + arg docs + return shape (chunks with IDs, scores, and a `total_found`), plus `error` variants for: empty query, no results, backend failure.

**Expected output:** Schema committed; each return variant has an example in the tool's doc comment.

### Step 2 — Induce the three failures
Force each error variant (empty args via a stubbed model response; no-results via a nonsense query; backend failure by stopping the API locally).

**Expected output:** All three return structured errors; the loop logs them and terminates gracefully or retries with a modified query — no stack trace through the loop.

### Step 3 — Write privilege statements
For the search tool: reads = corpus index only; writes = none; network = own API only. Store as a `PRIVILEGES.md` (or tool-registry metadata) the Month 4 audit will consume.

**Expected output:** Privilege statement committed and matches the code's actual behaviour (spot-check: the tool cannot write — prove it by the absence of any write call in its path).

### Step 4 — Recovery behaviour
Add one recovery rule: on `no results`, the loop may retry once with a rewritten query before answering 'not in the corpus'.

**Expected output:** Nonsense-question run shows exactly one retry, then a refusal answer.

## Independent verification (checkpoint)
Three induced failures → three structured observations; privilege statement committed and demonstrably true; one-retry recovery visible in a trace.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the search tool's privilege statement from memory.
2. Planted-bug: a tool returns raw exception text including a connection string fragment. Classify the bug (two taxonomy entries apply) and state the fix.
3. Transfer: design the contract for a future `create_issue` tool — which fields, which error variants, and what privilege line makes it Month 4-auditable?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
