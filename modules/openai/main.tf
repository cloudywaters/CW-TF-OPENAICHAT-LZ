
resource "azurerm_cognitive_account" "openai" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  kind                      = "OpenAI"
  sku_name                  = "S0"
  custom_subdomain_name     = var.subdomain
  public_network_access_enabled = false

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
