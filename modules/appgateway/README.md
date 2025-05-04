# Application Gateway + WAF Module

This module deploys an Azure Application Gateway with Web Application Firewall (WAF) enabled.

## Inputs

- `name`: Name of the Application Gateway.
- `location`: Azure region where the Application Gateway will be deployed.
- `resource_group_name`: Name of the resource group.
- `subnet_id`: Subnet ID where the Application Gateway will be deployed.
- `tags`: Tags to apply to the Application Gateway.

## Outputs

None.

## Example Usage

```hcl
module "appgateway" {
  source              = "./modules/appgateway"
  name                = "example-appgw"
  location            = "eastus"
  resource_group_name = "example-rg"
  subnet_id           = "subnet-id"
  tags = {
    project = "example-project"
    env     = "production"
  }
}
```
