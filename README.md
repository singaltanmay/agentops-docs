# AgentOps Workbench

Cumulative implementation for the AgentOps production RAG and agentic systems course.

## Workflow

Keep course documentation and implementation in this repository. Use branches
for lesson work rather than creating separate repositories or project directories.
Week 1, including Day 1, uses `month1_week1`, tracking `origin/month1_week1`.
Run project commands from this repository's root.

Start with the [course guide](docs/README.md), follow
[Day 1](docs/month-1-production-rag/week-1/day-01.md), and record evidence in
[the progress tracker](docs/PROGRESS.md).

## Repository layout

- `docs/`: course lessons, resources, and progress evidence.
- `app/`: application API and UI.
- `infra/`: Bicep infrastructure and deployment configuration.
- `ingestion/`: corpus preparation and indexing.
- `evals/`: evaluation datasets and runners.
- `data/`: project data; never store credentials or private datasets here.

## Azure configuration

- Subscription: Visual Studio Enterprise Subscription; selected, enabled, and
  Azure CLI sign-in verified on 2026-11-03.
- Offer: MSDN, `MS-AZR-0063P`; billing currency: INR.
- Portal credit snapshot (2026-11-03): starting credit displayed as INR 12.50K
  (rounded); remaining credit: INR 12,479.94.
- Current billing period: 2026-10-10 through 2026-11-09. The next cycle is
  expected to start on 2026-11-10; an explicit credit reset timestamp was not shown.
- Spending limit: enabled; the portal offered to remove it, and it was left unchanged.
- Project resource group: `rg-agentops-dev`, Central India metadata location.
- Monthly resource-group budget: `agentops-monthly-inr`, INR 10,000, calendar
  monthly, 2026-11-01 through 2027-10-31.
- Alerts: six enabled notifications (actual and forecast at 50%, 80%, and 100%)
  to the signed-in Azure account.
- Existing resources in other resource groups were observed and left untouched.

Budget alerts are notifications, not a hard spending cap. This budget is scoped
to the project resource group and uses calendar months, while subscription
billing runs from the 10th to the 9th. Subscription-wide credit usage can include
resources outside the project group. Keep headroom and monitor the subscription
balance.

## Resources

| Resource | SKU cap | Monthly cost |
|---|---|---|

## Day 1 checkpoint

Agent-written factual summary; unaided mastery has not been assessed.

- Built: local repository scaffold and secret-file exclusions.
- Verified toolchain: Azure CLI 2.91.0, Docker CLI 29.1.3, Python 3.14.4,
  Node 22.22.1, Git 2.53.0, GitHub CLI 2.46.0. The Docker CLI cannot access
  its daemon in this environment; the Container Apps `--source` flow documents
  an Oryx fallback when Docker is unavailable.
- Installed the Azure CLI `containerapp` extension 1.3.0b5 (preview) for the
  Day 1 tutorial. Deployed the FastAPI sample after approval and verified the
  home page and form response over HTTP. Its isolated temporary resource group
  was deleted and confirmed absent; the temporary local clone was removed.
- Verified Azure access: the expected subscription is active; Azure CLI
  successfully obtained a management access token without displaying the token.
- Verified credit: subscription overview shows INR 12.50K starting credit
  (rounded), INR 12,479.94 remaining, and the billing period ending 2026-11-09.
  These subscription-wide figures include existing workloads, not just this project.
- Created and verified the empty `rg-agentops-dev` resource group in Central India.
- Created and verified the INR 10,000 calendar-month resource-group budget with
  six actual/forecast notifications. The spending limit was not changed.
- Git checkpoint: use `git status` and `git log` to verify the local branch and
  commit. Configure a Git author identity if needed for later commits.
