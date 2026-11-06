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
| Blob Storage `stn6427cwl3zfzo`, private `corpus` container | StorageV2, Hot, Standard_LRS only | Empty: approximately INR 0; first storage tier approximately INR 1.90/GB-month, plus operations and transfer |
| Key Vault `kv-n6427cwl3zfzo` | Standard only, RBAC authorization | Empty/unused: approximately INR 0; standard operations approximately INR 2.86/10,000 |
| Log Analytics `log-agentops-dev-n6427cwl3zfzo` | PerGB2018 only, 31-day retention, 1 GB/day ingestion cap | No ingestion: approximately INR 0; approximately INR 306.64 per billable GB ingested |
| Application Insights `appi-agentops-dev-n6427cwl3zfzo` | Workspace-based `web` component; no separate SKU | Logs billed through the linked workspace; do not count ingestion twice |

These are illustrative Central India public retail consumption rates in INR,
queried on 2026-11-06 from the [Azure Retail Prices API](https://prices.azure.com/api/retail/prices).
They are not a subscription-specific quote or guaranteed monthly maximum.
Allowances, subscription-wide usage, taxes, operations, transfer, and other meters
can change the bill. The project currently has no corpus or telemetry workload.
At 31 billable GB/month, ingestion alone would be approximately INR 9,505.73
before allowances and tax, almost the entire project budget.

The [daily cap](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/daily-cap)
is an emergency safeguard: it can overshoot, and reaching it stops covered log
collection until the workspace resets. It is not a hard financial cap. Control
telemetry volume and add application-side sampling when telemetry is wired.

## Day 2 infrastructure checkpoint

Completed with agent assistance on 2026-11-06; unaided mastery was not assessed.
Deployment `day02-core` succeeded in `rg-agentops-dev`. All four resources are
in Central India. Repeat deployment preview reports `NoChange` for all six
resource entries, including the Blob service and container.

The [Bicep entry point](infra/main.bicep) composes storage, Key Vault, and
monitoring modules. Resource-group/environment-derived names are stable across
redeployments. SKU allow-lists exist at both entry-point and module boundaries.
Application Insights has no separate SKU parameter; its workspace controls log
billing. The 31-day retention and 1 GB/day workspace cap are fixed in code.

Storage requires HTTPS/TLS 1.2, disallows anonymous Blob and shared-key access,
and creates a private `corpus` container. Key Vault uses RBAC with no legacy
access policies or seeded secrets. Application Insights disables local
authentication: telemetry clients will need Entra authentication and the
appropriate role assignment. Storage/Key Vault data-plane role assignments
and application managed identities arrive in Day 4; do not work around missing
access by enabling keys or creating manual secrets.

Run from the repository root, after confirming the intended Azure subscription:

```bash
az account show --query '{name:name,state:state,isDefault:isDefault}'
az bicep build --file infra/main.bicep --stdout > /dev/null
az bicep lint --file infra/main.bicep
az deployment group validate --resource-group rg-agentops-dev \
  --name day02-core --template-file infra/main.bicep
az deployment group what-if --resource-group rg-agentops-dev \
  --name day02-core --template-file infra/main.bicep
# This command creates or updates billable project resources.
az deployment group create --resource-group rg-agentops-dev \
  --name day02-core --template-file infra/main.bicep
```

Independent read-back (expected deployment `Succeeded`, storage `Standard_LRS`
and `Hot`, vault RBAC `true`, workspace retention `31` and daily cap `1`):

```bash
az deployment group show -g rg-agentops-dev -n day02-core \
  --query properties.provisioningState
az storage account show -g rg-agentops-dev -n stn6427cwl3zfzo \
  --query '{sku:sku.name,tier:accessTier,publicBlobs:allowBlobPublicAccess,sharedKeys:allowSharedKeyAccess}'
az keyvault show -g rg-agentops-dev -n kv-n6427cwl3zfzo \
  --query '{sku:properties.sku.name,rbac:properties.enableRbacAuthorization}'
az monitor log-analytics workspace show -g rg-agentops-dev \
  -n log-agentops-dev-n6427cwl3zfzo \
  --query '{sku:sku.name,retention:retentionInDays,dailyCapGb:workspaceCapping.dailyQuotaGb,id:id}'
az resource show -g rg-agentops-dev \
  --resource-type Microsoft.Insights/components \
  -n appi-agentops-dev-n6427cwl3zfzo --api-version 2020-02-02 \
  --query '{workspace:properties.WorkspaceResourceId,disableLocalAuth:properties.DisableLocalAuth}'
```

The returned Application Insights workspace ID must equal the workspace's ID.
Names above describe this deployment; use deployment outputs for another
resource group or environment.

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
