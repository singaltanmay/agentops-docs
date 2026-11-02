# MCP fundamentals — your tools as a protocol server (local)

**Week 2 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Implement a local MCP server (Python SDK) exposing the Workbench's search tool, and connect it to a local MCP client — verified by the client listing and calling the tool over the protocol, with the direct-call path untouched.

## Why this exists
MCP is named verbatim in the target postings ('tool calling, MCP and context engineering'). Building a *server* — not just consuming one — is the differentiator, and the protocol view will change how you design tools from here on.

## Prerequisites
Week 1 migration gate passed. Reading (this week): Anthropic Academy 'Introduction to Model Context Protocol' + the MCP specification's tools primitive (modelcontextprotocol.io).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 6 (Deep build — migration review: graph agent on the full benchmark)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 6 (Deep build — migration review: graph agent on the full benchmark)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
MCP in one paragraph: a client–server protocol where servers expose **tools** (model-callable actions), **resources** (readable context), and **prompts** (templates); transports include stdio (local) and Streamable HTTP (hosted). The server describes its tools with the same JSON-Schema discipline as Month 2 — because to the model, that's exactly what they are. **UNVERIFIED:** exact Python SDK decorators/transport calls for your pinned SDK version — the official MCP Python SDK docs govern; this lesson fixes the architecture and the tool contract.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Scaffold the server
MCP Python SDK server exposing one tool: `search_corpus` (the Month 2 search contract, unchanged) over stdio.

**Expected output:** Server starts; its tool list contains exactly `search_corpus` with the Month 2 schema.

### Step 2 — Connect a reference client
Use the SDK's client (or MCP Inspector) to list tools and call `search_corpus` with a staged query. **UNVERIFIED:** the Inspector's exact invocation for your installed version — its official docs govern.

**Expected output:** Client output shows the tool + a real chunk result returned over the protocol.

### Step 3 — Compare the two paths
Same query via MCP vs via the direct executor: record result parity and the added latency of the protocol hop.

**Expected output:** Parity confirmed; latency delta noted in the migration log (expect small; a large delta is a finding, not a shrug).

### Step 4 — Write the server contract doc
One page: transport(s), tool list, auth posture (none locally — stated explicitly), versioning note.

**Expected output:** Contract doc committed; 'no auth locally' is written down as a known gap with Week 2's fix.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Client connects, tool list empty | Server registered the tool under a different name/scope than it serves | List-tools from the reference client is the checkpoint — debug registration before touching the agent |
| Results differ from the direct path | Server wraps a reimplementation, not the shared executor | The server must call the same executor as the agent (Month 2 rule) — one implementation, two transports |

## Independent verification (checkpoint)
A client that isn't your agent code called your tool over MCP and got a real result; the contract doc exists; the direct path still works.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write MCP's three server primitives and which of your Month 2 artefacts maps to each.
2. Prediction: the model now sees the tool description from the *server*, not your code. What drift risk does that create, and what test (Month 2 pattern) catches it?
3. Transfer: which of your other tools belongs behind MCP next, and which should never be exposed? Defend with privilege statements.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
