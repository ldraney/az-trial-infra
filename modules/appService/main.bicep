param location string
param appName string

resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-01' = {
  name: '${appName}-plan'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

resource appService 'Microsoft.Web/sites@2021-01-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output appServiceUrl string = appService.defaultHostName

