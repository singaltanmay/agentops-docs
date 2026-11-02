# Day 8 — Ingestion I — your own heading-aware parser

**Week 2 · Build · 75 min** · Month 1 — Production RAG

## Objective
Parse every scoped Markdown page into structured documents (title, section path, URL, version, body, code blocks intact) — verified by parser output counts matching the Day 6 manifest with zero unhandled files.

## Why this exists
You build the hand-rolled path first because it's the one you can debug at 11pm: when retrieval fails in Week 3, 'which chunk, from which heading path' must be answerable in seconds. The platform path (Day 11) is judged against this one's debuggability, not the reverse.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 7):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 5):** one generative item — write the key command, schema, or rule from that day without looking.
3. **7 days ago (Day 1):** one interleaved item from that day, mixed unlabelled with the others — discrimination between similar ideas is the point.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 7's independent verification ("Week 1 gate — teardown and clean redeploy") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Worked example → completion:** the pattern is 'parse one page perfectly, then generalise.' Worked example: trace one Concepts page by hand — where headings split, where a code fence must not split, what metadata a reader would want. Then the parser skeleton is given as a completion problem: traversal + file handling written, the split/metadata logic blanked for you.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Define the document schema first
Fields: `id, title, section_path (breadcrumb), source_url, version (pinned branch), body, has_code, has_yaml`. Write it as a typed model before any parsing. Every later chunk, citation, and golden row references these fields.

**Expected output:** Schema committed; Day 6's manifest fields map 1:1 onto it.

### Step 2 — Parse structure, don't regex blindly
Split on ATX headings preserving the breadcrumb stack; never split inside a fenced code block; front-matter parsed, not treated as body. Keep the page→sections mapping explicit.

**Expected output:** One hand-traced page parses to the sections you predicted, code fences whole.

### Step 3 — Run the corpus, count ruthlessly
Parse all scoped pages to `data/parsed.jsonl`. Report: pages in, documents out, files skipped + why, empty bodies.

**Expected output:** Pages in == manifest count; skips are an explicit list (target: zero unexplained). Empty-body count named — short stub pages are data, silent drops are bugs.

### Step 4 — Smoke-test debuggability
Pick 3 random documents; for each, state its source page + heading path from the record alone, then verify against the raw file.

**Expected output:** 3/3 traceable in under a minute each. This is the property Week 3 will thank you for.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Code block split across documents | Splitter ignored fence state | Track in-fence state in the splitter; fixed when a grep finds no document ending mid-fence |
| Breadcrumb wrong after nested headings | Heading stack not popped on shallower levels | Fix stack discipline; fixed when the hand-traced page matches exactly |
| Front-matter leaks into body | Parser treats YAML header as content | Parse front-matter separately; fixed when no document body starts with `---` |

## Independent verification (checkpoint)
Independent count check: `wc -l data/parsed.jsonl` reconciles with a per-page section sum you compute a second way (e.g. heading count across the raw tree). Two methods, one number.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Prediction: given a page with an H2, two H3s, and a code fence spanning an H3-looking line inside it — how many documents, with what breadcrumbs? Answer before running.
2. Teach-back: why does `section_path` exist as a field? Name the Week 3 behaviour it enables (hint: it's in the citation UI).
3. Generative recall: the schema's eight fields, closed-book.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: chunking — the parsed documents become retrievable units, four ways. Tonight, think about one question: what makes a chunk 'good' for a how-to question vs a config question? Tomorrow measures your answer.
