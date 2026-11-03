# Postgres joins — provision B1ms in IaC with stop/start discipline

**Week 2 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Add PostgreSQL Flexible Server **B1ms** to the Bicep so the project environment reproduces it, with the Month 2 budget line (~$17 incl. storage) respected and a stop/start habit encoded — verified by a deployed server accepting a connection from your API's managed identity path (or admin connection from your IP for this first lesson).

## Why this exists
Month 2+ state (conversations, feedback, eval results, later LangGraph checkpoints) needs a real database. B1ms at $12.41/mo compute is the budget-shaped choice; B2ms/B4ms are banned by the roadmap.

## Prerequisites
Week 1 gate passed; Month 1 Bicep reproduces the environment cleanly.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 6 (Deep build — reranker depth and top-k sweep; ablation report draft)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 2 Week 1, Lesson 4):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 6 (Deep build — reranker depth and top-k sweep; ablation report draft)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Flexible Server Burstable B1ms (1 vCore, 2 GiB). Storage is extra per GB — budget ~32 GB inside the $17 line (**UNVERIFIED:** the exact storage $/GB-mo rate for your region; confirm in the Azure pricing calculator and record the number in the project README). Stop/start is a first-class Flexible Server feature — stopped servers don't bill compute; use it outside work blocks this month.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Add the server to Bicep
PostgreSQL Flexible Server, SKU B1ms, ~32 GB storage, same region/VNet posture as the existing resources; admin credentials into Key Vault, never into code or git.

**Expected output:** `azd up` / apply succeeds; server listed with the B1ms SKU in `az postgres flexible-server list -o table` (**UNVERIFIED:** exact CLI subcommand spelling for your az version — `az postgres flexible-server --help` is ground truth).

### Step 2 — Connect and smoke-test
Connect with `psql` using the Key Vault credential; create the `agentops` database; run `SELECT version();`.

**Expected output:** Version string returned; the connection string lives only in Key Vault / app settings references.

### Step 3 — Encode stop/start
Add a Makefile/script pair `db-up` / `db-down` wrapping stop/start, and note the habit in the project README: down outside work blocks.

**Expected output:** Script runs; server state shows `Stopped` after `db-down` and returns to `Ready` after `db-up` (start takes minutes — expected, not a failure).

### Step 4 — Update the resource table + budget view
Project README resource table gains the Postgres row (SKU cap B1ms, est. cost); confirm the Cost Management forecast still lands inside the Month 2 column.

**Expected output:** README committed; forecast ≤ ≈$152 or the overage line identified by name.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Apply picks a General Purpose SKU | Template default crept in | Hard-code the B1ms SKU in Bicep (roadmap cost-control rule 2); fixed when the deployed SKU reads B1ms |
| Connection timeouts from home | Server firewall doesn't include your IP | Add your current IP to the server firewall for dev; note production posture (private access) as a documented upgrade path, not today's work |

## Independent verification (checkpoint)
Deployed B1ms server, `SELECT version();` answered, stop/start scripts both demonstrated once, README + forecast updated.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: write the three budget facts about Postgres in this plan (SKU, monthly line, the banned SKUs and why).
2. Prediction: you leave the server running all month vs stopping it nightly — what's the approximate cost difference, and which line absorbs it?
3. Transfer: a teammate proposes putting the vector index in Postgres *instead of* AI Search today. What experiment (later this week) settles that, and why not decide now?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
