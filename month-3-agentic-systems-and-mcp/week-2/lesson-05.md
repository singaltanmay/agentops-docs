# Consolidation — MCP mixed gate + threat-model draft

**Week 2 · Review · 60 min (light)** · Month 3 — Agentic Systems + MCP

## Objective
Pass the Week 2 mixed gate and draft the MCP threat model (assets, callers, trust boundaries, top attacks) that Month 4 will execute against.

## Why this exists
Security work that starts in Month 4 is already late. This week's surface — a hosted, multi-client tool server — gets its threat model while its design is still fresh.

## Prerequisites
Lessons 1–4 done; PRIVILEGES.md current.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 4 (Two clients, one server — the agent and an external client)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 4 (Two clients, one server — the agent and an external client)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Threat-model-lite: for each tool — who can call it, what it can reach, what a malicious *caller* could do, what malicious *content returned by the tool* could do (tool outputs are untrusted input to the model — the AgentDojo lesson, arriving early). Map each risk to an OWASP LLM category now; controls come in Month 4.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Mixed gate (8–10 items)
Closed-book across Weeks 1–2: graph migration, checkpointer, gate, MCP primitives, transports, contract rules.

**Expected output:** Score in PROGRESS.md; fragile KCs scheduled.

### Step 2 — Draft the threat model
One page in the repo (`security/mcp-threat-model-draft.md`): assets, caller inventory, per-tool abuse cases, content-injection paths, OWASP mapping.

**Expected output:** Draft committed; every hosted tool has ≥1 caller-abuse and ≥1 content-abuse case.

### Step 3 — Pay down one debt item
Oldest debt item repaired with evidence.

**Expected output:** Debt log shrinks by one.

### Step 4 — Spend check
Cost review vs Month 3 column (≈$165); the third container app's actual cost eyeballed.

**Expected output:** Variance explained in one line.

## Independent verification (checkpoint)
Threat-model draft committed with per-tool abuse cases; gate recorded; Month 4 has its target list.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Interleaved: three scenarios (malicious caller, malicious tool output, leaked credential) — name the OWASP category and the first control you'd test for each.
2. Teach-back: the difference between authenticating a *client* and authorising a *tool call*. Why does this system need both ideas?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
