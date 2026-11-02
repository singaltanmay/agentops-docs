# Day 4 — Keyless access — managed identity + RBAC

**Week 1 · Long build · 2–3 hrs** · Month 1 — Production RAG

## Objective
Wire managed identities and RBAC so Search and (tomorrow) Container Apps reach Blob and Azure OpenAI with no keys in code — verified by a keyless call succeeding and a repo-wide search finding zero key strings.

## Why this exists
'No keys in code, ever' is a production pattern and an interview story in one. It also de-risks everything after today: there is no secret to leak from a screenshot, a log, or a public repo.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Yesterday (Day 3):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **3 days ago (Day 1):** one generative item — write the key command, schema, or rule from that day without looking.
3. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
4. Tag every answer with a confidence (0–100%) *before* checking. Answers + one-line explanations come after all attempts — a miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run Day 3's independent verification ("Bicep core II — Azure OpenAI + AI Search Free") before starting. If it no longer passes, the environment has rotted — repair it first and compress today's objective; do not stack new work on a broken base.

## Core concept
**New pattern, worked example first:** the parallel example is a single role assignment done by hand in the portal for one identity → one scope → one role, narrated. Then you express all of them in Bicep (the real task) using the same three-part shape: principal, role definition, scope. If you can state those three for every assignment, you understand RBAC; the Bicep is transcription.

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop and check the failure table below.

### Step 1 — Map the assignments on paper first
List every caller → callee pair: Search → Blob (read corpus), Search → AOAI (embeddings, for Week 2 skillsets), Container Apps app → AOAI (Day 5), Container Apps app → Search (Week 3). For each: principal, role, scope. Least privilege: data-plane roles (e.g. Storage Blob Data Reader, Cognitive Services OpenAI User, Search Index Data Contributor) at resource scope, never subscription Owner.

**Expected output:** A written table with one row per pair. If a row says 'Contributor, subscription' — that's today's misconception to catch before deploying.

### Step 2 — Express the assignments in Bicep
System-assigned identities on the services that support them today; role assignment resources referencing principal IDs. Redeploy.

**Expected output:** Deployment succeeds; `az role assignment list` shows your rows and no extras.

### Step 3 — Prove keyless works
From a local script using `DefaultAzureCredential` with your Azure CLI login, call the AOAI embeddings endpoint for one short string — no key anywhere in the script.

**Expected output:** HTTP 200 with a 1,536-length vector returned. Save the script; it becomes a Week 2 smoke test.

### Step 4 — Prove the negative
`grep -Rni "api-key\|api_key\|key =" app/ ingestion/ infra/` across the repo, and confirm Key Vault holds no AOAI/Search keys you created by hand.

**Expected output:** Zero hits (excluding docs warning against keys). This grep is re-run at the Week 1 gate.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Keyless call returns 401/403 | RBAC propagation delay (minutes is normal) or wrong data-plane role | Wait, re-check the role is a *data* role at the right scope; fixed when the same script succeeds untouched |
| Works locally, conceptually murky | Procedural mimicry risk — gate holds the KC | Do the teach-back probe below before advancing; KC-03 stays *fragile* until Day 7's redeploy |
| Role assignment Bicep fails on principal ID | Identity created in the same deployment, ordering | Reference the identity resource symbolically so Bicep orders it; fixed when a single deployment creates both |

## Independent verification (checkpoint)
The embeddings script runs keyless (200 + 1,536-dim vector) AND the repo grep finds zero keys. Both are binary; there is no partial pass.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Teach-back: explain principal / role / scope using one of today's real assignments, and name the alternative you rejected (keys in Key Vault) with its actual downside.
2. Debugging (planted): an assignment grants Search the Owner role at subscription scope and everything 'works.' Find what's wrong and state the fix — functionality is not evidence of correctness here.
3. Prediction: tomorrow the container gets a 403 from AOAI while your local script works. Give the two most likely causes, in order.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this day's KCs are `fragile` — repair scheduled, see HOW-WE-LEARN.md)
- [ ] Project left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this day's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).

## Preview of tomorrow
Tomorrow: rest + Week 1 gate in the morning if you want it, or the skeleton today-adjacent — the plan puts the walking skeleton on Day 5 (Sun) as the long block if Saturday ran long. Either way: next build is the FastAPI skeleton.
