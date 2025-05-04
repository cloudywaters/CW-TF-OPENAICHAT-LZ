# Static Web App Module

This module deploys an Azure Static Web App using the AVM (Azure Virtual Machine) resource module.

## Inputs

- `name`: Name of the Static Web App.
- `location`: Azure region where the app will be deployed.
- `resource_group_name`: Name of the resource group.
- `branch`: Branch name for deployment.
- `repository_url`: GitHub repository URL for the app.
- `token_secret_name`: Secret name for the deployment token.
- `app_settings`: Application settings for the Static Web App.
- `tags`: Tags to apply to the resource.

## Outputs

- `static_web_url`: The URL of the deployed Static Web App.

## Example Usage

```hcl
module "static_web_app" {
  source              = "./modules/staticwebapp"
  name                = "example-static-web-app"
  location            = "eastus"
  resource_group_name = "example-rg"
  branch              = "main"
  repository_url      = "https://github.com/example/repo"
  token_secret_name   = "STATIC_WEBAPP_TOKEN"
  app_settings        = {
    "ENVIRONMENT" = "production"
  }
  tags = {
    project = "example-project"
    env     = "production"
  }
}
```
