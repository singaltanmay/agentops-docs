# Month 4 — Evals, Observability & Security

**Phase P3.** The Workbench grows its platform layer — the wedge skill for every
target role. Sequence: unify all eval assets behind **one runner** with
deterministic checks first; build **binary LLM judges** per failure category and
**calibrate them against your own labels** (TPR/TNR, bias-checked); wire
**promptfoo CI regression gates** that provably block a sabotaged prompt; then
**red-team the system** (generated + fixed attack sets, lethal-trifecta audit)
and harden it with before/after attack numbers.

Budget column: **≈$161** (Content Safety joins at ~$8; judge calls are a real
line now). Reading spine: Hamel Husain's evals work, Eugene Yan's evals writing,
Ragas + promptfoo docs, OWASP LLM Top 10 (2025), Simon Willison's lethal trifecta.

## The four weeks

| Week | Theme | Ends with |
|---|---|---|
| [Week 1](week-1/README.md) | Eval platform v1 | One runner/envelope for all suites; scorer map (deterministic first); taxonomy v3 from 100 read traces; 5 runnable eval specs |
| [Week 2](week-2/README.md) | Judge calibration | `calibration-v1` labels (yours); per-category judges with TPR/TNR + bias annex; signed judge-usage policy; online eval sampling live |
| [Week 3](week-3/README.md) | CI gates + observability | promptfoo reconciled; PR gate blocks a deliberately regressed prompt; nightly deep eval; KQL operator lenses |
| [Week 4](week-4/README.md) | Red team + hardening | Baseline attack-success table; AgentDojo dual scores; trifecta audit; hardening + Prompt Shields measured; before/after delta report |

## Month definition of done
- [ ] One eval runner/envelope covers RAG + agent + long-task suites; smoke subset runs in ~15 min; historical runs still queryable
- [ ] Scorer map committed; deterministic coverage % measured per suite; seeded-bad outputs fail mechanically
- [ ] Taxonomy v3 built from 100 personally read traces, with counts, owners, and a catching eval per top category
- [ ] Five eval specs runnable with measured bars and a quantified noise floor
- [ ] Judges: one binary judge per target category, calibrated against your frozen labels; TPR **and** TNR reported; bias annex (position/verbosity/self-preference) with numbers
- [ ] Judge-usage policy signed before CI wiring: gate-band / trend-band / judge-resistant categories each declared
- [ ] Online evals sample live-shaped traffic asynchronously with a cost governor; trends in the weekly report respect the policy bands
- [ ] CI gate compares against the main-branch baseline and **blocks a deliberately regressed prompt** with named metrics; revert returns green; baseline updates are a documented act
- [ ] Nightly battery runs full suites + fenced rotating held-out slice; alert rules written and narrow
- [ ] Red team: baseline attack-success rates per category (generated suite), deepset detection numbers, AgentDojo (task, attack) pairs, direct-vs-indirect channel comparison
- [ ] Lethal-trifecta combination matrix with the worst cell proven by a staged exploit; hardening list is architectural
- [ ] After-hardening re-test with a before/after delta report; Prompt Shields measured on detection **and** false-positive rates; residual risks named
- [ ] Month spend within ≈$161 ±20%, variance explained in the retrospective
