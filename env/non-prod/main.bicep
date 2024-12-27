param location string
param baseName string

module storageAccount './modules/storage-account/main.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    baseName: baseName
  }
}

module appService './modules/appService/main.bicep' = {
  name: 'appService'
  params: {
    location: location
    appName: baseName
  }
}

