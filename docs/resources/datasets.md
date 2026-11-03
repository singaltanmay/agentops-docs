# Datasets

## Primary corpus: Kubernetes docs + GitHub issues

- **Docs:** `kubernetes/website`, English `content/en/docs`, **Concepts + Tasks
  sections only** for Month 1 (~1,000 pages — exact scoped count **UNVERIFIED**;
  count at clone time and record it). Pinned to a single recent release branch.
- **Issues:** `kubernetes/kubernetes`, filtered to **closed + labelled + answered**.
  Noisy by default (templates, bots, duplicates) — filtering is part of the work.
- **Licence:** docs contributions CC BY-SA 4.0 per Kubernetes contributor guidance;
  code Apache-2.0. Verify the repo `LICENSE` at clone time.
- **Why this corpus:** hierarchical, versioned, real documentation with headings,
  code, and YAML — ideal for chunking experiments; flags and YAML keys make
  **BM25-vs-vector differences measurable** (hybrid should visibly win); closed
  issues give realistic troubleshooting questions; and you can judge answer
  correctness yourself, which is the biggest golden-set cost factor.

### Contamination controls (K8s docs are in LLM training data)
- Every golden answer requires a **citation to a chunk ID**; scoring checks the
  citation, not just the answer text.
- Include questions about release-specific changes from the pinned branch.
- Keep a held-out slice (30 Q in Month 1) that is never tuned against.

### Golden set recipe (Month 1 target: 160 Q, `golden-v1.0`)
| Slice | Share | Source |
|---|---|---|
| Docs-derived | ~60% (~95 Q) | Written by you from specific pages; answer + source page + expected chunk ID recorded |
| Issue-derived | ~25% (~40 Q) | Mined from closed, answered issues; rewritten standalone; answer re-verified against pinned docs |
| Adversarial / unanswerable | ~15% (~25 Q) | Nonexistent feature, unpinned version, content excluded from the index — correct behaviour is "not in the corpus", no fabrication |

Categories: factoid / how-to / config-YAML / troubleshooting / multi-hop / unanswerable.

## Fallback: SEC EDGAR
8 companies × 10-K + 10-Q × 3 years via the free SEC API (`data.sec.gov`;
descriptive User-Agent required, 10 requests/sec limit; helper: `edgartools`).
Switch if (i) K8s memorisation makes retrieval experiments uninformative
(vector-only scores suspiciously high on answer correctness while citation
accuracy is poor), or (ii) the capstone story becomes a research/finance agent.
Ingestion and eval code must be corpus-agnostic enough that this costs days, not
weeks — that portability is a Month 1 design requirement.

## Explicitly NOT the primary corpus
| Candidate | Why not |
|---|---|
| Wikipedia QA (Natural Questions / SQuAD / HotpotQA) | Benchmarks, not a product corpus: pre-chunked, memorised, nothing to ingest. HotpotQA allowed only as a plumbing sanity check |
| Bitext (26.9k support Q&A) / Banking77 | No documents to chunk, retrieve, or cite — the Month 1 exercise would be vacuous. Reserved: Bitext for Month 3 routing, Month 5 fine-tune data |
| arXiv | A PDF-parser project disguised as a RAG project; licence heterogeneity. Possible Month 6 stretch corpus |
| RAGBench / CRAG / MultiHop-RAG | Eval sets — they evaluate a pipeline, they don't *be* the product (ingestion already done for you) |

## Ready-made sets for later phases

| Phase | Set | Use | Access |
|---|---|---|---|
| Month 4 | **RAGBench** (100k, 12 subsets — use `techqa`, `emanual`, `hotpotqa`) | Cross-check Ragas numbers and judge calibration | Hugging Face `rungalileo/ragbench` (mirror: `galileo-ai/ragbench`) |
| Month 4 | **CRAG** (Meta, 4,409 QA, CC BY-NC 4.0) | Comparison / multi-hop / false-premise questions | Meta's official release — deep URL **UNVERIFIED**; fetch from the official repo at use time |
| Month 4 | **MultiHop-RAG** (2,555 queries) | Trustworthy Recall@K while tuning hybrid parameters | Hugging Face — exact dataset card **UNVERIFIED**; verify at download |
| Months 3/6 | **τ-bench / τ²-bench** (Sierra, MIT) | Multi-turn tool-agent tasks scored by final DB state + policy compliance; `pass^k` reliability | github.com/sierra-research/tau2-bench |
| Months 3/6 | **SWE-bench Verified** (500 tasks) | Only if a coding-agent flavour enters the capstone; run a 50-task mini subset | Hugging Face `SWE-bench/SWE-bench_Verified` |
| Month 4 | **deepset/prompt-injections** (662 labelled) | Injection classifier / red-team starter set | huggingface.co/datasets/deepset/prompt-injections |
| Month 4 | **AgentDojo** (ETH SPY Lab) | Agent injection benchmark: injections in tool outputs, scored on task success AND attack success | Python package `ethz-spylab/agentdojo` — version counts vary by release; verify at install |
| Month 4 | **promptfoo redteam** generated suites | App-specific adversarial cases from *your* tool descriptions — generic sets can't provide these | promptfoo.dev/docs/red-team/quickstart |
