# LangGraph rebuild II — workflow patterns as subgraphs

**Week 1 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Re-express Month 2's router, evaluator-optimizer, and parallel-reads patterns as graph structures (nodes/subgraphs) with identical external behaviour — verified by the pattern-level staged tests from Month 2 passing unchanged.

## Why this exists
Patterns-as-code was Month 2; patterns-as-graphs is what the framework is *for*: the routing rubric, the judge loop, and the fan-out become inspectable structure instead of control flow buried in a loop.

## Prerequisites
Lesson 1 equivalence established.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 1, Lesson 1 (LangGraph rebuild I — the raw loop as a state graph)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2, Week 3 (raw agent loop)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 1, Lesson 1 (LangGraph rebuild I — the raw loop as a state graph)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Subgraphs let a pattern be a node: the router subgraph classifies and routes; the evaluator subgraph owns generate→judge→revise; parallel reads use the framework's fan-out over independent sub-questions (Month 2's independence test still governs *whether* to fan out). Behaviour parity is the bar — Month 2's staged test sets are the regression suite. **UNVERIFIED:** the exact fan-out/send API spelling for your pinned version — official docs govern.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Router as entry subgraph
Port the router: classification node → conditional edges to `rag` / `agent` / `refuse` branches.

**Expected output:** Month 2's 30-request routing set scores ≥ its Month 2 accuracy through the graph.

### Step 2 — Evaluator-optimizer as a subgraph
Port generate→judge→(revise once) with rubric-v1 unchanged; the subgraph is invoked from the answer path exactly where Month 2 gated it.

**Expected output:** The deliberately-ungrounded staged draft is still caught; revision rate logged as before.

### Step 3 — Parallel reads via fan-out
Port the splitter + bounded fan-out + merge with citation preservation.

**Expected output:** Compound-question staged set: citations survive the merge; the dependent question still declines to parallelize.

### Step 4 — Retire the raw loop — carefully
Raw loop stays in the repo, tagged, as the reference implementation; the graph becomes the served path behind the same API.

**Expected output:** API serves the graph build; raw loop runnable via a flag for Month 4 comparisons.

## Independent verification (checkpoint)
All three Month 2 pattern test sets pass through the graph at parity or better; the served path is the graph; the raw loop is preserved and runnable.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: for each pattern, name what the graph representation makes *visible* that the loop code hid.
2. Planted-bug: a conditional edge routes `refuse` requests into the agent branch when confidence is missing. Where do you look first — node, edge, or state? Walk the diagnosis.
3. Teach-back: 'Why port patterns instead of rewriting them idiomatically?' — the eval-parity argument in 3 sentences.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
