# Deep build — MCP server hardening pass + contract freeze

**Week 2 · Deep build · ~3 hrs** · Month 3 — Agentic Systems + MCP

## Objective
Harden the MCP deployment to a freezable v1: per-tool input validation against schemas, output size caps, per-client rate limits, full audit logging — verified by a scripted abuse suite (oversized args, schema violations, burst calls) being refused or throttled, with legitimate staged tasks still green.

## Why this exists
Servers that tools call need the boring armour before they need more tools. Freezing the contract now also protects Month 4: the red team attacks a stable target, and the eval platform integrates against fixed shapes.

## Prerequisites
Week 2 lessons complete.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 5 (Consolidation — MCP mixed gate + threat-model draft)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 5 (Consolidation — MCP mixed gate + threat-model draft)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Hardening scope (in-app, per the roadmap's no-API-Management budget rule): schema validation on every tool input (reject, don't coerce), response size caps (chunk counts and payload bytes), token-bucket rate limit per client identity, and structured audit logs (caller, tool, args hash, result size, latency) to App Insights. These are *your* controls, implemented in FastAPI/SDK middleware — **UNVERIFIED:** any built-in equivalents in your pinned SDK version; check its docs before hand-rolling.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Input validation
Every tool validates args against its published schema; violations return a protocol-level error, never a stack trace.

**Expected output:** Abuse suite case 1: malformed/oversized args to each tool → clean refusals, zero executor invocations (check the log).

### Step 2 — Output caps
Cap returned chunks/bytes per call; truncation is explicit in the payload (`truncated: true`), never silent.

**Expected output:** Abuse suite case 2: a maximal request returns a capped, marked payload.

### Step 3 — Rate limits
Per-client token bucket (generous for the agent, tight for others — values in config); 429-style refusal on burst.

**Expected output:** Abuse suite case 3: burst from the test client throttled; agent client's staged tasks unaffected.

### Step 4 — Freeze contract v1
Tag the server + contract doc `mcp-v1`; run the Month 2 tool-selection staged tasks + 10-task eval subset against the frozen build.

**Expected output:** All green on the frozen build; tag + audit samples committed.

## Independent verification (checkpoint)
Abuse suite passes (refusals/throttles with zero unintended executions); legitimate traffic green on the tagged `mcp-v1` build.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the four hardening controls and the abuse each one answers.
2. Planted-bug: rate limits key on a caller-supplied header that isn't authenticated. Explain the bypass and the fix in two sentences.
3. Transfer: which of these controls belongs in *every* future tool by default? Write the checklist line you'll reuse.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
