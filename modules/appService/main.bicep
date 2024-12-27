param location string
param appServiceAppName string
@allowed(['nonprod', 'prod'])
param environmentType string
param tags object  // Allow tags to be passed from the parent template

module variables './variables.bicep' = {
  name: 'variables'
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: variables.outputs.appServicePlanName
  location: location
  sku: {
    name: variables.outputs.appServicePlanSkuName
  }
  tags: union(variables.outputs.defaultTags, tags)  // Merge module tags with passed tags
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceAppName
  location: location
  tags: union(variables.outputs.defaultTags, tags)  // Merge module tags with passed tags
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName
output appServicePlanId string = appServicePlan.id

