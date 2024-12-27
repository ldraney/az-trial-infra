@description('Default tags for resources')
output defaultTags object = {
  owner: 'DevTeam'
  environment: environmentType
}

