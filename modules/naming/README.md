# CAF-Aligned Naming Module

This module generates resource names aligned with the Cloud Adoption Framework (CAF) naming conventions.

## Inputs

- `prefix`: Prefix for all resource names.
- `suffix`: Suffix to ensure uniqueness.

## Outputs

- `static_web_app_name`: Name of the Static Web App.
- `function_app_name`: Name of the Function App.
- `sql_server_name`: Name of the SQL Server.
- `sql_db_name`: Name of the SQL Database.
- `openai_name`: Name of the OpenAI resource.
- `apim_name`: Name of the API Management instance.
- `vnet_name`: Name of the Virtual Network.

## Example Usage

```hcl
module "naming" {
  source = "./modules/naming"
  prefix = "example"
  suffix = "001"
}
```
