# Azure OpenAI Chat Landing Zone

This Terraform implementation provides an infrastructure-as-code approach to deploy a secure, scalable Azure landing zone for OpenAI-powered chat applications.

## Architecture Overview

This landing zone deploys a comprehensive solution with the following components:

- **Azure OpenAI Service**: Provides AI model capabilities
- **Function App**: Hosts backend logic and API endpoints
- **Static Web App**: Serves the frontend application
- **Azure SQL Database**: Stores chat data and history
- **Key Vault**: Securely manages secrets
- **API Management**: Centralizes API governance
- **Application Gateway**: Handles traffic routing and WAF protection
- **Virtual Network**: Secures communication between services

## 🚀 Features

- **Static Web App** (React) front-end
- **Python Azure Function App** backend with OpenAI integration
- **Azure SQL Database** with private networking
- **API Management** (APIM) exposing Function and OpenAI APIs
- **Application Gateway with WAF** and Private Endpoints
- **Azure Key Vault** for secure secret management
- **Azure OpenAI** with custom chatbot integration
- **Three Environments**: `sandbox`, `test`, `prod`
- **GitHub Actions & Azure DevOps Pipelines**
- **Auto-generated Secrets** stored securely
- **Modular Terraform Code** with Azure Verified Modules (AVM)

## 📁 Project Structure

```
.
├── .github/workflows/              # GitHub Actions workflows (deploy, destroy)
├── .pipelines/                     # Azure DevOps pipeline templates
├── environments/                  # Env-specific tfvars & backend config
│   └── sandbox/
├── modules/                        # Reusable Terraform modules
├── src/                            # Application source code
│   ├── functionapp/                # Python Azure Function
│   └── webapp/                     # React Static Web App
├── main.tf                         # Root module wiring
├── variables.tf
├── outputs.tf
├── backend.tf
```

## 🧪 How to Use

### 🔐 Prerequisites

- Azure CLI + Terraform CLI
- GitHub repo with configured OIDC federated identity (or Service Principal)
- Resource groups for state backend (or use Terraform to create them)

### 🧱 Bootstrap State Storage

```bash
az storage container create --name tfstate --account-name <storage-name>
```

### 🌍 Deploy an Environment

```bash
terraform init -backend-config=environments/sandbox/backend.tfvars
terraform apply -var-file=environments/sandbox/terraform.tfvars
```

Or run the GitHub Action from the **Actions** tab.

### 💥 Destroy an Environment

Manually trigger the `Destroy Environment` workflow in GitHub and select the environment.

## 🔄 Secrets & Key Vault Integration

All sensitive values are:
- Auto-generated using `random_password`
- Stored in Key Vault (`sql-admin-password`, `openai-api-key`, `static-webapp-token`)
- Referenced securely via managed identity (e.g., `@Microsoft.KeyVault(...)`)

## 📦 Deployment Pipelines

- `.github/workflows/terraform.yml` automatically deploys `sandbox` and `test`, gates `prod`
- `.github/workflows/terraform-destroy.yml` allows manual environment teardown

## 📄 License

MIT License
