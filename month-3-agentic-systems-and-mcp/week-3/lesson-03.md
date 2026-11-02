# Model routing — cost/latency tiers inside the agent

**Week 3 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Add model routing inside the agent: cheap model for classification/rewriting/compaction, main model for generation, judge model for evaluation — with per-node model choice in config and a measured cost comparison on the task subset.

## Why this exists
Postings ask for model routing by cost/latency/quality by name. You already own three deployments (mini / 4.1-mini judge / embeddings); this lesson makes the assignment deliberate and measured instead of habitual.

## Prerequisites
Lessons 1–2 done; per-task cost accounting (Month 2) live.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 3, Lesson 2 (Compaction + structured note-taking)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 2 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 3, Lesson 2 (Compaction + structured note-taking)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Routing principle: assign the *weakest sufficient* model per node, and prove sufficiency with the eval subset, not vibes. Candidates: router classification (already mini), compaction (try mini vs current), tool-arg generation, final generation (stays main), evaluator (stays judge model — Month 2 Lesson 4 of Week 4's self-bias warning applies). Any change ships only if the 10-task subset holds quality within noise.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Inventory node→model assignments
Table in the migration log: every model call in the graph, its current model, its input size profile.

**Expected output:** Inventory committed; at least one assignment is 'by habit, untested' — name it.

### Step 2 — Test the weakest-sufficient swaps
For each candidate node, run the 10-task subset with the cheaper model; compare success + failure classes.

**Expected output:** Per-node rows recorded; quality deltas classified (noise / real).

### Step 3 — Implement routing config
Model per node in config with the tested assignments; trace logs model per call.

**Expected output:** Traces show model names; a config change demonstrably reroutes a node.

### Step 4 — Publish the saving
Cost per successful task: before vs after routing, on the subset.

**Expected output:** Saving (or honest 'no saving — quality cost too high') recorded with numbers.

## Independent verification (checkpoint)
Node→model inventory + tested assignments in config; subset quality held; cost-per-success delta published either way.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list your nodes with their assigned models and the evidence for the least obvious assignment.
2. Prediction: which node breaks first if you swap in a much weaker model — and what does its failure look like in the taxonomy?
3. Teach-back: why must the evaluator *not* be routed to the generator's model to save money? Connect to judge calibration (Month 4).

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
