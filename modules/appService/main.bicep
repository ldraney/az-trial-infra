param location string
param appServiceAppName string
@allowed(['nonprod', 'prod'])
param environmentType string
param tags object  // Accept merged tags from the environment

var appServicePlanName = '${appServiceAppName}-plan'
var appServicePlanSkuName = environmentType == 'prod' ? 'P2v3' : 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
  tags: tags
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceAppName
  location: location
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
output appServicePlanId string = appServicePlan.id

