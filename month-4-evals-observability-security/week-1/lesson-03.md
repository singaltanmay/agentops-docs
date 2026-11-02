# Failure-analysis sprint — 100 traces, read by you

**Week 1 · Build · 75 min** · Month 4 — Evals, Observability & Security

## Objective
Personally read and open-code 100 production-shaped traces (sampled from Month 3's runs + live traffic shape) and update the failure taxonomy to v3 with counted categories — the judge rubric (Week 2) is built from this table, not invented.

## Why this exists
This is the Hamel method at full strength and the highest-leverage lesson of the month: evals built from *observed* failures measure the system you have; evals built from imagination measure a system you don't.

## Prerequisites
Lessons 1–2 done; traces queryable (Month 3 span schema).

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 4 Week 1, Lesson 2 (Deterministic checks first — the scorer layer that isn't a judge)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (first failure taxonomy)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 4 Week 1, Lesson 2 (Deterministic checks first — the scorer layer that isn't a judge)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Sampling: all failures since the Month 3 gate + a random success slice (near-misses hide in successes — a budget stop that 'completed' is a failure in costume). Open-code first (no categories while reading), then group against taxonomy v2, then count. Effort rule: you read them; the judge does not pre-read them for you — a model summarising failures for you reintroduces exactly the blindness this exercise removes.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Draw the sample
Query: all failed runs since Month 3 gate + random 25 successes; export trace IDs to the reading log.

**Expected output:** Sample ≈100 traces; composition recorded (failures vs successes).

### Step 2 — Read + open-code
Read each trace; one-line code per failure/near-miss in a scratch file. No grouping until the reading is done.

**Expected output:** Reading log shows 100 entries with codes; this takes the bulk of the session — that's correct.

### Step 3 — Group into taxonomy v3
Merge codes into v2's structure (extend where the data demands); count per category; name the owning layer + the catching eval per category.

**Expected output:** Taxonomy v3 committed with counts; every top-5 category names its eval.

### Step 4 — Select judge targets
From v3, pick the 2–3 judgment-shaped categories Week 2 will build judges for (mechanical ones route to Lesson 2-style checks instead).

**Expected output:** Judge target list committed with the counts that justify it.

## Independent verification (checkpoint)
100 traces actually read (log proves it); taxonomy v3 counted; judge targets selected from evidence.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: taxonomy v3's top 5 with approximate counts and owning layers, from memory.
2. Prediction: which category will prove hardest to judge reliably, and what property makes it hard?
3. Teach-back: why does the method forbid pre-summarising traces with a model before you read them?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
