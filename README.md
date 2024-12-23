# Azure Infrastructure Repository template

This repository contains Azure Infrastructure as Code (IaC) modules and GitHub Actions workflows to manage Azure resources efficiently. The initial setup includes workflows for creating and managing resource groups, deploying modules, and deleting resources, with a sample module for deploying a storage account.

## Repository Structure

```
infra-repo/
├── .github/
│   ├── workflows/
│   │   ├── create-resource-group.yml       # Creates a new resource group
│   │   ├── deploy-modules.yml             # Deploys modules to a resource group
│   │   ├── delete-resource-group.yml      # Deletes a resource group
│   │   ├── delete-modules.yml             # Deletes specific resources from a group
├── modules/
│   ├── storage-account/
│   │   ├── main.bicep                     # Storage account Bicep template
│   │   ├── variables.bicep                # Variables for storage account
│   │   ├── outputs.bicep                  # Outputs for the storage account
├── README.md
```

## Workflows

### 1. Create Resource Group
Creates a new resource group in Azure.
- **Workflow File**: `.github/workflows/create-resource-group.yml`
- **Trigger**: Manual (`workflow_dispatch`)
- **Inputs**:
  - `resource_group_name`: Name of the resource group.
  - `location`: Azure region (default: `eastus`).

### 2. Deploy Modules
Deploys specified modules (e.g., a storage account) to a resource group.
- **Workflow File**: `.github/workflows/deploy-modules.yml`
- **Trigger**: Manual (`workflow_dispatch`)
- **Inputs**:
  - `resource_group_name`: Name of the resource group.
  - `storage_account_name`: Name of the storage account to create.
  - `location`: Azure region (default: `eastus`).

### 3. Delete Resource Group
Deletes a specified resource group and all its resources.
- **Workflow File**: `.github/workflows/delete-resource-group.yml`
- **Trigger**: Manual (`workflow_dispatch`)
- **Inputs**:
  - `resource_group_name`: Name of the resource group to delete.

### 4. Delete Modules
Deletes specific resources (modules) from a resource group without deleting the group.
- **Workflow File**: `.github/workflows/delete-modules.yml`
- **Trigger**: Manual (`workflow_dispatch`)
- **Inputs**:
  - `resource_group_name`: Name of the resource group.
  - `module_resource_name`: Name of the module/resource to delete.

## Modules

### Storage Account Module
A sample Bicep module to deploy an Azure Storage Account.
- **Location**: `modules/storage-account/`
- **Files**:
  - `main.bicep`: Core logic for the storage account deployment.
  - `variables.bicep`: Variables for configuration.
  - `outputs.bicep`: Outputs resource details.

## Prerequisites

1. **Azure CLI**: Ensure Azure CLI is installed and available in your GitHub Actions runner.
2. **Azure Credentials**: Add Azure credentials to your repository's secrets:
   - Go to `Settings > Secrets > Actions > New Repository Secret`.
   - Add a secret named `AZURE_CREDENTIALS` with the JSON output of `az ad sp create-for-rbac`.

## Usage

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd infra-repo
   ```

2. Use the workflows:
   - Go to the GitHub repository's "Actions" tab.
   - Choose a workflow (e.g., `Create Resource Group`) and trigger it manually with the required inputs.

3. Manage the modules:
   - Modify the Bicep files under `modules/` to add new resources.
   - Update workflows to include new modules as needed.

## Future Enhancements

- Add support for additional Azure resources.
- Implement automated testing for Bicep templates.
- Configure cost management and monitoring.

## License

This project is licensed under the [MIT License](LICENSE).
```

Let me know if there’s anything else you’d like to add or modify!
