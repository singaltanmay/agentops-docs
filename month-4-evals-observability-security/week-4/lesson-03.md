# The lethal-trifecta audit — tool combinations, not tools

**Week 4 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Audit session-level tool *combinations* against the lethal trifecta (private data + untrusted content + external communication in one session) — producing a combination matrix with a verdict per combination and the Month 4 hardening list.

## Why this exists
Individually-safe tools compose into an exfiltration path. The trifecta is the audit that sees composition: for every session type your system permits, mark which legs are present; three legs = exploitable by design, and no prompt wording fixes it — only architecture does.

## Prerequisites
Lessons 1–2 results in; PRIVILEGES.md current (it lists per-tool legs already).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 4, Lesson 2 (Red team II — fixed sets: injections corpus + AgentDojo)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 4, Lesson 2 (Red team II — fixed sets: injections corpus + AgentDojo)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Leg inventory per tool/source: `search` (untrusted-ish content: corpus is curated, issues are not), `issue lookup` (untrusted content, some private-ish data), `file_failure_report` (external effect), `run_eval_subset` (spend = a resource leg), MCP tools as seen by *external clients* (your server is also a surface). Session types: chat RAG, agent task, ambient run, external-MCP-client session. The audit question per combination: can untrusted content in this session cause private data to reach an external channel?

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Build the combination matrix
Rows: session types × tool sets actually reachable; columns: the three legs + verdict (safe / two-legs-watch / trifecta).

**Expected output:** Matrix committed; every reachable combination appears (check against the router + MCP surface).

### Step 2 — Prove the worst cell
For any trifecta cell, construct the staged exploit (from Lesson 1/2 techniques) against the frozen target.

**Expected output:** Exploit succeeds (documented) or the cell is re-verdicted with the control that actually blocks it named.

### Step 3 — Write the hardening list
Per trifecta/two-leg cell: the architectural fix (split sessions, gate the leg, strip the data, scope the tool) — filters may supplement, never substitute.

**Expected output:** Hardening list committed with per-item owner lesson (Lesson 4 implements the top items).

### Step 4 — Update PRIVILEGES.md
Add the session-combination section: which combinations are *prohibited by configuration*, not by prompt.

**Expected output:** PRIVILEGES.md v3 committed; prohibited combinations are config-enforced where the mechanism exists today, else tracked as Lesson 4 work.

## Independent verification (checkpoint)
Combination matrix with a proven worst cell and an architectural hardening list; prohibited combinations named as configuration goals.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the trifecta and audit your own system: which session type is closest to it today?
2. Planted-bug: a fix proposes 'add a system-prompt rule: never send private data to tools'. Classify the fix (architecture or filter) and predict its Lesson 1 re-test result.
3. Teach-back: why can't a better prompt fix a trifecta? The data-flow argument in 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
