# Day 5 — Walking skeleton — live completion from a container

**Week 1 · Long build · 2–3 hrs** · Month 1 — Production RAG

## Objective
Deploy a minimal FastAPI app to Container Apps that returns a live gpt-4o-mini completion through managed identity — verified by `curl` to the public URL returning a model completion, with the app seeing no key.

## Why this exists
If this works, the whole platform works: image build, registry, container environment, identity, model call. Every later feature is then 'just code.' This is 4C/ID's whole-task principle — the system runs end-to-end in trivial form by the end of Week 1.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 4):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 2):** one generative item — write the key command, schema, or rule from that day without looking.
3. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
4. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 4's independent verification ("Keyless access — managed identity + RBAC") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**Completion problem:** Day 1's tutorial was the worked example of this exact deploy flow. Today the tutorial is closed; you reproduce the flow on your own app with only the tutorial's command *names* available as a reference card. Blanks you can't fill are diagnostic: note them, they set Day 6's warm-up.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Write the skeleton app
FastAPI with two routes: `GET /health` → `{"status":"ok"}`, and `POST /complete` → one AOAI chat completion via `DefaultAzureCredential`, returning the text + token usage. Stable system-prompt prefix first (prompt caching: cached input is half price — an architecture input, not a micro-optimisation).

**Expected output:** Local run: `/health` 200; `/complete` returns a completion when run with your CLI identity.

### Step 2 — Containerise + push
Dockerfile (slim Python base, non-root user), build via `az acr build` to your ACR Basic (~$5/mo, third-party estimate in the research — treat as approximate).

**Expected output:** Image listed in ACR; build log shows no secrets baked into layers.

### Step 3 — Deploy to Container Apps
App in the existing environment, system-assigned identity granted the Day 4 AOAI role, scale-to-zero (min replicas 0 — accept the cold start), ingress external.

**Expected output:** App URL assigned; first `curl /health` may take ~30s cold — that delay is expected behaviour, not a failure.

### Step 4 — Call it like a user
`curl -X POST <url>/complete` with a fixed test prompt. Record latency + usage from the response and App Insights.

**Expected output:** Completion text returned over public HTTPS; App Insights shows the request trace. Note the cold vs warm latency difference in your log — you'll quote it in Week 3.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Container 403s where local script succeeded | Container's identity lacks the role (Day 4's prediction, arriving on schedule) | Assign the role to the *app's* principal ID; fixed when the same curl succeeds with no code change |
| Image runs locally, crashes in Container Apps | Port mismatch: app listens on 8000, ingress targets another port | Align target port in Bicep/app config; fixed when /health answers on the public URL |
| Cold start looks like a hang | Scale-to-zero doing its job | Wait 30–60s and retry before debugging anything; fixed when you can state cold vs warm latency from measurement |

## Independent verification (checkpoint)
From a machine/network with no Azure login context beyond the public URL: `curl` `/health` → ok, `curl` `/complete` → a real gpt-4o-mini completion. If it only works from your logged-in shell in a way that could be borrowing your identity, it doesn't count.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative recall: the deploy sequence (build → push → deploy/update) from memory, in order, with the command names.
2. Transfer: your app needs a second route calling AI Search next week. What identity/role work is needed — and what, specifically, is *not* needed?
3. Calibration: before testing, write your predicted cold-start latency. Compare with measured. Log the gap — calibration is tracked all month.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: corpus day — clone kubernetes/website pinned to a release branch, scope Concepts + Tasks, count pages, upload to Blob. Prep: ~2 GB free disk.
