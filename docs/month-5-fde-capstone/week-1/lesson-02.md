# Messy data onboarding — the customer's corpus, honestly

**Week 1 · Build · 75 min** · Month 5 — FDE Capstone

## Objective
Ingest the customer's corpus with the Month 1 pipeline (corpus-agnostic by design — this is the test) and produce the data-quality report: what parsed, what didn't, what's duplicated/contradictory — before any tuning.

## Why this exists
Real corpora are not the Kubernetes docs: mixed formats, stale versions, near-duplicates that contradict each other. The Month 1 design requirement ('the fallback switch costs days, not weeks') gets its exam today.

## Prerequisites
Lesson 1 brief signed; pipeline from Month 1 + Month 2 hardening in place.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 1, Lesson 1 (The customer brief — scope, constraints, success criteria)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 4, Week 4 (red team + hardening)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 1, Lesson 1 (The customer brief — scope, constraints, success criteria)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Onboarding protocol: inventory first (formats, sizes, date ranges, owners), parse with the existing structure-aware path, and *measure* the deltas the mess creates (parse-failure rate, chunk-count anomalies, duplicate clusters). Contradictions are data, not noise: near-duplicate documents with different answers get flagged for the customer (they're a finding about their docs, and a golden-set hazard). No silent drops — the Month 1 rule, now with a customer watching.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Inventory the corpus
Catalogue: source, format, count, size, freshness, owner per collection.

**Expected output:** Inventory table in `capstone/`; totals reconcile with the source (counts by collection).

### Step 2 — Run the pipeline unmodified first
Ingest as-is; log every failure class (parse, encoding, oversized, empty).

**Expected output:** Ingestion run completes; failure classes counted; index counts reconcile or every gap is a logged class.

### Step 3 — Duplicate/contradiction pass
Near-duplicate detection over chunks (embedding similarity is already available); cluster and sample-inspect 10 clusters.

**Expected output:** Report lists clusters with a verdict sample: true duplicate / version pair / genuine contradiction.

### Step 4 — Data-quality report + customer note
Write the report; translate the top 3 findings into customer language (what it means for their answers) in the stakeholder log.

**Expected output:** Report committed; stakeholder log entry written in non-jargon.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Parse failures concentrated in one format | That format needs a real parser path, not retries | Scope it as a named work item with an hour estimate in the brief's risk section — FDE honesty, not heroics |
| Contradictions dominate a topic area | Customer's docs genuinely disagree | Surface as a customer decision (which source wins) — never pick silently; the golden set (Lesson 3) excludes contested items until decided |

## Independent verification (checkpoint)
Corpus ingested with reconciled counts; data-quality report quantifies mess instead of hiding it; top findings communicated in the stakeholder log.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: list the failure classes found and their counts (approximately) — and which class surprised you.
2. Planted-bug: the pipeline 'handles' a contradictory doc pair by indexing both silently. Which Month 1 eval property degrades, and which golden-set design rule was meant to catch this?
3. Transfer: the fallback-corpus portability claim (days, not weeks) — grade it from today's evidence. What actually cost time?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
