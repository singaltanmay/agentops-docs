# Deep build — extensions integrated: multi mode + LoRA verdict into the deployment

**Week 3 · Deep build · ~3 hrs** · Month 5 — FDE Capstone

## Objective
Integrate Week 3's outcomes into the deployment story: multi-agent mode offered where the verdict supports it (with its cost visible), the LoRA verdict appended, and the deployment report updated to v2 — then a full regression (all suites + security spot battery) on the extended build.

## Why this exists
Extensions that bypass the platform's regression discipline are how capstones rot. This build proves the opposite: new capabilities land *through* the instruments, and the report grows by appendices without rewriting v1's claims.

## Prerequisites
Lessons 1–5 (Week 3) done; deployment freeze from Week 2 as the comparison reference.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 5 Week 3, Lesson 5 (LoRA experiment II — run it, eval it, verdict it)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 5 Week 2):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 5 Week 3, Lesson 5 (LoRA experiment II — run it, eval it, verdict it)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Integration rules: multi mode ships only in the categories the head-to-head won, with per-request cost shown (it's ~an order of magnitude more expensive — hiding that is how platforms lose trust); the LoRA artefact, if kept, ships behind its eval like any model change (gate run required); if rejected, the rejection ships as documentation.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Wire multi mode per the verdict
Router/config updated: multi offered only in winning categories; cost note in the API response metadata.

**Expected output:** Staged tasks in winning/losing categories route as the verdict dictates.

### Step 2 — Full regression battery
All suites (RAG, agent, long, customer) + leakage battery + redteam spot set on the extended build vs the Week 2 freeze.

**Expected output:** Battery results tabled; any regression vs freeze is named with a run ID.

### Step 3 — Deployment report v2
Appendices: multi-agent verdict, LoRA verdict, updated outcome table (unchanged v1 claims preserved).

**Expected output:** v2 tagged; v1→v2 diff is appendices + the outcome refresh only.

### Step 4 — Stakeholder log: extensions entry
Customer language: what the research mode does, what it costs, what the fine-tuning experiment concluded.

**Expected output:** Entry written; cost stated plainly.

## Independent verification (checkpoint)
The extended build passes the full battery against the freeze, and report v2 integrates both Week 3 verdicts without rewriting history.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state what shipped from Week 3, what didn't, and the evidence for each decision.
2. Teach-back: 'Your capstone, end to end' — 3 minutes, deployment + extensions, ending with the two honest limitations.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
