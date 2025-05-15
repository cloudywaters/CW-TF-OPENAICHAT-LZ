# Azure Key Vault Module

# Create Key Vault
resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
  
  tags = var.tags
}

# Add access policy for admin
resource "azurerm_key_vault_access_policy" "admin" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.admin_object_id

  key_permissions = [
    "Get", "List", "Create", "Delete", "Update",
  ]

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge",
  ]

  certificate_permissions = [
    "Get", "List", "Create", "Delete", "Update",
  ]
}

# Data sources
data "azurerm_client_config" "current" {}
