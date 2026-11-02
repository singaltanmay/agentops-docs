# Red team II — fixed sets: injections corpus + AgentDojo

**Week 4 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Run two fixed benchmarks against the target: the deepset prompt-injections set (as a classifier/detection eval) and an AgentDojo subset (injections living in tool outputs) — recording detection rate and task+attack outcomes.

## Why this exists
Generated suites (Lesson 1) know your surface but not the field's history; fixed sets carry the community's known attacks. AgentDojo matters most: its injections live in *tool outputs* — your issue-lookup and MCP results are exactly that channel.

## Prerequisites
Lesson 1 baseline table committed.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 4, Lesson 1 (Red team I — promptfoo redteam suite against your own system)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4 Week 3):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 4, Lesson 1 (Red team I — promptfoo redteam suite against your own system)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Sets: **deepset/prompt-injections** (662 labelled: injections + legitimate) — run as: does your stack flag the injections / pass the legitimate? If no detector exists yet, the result is 'no detector' with the set staged for Lesson 4's Prompt Shields comparison. **AgentDojo** (`ethz-spylab/agentdojo`): run a task subset your tools can express; score **both** task success and attack success — the benchmark's whole point is the pair. **UNVERIFIED:** AgentDojo's exact task counts/API for the version you install; its docs govern, and you record the subset you actually ran.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Stage the deepset set
Download from Hugging Face (`deepset/prompt-injections`); wire it as an eval against your input path (detector if present, else the model's raw behaviour on the injection items).

**Expected output:** Set runs; per-class results recorded (injection flagged %, legitimate passed %).

### Step 2 — Run an AgentDojo subset
Select the tasks expressible with your tools; run undefended (current build) and record (task success, attack success) pairs.

**Expected output:** Subset results committed with both numbers per task group.

### Step 3 — Compare channels
One table: direct input injection (Lesson 1 + deepset) vs tool-output injection (AgentDojo) — success rates side by side.

**Expected output:** Comparison committed; the channel gap (expect tool-output worse) is quantified.

### Step 4 — Feed the taxonomy
Add security categories to the failure taxonomy (injection-direct, injection-indirect, leakage, agency) with today's counts.

**Expected output:** Taxonomy gains a security section; Month 4's hardening list (Lesson 4) inherits it.

## Independent verification (checkpoint)
Both fixed sets run with honest dual numbers (detection; task+attack), and the direct-vs-indirect channel comparison is quantified.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state AgentDojo's dual scoring and why a single 'attack blocked %' would lie.
2. Prediction: your issue-lookup tool returns an issue whose body instructs the agent to exfiltrate. Walk today's defences in order — which fire, which don't exist yet?
3. Transfer: the deepset set is text-only English-ish injections. Name two injection shapes it cannot contain that your surface invites.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
