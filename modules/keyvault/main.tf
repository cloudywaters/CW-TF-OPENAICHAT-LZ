module "kv" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.16.4"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policies = [
    for p in var.access_policies : {
      tenant_id = data.azurerm_client_config.current.tenant_id
      object_id = p.object_id
      secret_permissions = p.secret_permissions
    }
  ]

  tags = var.tags
}
