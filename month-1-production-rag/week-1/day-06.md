# Day 6 — The corpus — Kubernetes docs, pinned and counted

**Week 1 · Build · 75 min** · Month 1 — Production RAG

## Objective
Clone `kubernetes/website` pinned to a release branch, scope to English Concepts + Tasks, count and record the pages, and upload the raw docs to Blob — verified by Blob container counts matching your local scoped count.

## Why this exists
This corpus is the product for the next three weeks: hierarchical docs with headings, code, and YAML — exactly the shape that makes hybrid retrieval measurably beat vector-only. Pinning and counting now is what makes Week 2's chunk counts auditable instead of vibes.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 5):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 3):** one generative item — write the key command, schema, or rule from that day without looking.
3. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
4. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 5's independent verification ("Walking skeleton — live completion from a container") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Direct instruction (you're expert here):** no worked example — git and file handling are your home turf (expertise reversal: guidance would be extraneous load). Spec only: pinned branch, scoped directories, counts recorded in `data/corpus-manifest.json`. One warning that is new: *contamination* — K8s docs are heavily represented in LLM training data, so models can fake RAG success from memory. The countermeasure is architectural and starts today: every future golden answer must cite a chunk ID, and scoring will check the citation, not just the text.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Clone pinned
`git clone --branch <recent release branch> --depth 1 https://github.com/kubernetes/website` (repo address per the research report). Record the branch + commit SHA in the manifest. Verify the repo LICENSE at clone time (docs contributions CC BY-SA 4.0 per contributor guidance — confirm, don't assume).

**Expected output:** Manifest contains branch + SHA; LICENSE file checked and noted.

### Step 2 — Scope and count
Scope = `content/en/docs/concepts/` + `content/en/docs/tasks/`. Count Markdown files; also count files with code fences and files with YAML blocks (quick greps) — those subsets predict where BM25 will shine.

**Expected output:** Three numbers in the manifest. Research expectation: order of ~1,000 pages scoped — your count is the truth; if it's wildly off, your scope paths are wrong.

### Step 3 — Upload raw to Blob
Upload the scoped tree to the `corpus` container preserving paths (`az storage blob upload-batch` or your SDK script). Paths become metadata later — keep them clean now.

**Expected output:** Blob file count == local scoped count. Any delta is named and explained today.

### Step 4 — Write the corpus card
In `data/README`: scope, branch, SHA, counts, licence, the contamination note, and the fallback trigger ('if vector-only baselines score suspiciously high on correctness while citation accuracy is poor → evaluate the SEC EDGAR fallback').

**Expected output:** Corpus card committed. This paragraph is what Future You cites in the Month 1 retrospective.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Counts differ local vs Blob | Hidden files / non-Markdown assets swept in or dropped | Diff by extension; fixed when counts reconcile to the file, with exclusions listed explicitly |
| Clone is enormous / wrong branch | Full-history clone or default branch drift | Re-clone shallow on the pinned branch; fixed when SHA in the manifest matches the branch head |
| Scope includes generated reference docs | Reference section is API-generated bulk — it swamps Concepts/Tasks signal | Exclude it deliberately and note the exclusion; it can join in Month 2 if a use case appears |

## Independent verification (checkpoint)
`az storage blob list` count for the corpus container equals the manifest's scoped count, and the manifest's SHA resolves in your clone (`git rev-parse`). Numbers matching across two systems is the verification — not 'the upload seemed to work.'

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: explain the contamination problem and the citation-check countermeasure to an imaginary colleague in 3 sentences.
2. Prediction: which scoped subset (prose concepts vs YAML-heavy tasks) will show the largest hybrid-vs-vector gap in Week 3, and why? Write it down — Week 3 grades this prediction.
3. Generative recall: the three manifest counts and what each predicts.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: the Week 1 gate — teardown and one-command redeploy from clean state, plus the spend check. Do not tidy anything by hand tonight; the gate tests the system as it is.
