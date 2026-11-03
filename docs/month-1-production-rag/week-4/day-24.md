# Day 24 — Golden set III — issue-derived troubleshooting rows

**Week 4 · Build · 60 min (light)** · Month 1 — Production RAG

## Objective
Mine filtered closed GitHub issues into ~25 troubleshooting golden rows with answers re-verified against the pinned docs — verified by each row linking its issue and its doc chunk, with the doc (not the issue thread) as the answer's authority.

## Why this exists
Issues are where real user language lives — symptoms, error strings, half-wrong premises. They fix the golden set's biggest bias (questions written by the person who built the system). The discipline: an issue proposes the question; the pinned docs dispose the answer. A maintainer's 2023 answer to a differently-versioned problem is a trap, not a source.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 23):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 21):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 17):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 23's independent verification ("Golden set II — docs batch 2 + multi-hop") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Direct instruction — the filter:** closed + answered + labelled, deduplicated against bot/template noise, symptom phrasing preserved, then rewritten as a standalone question (no 'as discussed above' references). Answer re-derived from your pinned branch's docs; where issue and docs disagree, docs win and the disagreement itself is noted — version drift is a finding.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Filter the issue pool
From `kubernetes/kubernetes` closed issues: answered, non-bot, symptom-bearing. Skim titles fast; shortlist ~40 candidates in a scratch file.

**Expected output:** Shortlist exists with issue links; obvious template/bot noise excluded by stated criteria, not taste.

### Step 2 — Convert ~25 to golden rows
Question from the symptom (user language preserved), answer from pinned docs, chunks cited, category troubleshooting. Flag any row whose docs answer differs from the thread's accepted answer.

**Expected output:** ~25 rows validate; every row carries both provenance links (issue + chunk).

### Step 3 — Count and rebalance
Running totals by category vs the recipe (≈95 docs / 40 issues / 25 unanswerable at 160). Note what's missing.

**Expected output:** Rebalance note written — tomorrow's long block fills the named gaps, not random rows.

### Step 4 — Friday cost + progress review
Spend vs plan; golden count; one paragraph: is the set's difficulty honest? (If you'd score 100% by hand, it's too easy.)

**Expected output:** Review committed.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Issue answers contradict pinned docs | Version drift — expected, and the reason for the re-verify rule | Docs win; note the drift on the row; if drift is rampant in a topic, that topic's rows get extra scrutiny |
| Issues are feature requests in disguise | Filter leak | Symptom test: does the title describe something broken/observed? If not, drop it; fixed when the shortlist re-passes the symptom test |
| Rows duplicate doc-batch questions | Same underlying fact, two provenances | Keep the issue version (better phrasing), cut or repurpose the doc one; fixed when a dedupe pass by expected-chunk finds no near-dupes |

## Independent verification (checkpoint)
Sample 5 rows: follow issue link → follow chunk → confirm the reference answer is the docs' answer. Provenance is clickable and correct, 5/5.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: 'an issue proposes, the docs dispose' — explain the failure this rule prevents, with a concrete shape of example.
2. Generative recall: the issue filter's criteria, in order.
3. Prediction: will issue-derived rows score lower on context recall or on faithfulness in the Ragas run? Commit to one, with a mechanism.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Weekend long block: the adversarial/unanswerable batch + freeze prep. Bring your Day 22 prediction (worst category) — the unanswerable set is designed to stress exactly the refusal behaviour it depends on.
