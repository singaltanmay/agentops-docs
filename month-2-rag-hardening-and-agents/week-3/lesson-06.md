# Deep build — the 50-task multi-step benchmark: agent vs RAG baseline

**Week 3 · Deep build · ~3 hrs** · Month 2 — RAG Hardening + Agents

## Objective
Construct a 50-task multi-step benchmark (tasks needing ≥2 tool uses or multi-hop reasoning), run the raw-loop agent and the single-call RAG baseline against it, and publish the comparison: task success, avg steps, cost and latency per *successful* task, failures coded to taxonomy v1.

## Why this exists
This is P2's measurable claim and a core interview artefact: 'agent beats RAG baseline on multi-step tasks — or the failure analysis explains why not.' Either result is valuable; an unmeasured agent is not.

## Prerequisites
Week 3 lessons complete; budgets + cost footer live; taxonomy v1 exists.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 3, Lesson 5 (Consolidation — agent failure taxonomy v1 + mixed gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 3, Lesson 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 3, Lesson 5 (Consolidation — agent failure taxonomy v1 + mixed gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Task design: mine tasks from the filtered issues + docs (troubleshooting chains, comparisons, compute-over-docs). Scoring: deterministic checks where possible (expected chunk/fact present), judge-scored only where necessary and flagged as such. Baseline fairness: the RAG baseline gets the same question and its best single retrieval — no strawmen.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Build the 50 tasks
`evals/agent-tasks-v1.jsonl`: task, category, expected evidence (chunks/facts), scoring rule per task. Mix: ~60% multi-hop docs, ~25% issue-troubleshooting, ~15% mixed tool (calc/lookup).

**Expected output:** 50 rows validate against the schema; scoring rule present for every row.

### Step 2 — Run the baseline
Single-call RAG (Month 2 best config) over all 50; record success + cost + latency.

**Expected output:** Baseline row set committed; success rate computed.

### Step 3 — Run the agent
Same 50 through the raw loop with budgets on; full traces saved.

**Expected output:** Agent row set + 50 traces committed; failures auto-tagged where a budget fired.

### Step 4 — Score, code, and write it up
Success rates, cost/latency per successful task (not per attempt), failure counts by taxonomy category; one-page write-up in the ablation report.

**Expected output:** Write-up committed; every failure is either taxonomy-coded or the taxonomy gains a category (that's allowed — note it).

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Baseline 'wins' on multi-hop tasks | Tasks weren't actually multi-step, or baseline retrieval got lucky via contamination | Audit 5 baseline wins: did the answer cite the right chunks? Citation-checked wins only |
| Agent cost per success explodes | Loops succeeding rarely and expensively | Report cost per *successful* task honestly — that number is the Month 3 optimisation target |

## Independent verification (checkpoint)
50 tasks, two complete result sets, taxonomy-coded failures, and a write-up whose headline numbers reproduce from the committed artefacts.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the benchmark's fairness rules (baseline's rights, scoring rules, contamination check) from memory.
2. Prediction: which task category will show the largest agent-vs-baseline gap, and which the smallest? Commit before reading results.
3. Teach-back: state the headline result and the top failure category's named Month 3 fix.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
