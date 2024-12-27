@description('Location for resources')
param location string = 'centralus'  // Default to a supported region

@description('App Service name')
param appServiceAppName string

@description('Environment type for tagging and deployment settings')
@allowed(['nonprod', 'prod'])
param environmentType string = 'nonprod'

@description('Custom tags to be merged with default tags')
param customTags object = {}

var defaultTags = {
  environment: environmentType
  owner: 'DevTeam'
}

// Merge default tags with custom tags
var finalTags = union(defaultTags, customTags)

module appService '../../modules/appService/main.bicep' = {
  name: 'appService'
  params: {
    location: location
    appServiceAppName: appServiceAppName
    environmentType: environmentType
    tags: finalTags
  }
}

