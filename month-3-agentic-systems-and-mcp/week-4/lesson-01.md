# Online traces — per-step tracing with cost per outcome

**Week 4 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Formalise Month 3's trace events into the standing observability shape Month 4 will build on: every run emits structured per-step spans to App Insights with tokens, cost, model, and outcome — verified by a KQL query reconstructing one task's full story from the logs alone.

## Why this exists
Month 4's platform phase starts here in practice: tracing that can answer 'what did this task do, what did it cost, where did it fail' from the logs — without re-running anything — is the substrate for online evals and failure analysis.

## Prerequisites
Weeks 1–3 done; App Insights workspace from Month 1 (daily cap set).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 3, Lesson 6 (Deep build — long-task endurance run + context report)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 3 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 3, Lesson 6 (Deep build — long-task endurance run + context report)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Span discipline: one trace ID per task; spans per step (model call / tool call / gate / compaction) with attributes {model, tokens_in, tokens_out, cost_est, duration, status}. Log volume is a budget line (Month 3 column: ~$18 for App Insights/Log Analytics) — sample verbose payloads, keep all headers/metrics. **UNVERIFIED:** the exact custom-event/dependency API calls for your pinned Application Insights SDK — official docs govern; the span *schema* in the repo is the contract.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Define the span schema
Repo doc + code constants: span names, required attributes, what's never logged (raw secrets, full PII-bearing payloads).

**Expected output:** Schema committed; a staged task's spans match it field-for-field.

### Step 2 — Emit from all paths
API, agent graph, and MCP server all emit with the same trace ID propagation.

**Expected output:** One task's spans from ≥2 services share a trace ID in the portal.

### Step 3 — The reconstruction query
Saved KQL: given a trace ID, return the ordered span story with per-span cost and the task total.

**Expected output:** Query reconstructs today's staged task; totals match the trace footer.

### Step 4 — Volume check
Estimate GB/day from today's runs against the Log Analytics line; set sampling if projection exceeds it.

**Expected output:** Projection recorded; sampling config (if any) committed with its rationale.

## Independent verification (checkpoint)
A task's full story — steps, models, cost, failure point — is reconstructible from logs alone via the saved query.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the span schema's required attributes and the two never-log rules.
2. Prediction: Month 4 adds online evals sampling 10% of traffic for judge scoring. Which spans must exist for the judge to score a task *from the trace*?
3. Transfer: a span shows a tool call with status=ok but the task failed. Give two mechanisms, and the extra attribute that would distinguish them.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
