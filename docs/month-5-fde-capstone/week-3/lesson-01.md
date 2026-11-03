# Read-only multi-agent design — orchestrator-workers, scoped hard

**Week 3 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Design the multi-agent extension: an orchestrator delegating *read-only* research sub-tasks to worker agents with isolated contexts, exchanging structured notes — with the single-agent control design written alongside (the comparison is the deliverable's spine).

## Why this exists
Multi-agent is the most overclaimed pattern in the field. The honest version: parallel reads, isolated contexts, an orchestrator that plans and synthesises — and a head-to-head against the single agent you already have, on the same tasks, because Anthropic's +90% research-eval result came with ~15× token cost, and Cognition's counter-argument (parallel writes conflict) is designed *around*, not ignored.

## Prerequisites
Deployment frozen (Week 2); Month 3 context engineering (notes, budgets) live. Reading: Anthropic, 'How We Built Our Multi-Agent Research System' + Cognition, 'Don't Build Multi-Agents' — both, before designing.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 2, Lesson 6 (Deep build — deployment report v1 + stakeholder review)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 2, Lesson 6 (Deep build — deployment report v1 + stakeholder review)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Design constraints (from the two readings + your Month 3 evidence): workers are read-only (search/lookup tools only — no writes, no gates); workers get *task-scoped* contexts (the orchestrator's plan slice, not the whole history); workers return structured notes (Month 3 note schema), not raw transcripts; the orchestrator owns synthesis + citations; fan-out capped; per-worker budgets from Month 2 controls. The control: the same tasks run by the single agent with the same total token ceiling — cost-normalised comparison, or the comparison is marketing.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Write the design doc
`capstone/multi-agent-design.md`: topology, worker contract (inputs/outputs), isolation rules, budget allocation, the prohibited list (writes, cross-worker chatter).

**Expected output:** Design committed; every rule traces to a reading or a Month 3 lesson.

### Step 2 — Define the comparison protocol
Task set: 15 research-shaped tasks (multi-source synthesis from the corpus + customer docs); metrics: success (judged + mechanical), tokens, wall-time, cost per success; cost-normalised control defined.

**Expected output:** Protocol committed *before* implementation (pre-registration discipline, Month 1 style).

### Step 3 — Failure pre-mortem
List the 5 likeliest multi-agent failure modes for this design (duplicated work, note loss, synthesis hallucination, budget burn, citation tangles) + the trace signal for each.

**Expected output:** Pre-mortem in the design doc; trace signals are checkable in your span schema.

### Step 4 — Scope the build
Two-lesson build plan (Lessons 2–3) with the minimum viable topology: orchestrator + 2 worker roles.

**Expected output:** Build plan committed; anything beyond the minimum is explicitly deferred.

## Independent verification (checkpoint)
A design + pre-registered comparison protocol exist before a line of multi-agent code — the comparison can now embarrass the design, which is the point.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the five design constraints and the source (reading/lesson) behind each.
2. Prediction: on which task shape will multi-agent win, and on which will the control win? Commit per task category in the protocol.
3. Teach-back: hold both readings at once — Anthropic's result and Cognition's warning — as one coherent position in 4 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
