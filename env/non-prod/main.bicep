@description('Location for resources')
param location string = 'eastus'

@description('App Service name')
param appServiceAppName string

@description('Environment type for tagging and deployment settings')
@allowed(['nonprod', 'prod'])
param environmentType string = 'nonprod'

var tags = {
  environment: environmentType
  owner: 'DevTeam'
}

module appService '../modules/appService/main.bicep' = {
  name: 'appService'
  params: {
    location: location
    appServiceAppName: appServiceAppName
    environmentType: environmentType
  }
}

output appServiceHostName string = appService.outputs.appServiceAppHostName

