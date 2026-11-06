param workspaceName string
param applicationInsightsName string
param location string
param tags object

@allowed([
  'PerGB2018'
])
param workspaceSku string

resource workspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: workspaceName
  location: location
  tags: tags
  properties: {
    sku: {
      name: workspaceSku
    }
    retentionInDays: 31
    workspaceCapping: {
      dailyQuotaGb: 1
    }
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    Request_Source: 'rest'
    WorkspaceResourceId: workspace.id
    IngestionMode: 'LogAnalytics'
    DisableLocalAuth: true
  }
}

output workspaceName string = workspace.name
output applicationInsightsName string = applicationInsights.name
