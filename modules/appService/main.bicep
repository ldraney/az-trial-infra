param location string
param appServiceAppName string
@allowed(['nonprod', 'prod'])
param environmentType string
param tags object

module variables './variables.bicep' = {
  name: 'variables'
  params: {
    environmentType: environmentType
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: '${appServiceAppName}-plan'
  location: location
  sku: {
    name: environmentType == 'prod' ? 'S1' : 'B1'
  }
  tags: union(variables.outputs.defaultTags, tags)
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceAppName
  location: location
  tags: union(variables.outputs.defaultTags, tags)
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
output appServicePlanId string = appServicePlan.id

