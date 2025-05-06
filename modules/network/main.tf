module "vnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "1.0.0"

  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  subnets = {
    for k, v in var.subnets :
    k => {
      name           = k
      address_prefix = v
    }
  }

  tags = var.tags
}

