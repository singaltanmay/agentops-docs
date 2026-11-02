# Two clients, one server — the agent and an external client

**Week 2 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Point the LangGraph agent at the hosted MCP server as its tool source (replacing direct executor calls for the MCP-exposed tools), and connect a second, independent client (e.g. GitHub Copilot Chat in VS Code, per Microsoft's tutorial) — verified by both clients completing staged tasks against the same server.

## Why this exists
This is the 'talk to each other' topology made real: independent clients, one tool server, shared contracts. It's also the multi-client reality Month 4's security work must model — any client with the credential can call your tools.

## Prerequisites
Lesson 3 hosted server live with auth.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 3 (Host the MCP server — Streamable HTTP on Container Apps)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 3 (Host the MCP server — Streamable HTTP on Container Apps)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Client integration rule: the agent's tool *descriptions* now come from the server (Lesson 1's drift risk). Pin the server version the agent deploys against, and add the Month 2 staged tool-selection tasks as a regression check for any server change. **UNVERIFIED:** Copilot Chat's exact MCP configuration format in your VS Code version — its official docs govern the config file shape; the server side needs no change.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Agent → MCP client
Replace the agent's direct search/golden/eval calls with MCP client calls to the hosted server (direct path kept behind a flag for A/B).

**Expected output:** Staged tasks pass via MCP; traces show the MCP hop per tool call.

### Step 2 — Equivalence spot-check
10-task subset via MCP vs the Lesson 1 (Week 1) direct-path numbers.

**Expected output:** Success within noise; the per-task latency delta is recorded (this is the protocol's price — know it).

### Step 3 — Second client connect
Configure the external client (per its docs) against the hosted server with its own credential.

**Expected output:** External client lists tools and completes a search call; server audit log distinguishes the two clients.

### Step 4 — Per-client audit + revocation drill
Confirm per-client caller identity in the audit log; revoke the external client's credential and show its next call refused while the agent's still works.

**Expected output:** Revocation demonstrated; audit query shows both clients' calls attributed.

## Independent verification (checkpoint)
Two independent clients complete real calls against one server; per-client audit + selective revocation demonstrated; agent-vs-direct delta recorded.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: draw the topology (clients, server, executors, Postgres) from memory, marking every trust boundary.
2. Prediction: the server deploys a *changed* search description overnight. Which Month 2 test set catches a selection regression, and when does it run?
3. Teach-back: 'What does MCP buy you that a REST API doesn't, for this system?' — answer honestly, including where REST would have been fine.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
