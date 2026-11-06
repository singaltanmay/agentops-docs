targetScope = 'resourceGroup'

param location string = resourceGroup().location

@minLength(2)
@maxLength(8)
param environmentName string = 'dev'

@allowed([
  'Standard_LRS'
])
param storageSku string = 'Standard_LRS'

@allowed([
  'standard'
])
param keyVaultSku string = 'standard'

@allowed([
  'PerGB2018'
])
param logAnalyticsSku string = 'PerGB2018'

var suffix = uniqueString(resourceGroup().id, environmentName)
var tags = {
  project: 'agentops'
  environment: environmentName
}

module storage 'modules/storage.bicep' = {
  name: 'storage'
  params: {
    name: 'st${suffix}'
    location: location
    sku: storageSku
    tags: tags
  }
}

module keyVault 'modules/key-vault.bicep' = {
  name: 'key-vault'
  params: {
    name: 'kv-${suffix}'
    location: location
    sku: keyVaultSku
    tags: tags
  }
}

module monitoring 'modules/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    workspaceName: 'log-agentops-${environmentName}-${suffix}'
    applicationInsightsName: 'appi-agentops-${environmentName}-${suffix}'
    location: location
    workspaceSku: logAnalyticsSku
    tags: tags
  }
}

output storageAccountName string = storage.outputs.name
output corpusContainerName string = storage.outputs.containerName
output keyVaultName string = keyVault.outputs.name
output logAnalyticsWorkspaceName string = monitoring.outputs.workspaceName
output applicationInsightsName string = monitoring.outputs.applicationInsightsName
