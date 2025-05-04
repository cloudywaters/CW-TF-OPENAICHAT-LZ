# Virtual Network Module

This module deploys an Azure Virtual Network (VNet) and its associated subnets.

## Inputs

- `vnet_name`: Name of the Virtual Network.
- `location`: Azure region where the VNet will be deployed.
- `resource_group_name`: Name of the resource group.
- `address_space`: Address space for the VNet.
- `subnets`: Map of subnet names to address prefixes.
- `tags`: Tags to apply to the VNet and subnets.

## Outputs

None.

## Example Usage

```hcl
module "network" {
  source              = "./modules/network"
  vnet_name           = "example-vnet"
  location            = "eastus"
  resource_group_name = "example-rg"
  address_space       = ["10.0.0.0/16"]
  subnets = {
    "web"     = "10.0.1.0/24",
    "backend" = "10.0.2.0/24"
  }
  tags = {
    project = "example-project"
    env     = "production"
  }
}
```
