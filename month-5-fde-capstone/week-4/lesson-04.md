# Platform packaging — MCP plug-in docs + onboarding another tool

**Week 4 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Package the platform for others: publish the MCP server plug-in documentation (contract, auth, scopes, client setup for two client types) and prove it by onboarding one *new* tool end-to-end using only the docs + the platform's how-tos.

## Why this exists
Month 4 froze the contract; this lesson makes it consumable. The proof is performative: a new tool onboarded *via the documented path* (privilege statement, contract entry, hardening checklist, eval slice) without inventing process on the fly.

## Prerequisites
Lessons 1–3 done; `mcp-v1` contract + Month 4 platform README in place.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 4, Lesson 3 (The runbook — operate the Workbench without you)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 4, Lesson 3 (The runbook — operate the Workbench without you)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Onboarding path (the documented one): tool proposal (privilege line first) → contract/schema → server implementation behind existing hardening (Month 3 Week 2 checklist) → staged client test → eval slice (tool-selection + one failure case) → docs entry. New tool candidate: something the customer asked for in the field loop that was deferred (check the stakeholder log) — packaging work that also closes a real loop.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the plug-in docs
`mcp-server/README` public face: purpose, tool list, auth + scopes, client setup (agent + one external client), versioning policy.

**Expected output:** Docs committed; a fresh reader could connect a client from them alone (verify by re-reading cold).

### Step 2 — Onboard the new tool via the path
Execute the documented onboarding for the chosen tool, logging every place the docs/process failed you.

**Expected output:** Tool live behind the contract; process-friction log has ≥1 entry (zero entries means you weren't watching).

### Step 3 — Fix the docs from the friction
Patch docs/checklists at the friction points; re-verify the patched step.

**Expected output:** Patches committed; the friction log shows resolution per entry.

### Step 4 — Register the tool in the evals
Tool-selection staged case + failure case added to the relevant suites.

**Expected output:** Suites updated; a run shows the new tool's cases passing/failing honestly.

## Independent verification (checkpoint)
Plug-in docs proven by a real onboarding executed through them, with the friction fixed in the docs themselves.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the onboarding path's six steps and the artefact each produces.
2. Prediction: the next team onboarding a tool will skip which step, and what does the platform do to make the skip visible?
3. Transfer: this packaging is the Agent Platform Engineer interview artefact. State its three strongest pages and why.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
