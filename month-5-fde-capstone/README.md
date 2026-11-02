# Month 5 — FDE Capstone

**Phase P4.** Deploy the Workbench for a **customer** — a real user if findable
(OSS maintainer, local business, campus lab), else a rigorously simulated
enterprise brief with real friction (messy data, a permission boundary, a
mid-month requirement change) — then extend it with a **read-only multi-agent**
mode and the **one LoRA experiment**, and harden the whole thing into an operable
product with a runbook.

Budget column: **≈$187** — the tight month by design; the LoRA experiment lives
inside a pre-committed **$40 envelope** (priced in writing before any compute
exists; if it can't fit, rescope the experiment, never overrun). Reading spine:
Anthropic's multi-agent research write-up + Cognition's "Don't Build
Multi-Agents" (both, together), the Month 4 evidence pack.

## The four weeks

| Week | Theme | Ends with |
|---|---|---|
| [Week 1](week-1/README.md) | The engagement: brief, messy data, real permissions, customer evals | Deployment v1 in its own environment; leakage battery green; acceptance battery run |
| [Week 2](week-2/README.md) | Field loop + requirement change + customer tuning | Findings shipped through the gate; the change absorbed evals-first; brief criteria verdicted |
| [Week 3](week-3/README.md) | Multi-agent extension + LoRA experiment | Cost-normalised head-to-head verdict; LoRA keep/reject verdict inside the envelope, compute deleted |
| [Week 4](week-4/README.md) | Hardening, runbook, platform packaging | Replay-measured optimisations; failure drills on the deployment; runbook cold-tested; MCP plug-in docs proven by a real onboarding |

## Month definition of done
- [ ] Written customer brief with measurable success criteria; constraints inherited from Month 4 imported as binding
- [ ] Customer corpus ingested with reconciled counts + a data-quality report; contradictions surfaced as customer decisions, never silently resolved
- [ ] Document-level access control enforced at retrieval across RAG / agent / MCP paths; cross-audience leakage battery green and committed as a regression suite
- [ ] Customer golden set frozen (`customer-golden-v1`), wired as suite #4, baselined before tuning; judges spot-checked on the new domain
- [ ] Deployment v1 in a parameterised second environment with projected monthly cost stated; acceptance battery run against the deployed env
- [ ] Field loop completed at least twice (usage → taxonomy → gated fix → report-back); requirement change absorbed via written impact analysis + logged decision + evals-first delivery
- [ ] Every brief success criterion verdicted from instruments; cost per successful outcome computed with a stated definition
- [ ] Multi-agent: pre-registered, cost-normalised head-to-head vs the single-agent control; per-category verdict; default mode set from evidence; workers read-only by server-side scope, demonstrated
- [ ] LoRA: task + baseline + priced envelope card written before compute; run executed inside the $40 cap; keep/reject verdict from the same eval; compute provably deleted the same day
- [ ] Hardening: replay-based before/after for top bottlenecks; four failure drills on the deployment with verdicts against written expectations
- [ ] Runbook with ten procedures, two cold-executed from the document alone; MCP plug-in docs proven by onboarding a real tool through them
- [ ] Deployment report final (brief → outcome → extensions → operations), evidence-linked and cross-checked; month spend within ≈$187 with the LoRA accounting shown separately
