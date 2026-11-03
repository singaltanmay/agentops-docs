# Ablation harness — freeze the experiment protocol

**Week 1 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Turn Month 1's ad-hoc experiments into a scripted ablation harness that runs any retrieval configuration against the golden tuning split and writes a comparable results row — verified by two configs producing two rows in one results table from one command.

## Why this exists
Months 2–4 are ablation-driven. Without a frozen protocol (fixed questions, fixed scorer, one variable at a time), every 'improvement' is unfalsifiable. This harness is the instrument.

## Prerequisites
Month 1 complete: `golden-v1.0` frozen, Ragas report committed, winning retrieval config live.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 1, Day 31 (month gate)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 4 (golden set + Ragas)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 1, Day 31 (month gate)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
One variable at a time, everything else frozen: same questions (tuning split only — the 30 held-out questions are never touched), same judge, same scorer version. Every run records config hash + git commit so a number can always be traced to the exact system that produced it.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Freeze the splits in code
In the project repo, encode the split explicitly: tuning = all `golden-v1.0` rows except the 30 held-out IDs; held-out access requires an explicit `--held-out` flag that logs a warning line. Commit.

**Expected output:** `--help` shows the flag; a default run prints `split=tuning n=130`.

### Step 2 — Parameterise the pipeline
Refactor the retrieval/generation path so chunking config, embedding model, retrieval mode, top-k, and ranker on/off are run-time parameters, not code edits.

**Expected output:** One config file change switches retrieval mode; no source diff in `git status`.

### Step 3 — One-command run
Wire the harness: `python -m evals.ablate --config configs/base.yaml` runs retrieval + generation + scoring and appends one row (config, Recall@5/@10, faithfulness, latency p50/p95, cost) to `evals/results/ablations.csv`. Exact module layout is your design — the CLI shape above is this lesson's spec, adapt names to your repo.

**Expected output:** Two runs with different configs append two rows; row values differ only where the config differs.

### Step 4 — Reproduce Month 1's headline numbers
Run the harness on the Month 1 winning config and on the vector-only ablation.

**Expected output:** Both rows land within noise of the Month 1 Ragas report. A large discrepancy = the harness differs from the Month 1 setup — find it now, not after 6 more ablations.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Held-out questions appear in a tuning run | Split encoded by position, not by ID | Encode the held-out ID list explicitly; assert intersection is empty at harness start |
| Same config, different scores across runs | Judge variance or unpinned temperature | Pin judge model + temperature in the config; report run-to-run delta in the results row |

## Independent verification (checkpoint)
From a clean shell: one command, two configs, two comparable rows in `ablations.csv`, and the Month 1 numbers reproduced within noise. The held-out assertion fires when you deliberately point the harness at a held-out ID.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the harness's run contract — inputs, outputs, and the three things frozen across runs.
2. Prediction: a teammate tunes on the held-out set 'just to check'. What exactly breaks, and which later number becomes meaningless?
3. Transfer: design the config diff for testing 'semantic ranker off' — which fields change, which must not?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
