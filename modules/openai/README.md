# OpenAI Cognitive Services Module

This module deploys an Azure Cognitive Services resource configured for OpenAI.

## Inputs

- `name`: Name of the OpenAI resource.
- `location`: Azure region where the resource will be deployed.
- `resource_group_name`: Name of the resource group.
- `subdomain`: Custom subdomain name for the OpenAI resource.
- `tags`: Tags to apply to the resource.

## Outputs

- `openai_api_spec_url`: URL to the OpenAPI specification for the OpenAI API.

## Example Usage

```hcl
module "openai" {
  source              = "./modules/openai"
  name                = "example-openai"
  location            = "eastus"
  resource_group_name = "example-rg"
  subdomain           = "example-subdomain"
  tags = {
    project = "example-project"
    env     = "production"
  }
}
```
