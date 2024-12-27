@description('App Service Plan name')
var appServicePlanName = '${appServiceAppName}-plan'

@description('App Service Plan SKU name')
var appServicePlanSkuName = environmentType == 'prod' ? 'P2v3' : 'F1'

@description('Default tags for App Service resources')
var defaultTags = {
  owner: 'DevTeam'
  environment: environmentType
}

