# Host the MCP server — Streamable HTTP on Container Apps

**Week 2 · Build · 75 min** · Month 3 — Agentic Systems + MCP

## Objective
Deploy the MCP server as the third Container App over Streamable HTTP with an auth check — verified by a remote client completing list + call against the public endpoint, and an unauthenticated call being refused.

## Why this exists
A local stdio server proves the protocol; a hosted server proves the product pattern — this is Microsoft's own tutorial shape (Python MCP server → Container Apps → connect from a client), and it's how real deployments expose tools.

## Prerequisites
Lessons 1–2 done. Do alongside: Microsoft Learn, 'Tutorial: Deploy a Python MCP server to Azure Container Apps'.

## Retrieval warm-up (closed-book, 8–12 min)
1. **Previous lesson (Month 3 Week 2, Lesson 2 (The full tool surface over MCP — golden-set and eval tools)):** state its objective and its verification in one sentence each — from memory, guide closed.
2. **Spaced review (Month 3 Week 1 (previous week's build)):** one generative item — write the key command, schema, or rule from that lesson without looking.
3. **Interleaved discrimination:** one item mixing this week's pattern with its most confusable neighbour, unlabelled — name which is which and why.
4. **Prediction:** predict the output/behaviour of today's first build step before you run it. Write the prediction down.
5. Tag every answer with a confidence (0–100%) *before* checking. A miss on a prerequisite for today changes today's plan now, per the opening routine.

## Prerequisite check
Re-run the previous lesson's independent verification (Month 3 Week 2, Lesson 2 (The full tool surface over MCP — golden-set and eval tools)) before starting. If it no longer passes, repair first and compress today's objective — never stack new work on a broken base.

## Core concept
Transport decision, made explicitly: **Streamable HTTP** for the hosted server (stateless-friendly, works through normal HTTPS ingress), stdio stays for local dev. Auth: a shared-secret header or Entra-based check — **UNVERIFIED:** the exact auth pattern Microsoft's tutorial currently demonstrates for MCP on Container Apps; follow the tutorial + Container Apps auth docs as ground truth and record what you implemented. Scale-to-zero applies (cold start on first call is acceptable and must be measured, not discovered by a user).

## Build steps
Expected output is stated *before* you run each step. If you see something else, stop, classify the error (slip / execution-model / API misconception / design misconception), and check the failure notes.

### Step 1 — Containerise the server
Add the Streamable HTTP transport alongside stdio (same tool implementations); Dockerfile + Bicep for a third app in the existing environment.

**Expected output:** Local run over HTTP transport passes the Lesson 1 client checks.

### Step 2 — Deploy via the existing CI path
Bicep + `azd`/Actions deploy the MCP app; secrets via Key Vault references, as with the other apps.

**Expected output:** Public HTTPS endpoint answers; deploy is reproducible from a clean checkout.

### Step 3 — Auth + refusal test
Implement the chosen auth check; test: no credential → refused; valid credential → list + call succeed.

**Expected output:** Both outcomes demonstrated and logged; the refusal returns no tool information.

### Step 4 — Measure the cold start
Scale to zero, wait, time the first call; record it in the contract doc.

**Expected output:** Cold-start number recorded; if it's ugly, the mitigation (min replicas for demo windows) is a documented toggle, not a surprise.

## Common failure modes

| Symptom | Cause | Fix |
|---|---|---|
| Hosted server works locally but 404s remotely | Ingress path / transport endpoint mismatch | Follow the tutorial's exact app shape first (parallel example), then diff yours against it |
| Cold starts make evals flaky | Scale-to-zero + short client timeouts | Raise the eval client's timeout for the first call and log cold starts separately — don't hide them in p95 |

## Independent verification (checkpoint)
Remote client completes list + call over HTTPS with auth; unauthenticated calls refused; cold-start latency is a recorded number.

## Unaided probe (closed-guide)
State your confidence (0–100%) before checking each answer.

1. Generative: state the transport decision and the two reasons stdio doesn't fit hosting.
2. Prediction: your API key for the MCP server leaks in a client config screenshot. What's the blast radius (enumerate via privilege lines) and the rotation procedure?
3. Transfer: Month 4 will red-team this endpoint. Name the first two attacks you'll run, from the OWASP list.

## Definition of done
- [ ] All build steps completed with expected outputs matched
- [ ] Independent verification passed
- [ ] Unaided probe: majority correct *with explanations* (else this lesson's KCs are `fragile` — repair scheduled)
- [ ] System left running; checkpoint committed
- [ ] Log entry written (below) and PROGRESS.md updated

## Log entry prompt
Write your own 3 lines — *what I built / what broke and why / what I still can't do unaided* — then set this lesson's status in PROGRESS.md (`assisted` if any step was demonstrated for you, `mastered` only when the probe passed unaided).
