# HyDE-style hypothetical-document retrieval, measured

**Week 1 · Build · 75 min** · Month 2 — RAG Hardening + Agents

## Objective
Implement HyDE (embed a model-generated hypothetical answer, retrieve against it) behind a harness flag and measure it against the Lesson 2 winner — kept or dropped on the numbers.

## Why this exists
HyDE is the most-cited query-side technique you haven't tested. Testing it — including if the answer is 'no' — is what separates an ablation report from a feature list.

## Prerequisites
Lesson 2 decision recorded; harness stable.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 2 Week 1, Lesson 2 (Query rewriting — multi-query and decomposition, measured)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 1, Week 3 (retrieval shootout)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 2 Week 1, Lesson 2 (Query rewriting — multi-query and decomposition, measured)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
HyDE: prompt the model to write a plausible answer passage, embed *that*, and use it as the retrieval query — the hypothetical doc lives in document-space, not question-space. Known risk in this corpus: the model can hallucinate plausible-but-wrong K8s specifics, dragging retrieval toward the hallucination. Contamination awareness applies.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Implement behind a flag
Add `rewrite: hyde` as a third mode: generate one hypothetical passage (~150 words), embed it, retrieve, fuse with the raw-query results (never replace raw).

**Expected output:** Retrieval log shows the hypothetical passage stored alongside the query for inspection.

### Step 2 — Run head-to-head
Ablate: Lesson 2 winner vs winner+HyDE, frozen everything else.

**Expected output:** Two rows appended with quality + latency + cost.

### Step 3 — Inspect 5 hypothetical passages
Read them against the pinned docs. Mark each: accurate / plausible-but-wrong / off-topic.

**Expected output:** Inspection note committed; the plausible-but-wrong count is quoted in the decision.

### Step 4 — Decide and record
Keep/drop with numbers, as in Lesson 2.

**Expected output:** Decision record committed in the ablation report draft.

## Independent verification (checkpoint)
Two comparable harness rows + the 5-passage inspection note + a decision that references both.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: why does embedding a hypothetical *answer* sometimes beat embedding the question? Answer in embedding-space terms.
2. Prediction: for which golden category (factoid / config-YAML / troubleshooting / multi-hop) do you expect HyDE to help most, and which to hurt most? Check against the per-category results after answering.
3. Transfer: a SEC EDGAR corpus (fallback dataset) — would your HyDE verdict transfer? What changes?

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
