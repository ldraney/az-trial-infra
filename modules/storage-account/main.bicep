param baseName string
param location string = resourceGroup().location
param skuName string = 'Standard_LRS'
param kind string = 'StorageV2'

var storageAccountName = toLower('${baseName}${uniqueString(resourceGroup().id)}')

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name

