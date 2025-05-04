
resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.admin_object_id

    secret_permissions = ["get", "list", "set", "delete"]
  }

  tags = var.tags
}

output "id" {
  value = azurerm_key_vault.this.id
}
output "name" {
  value = azurerm_key_vault.this.name
}
