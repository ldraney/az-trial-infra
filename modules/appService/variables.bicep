@description('App Service Plan name')
var appServicePlanName = '${appServiceAppName}-plan'

@description('App Service Plan SKU name')
var appServicePlanSkuName = environmentType == 'prod' ? 'S1' : 'B1'

@description('Default tags for resources')
var defaultTags = {
  owner: 'DevTeam'
  environment: environmentType
}

