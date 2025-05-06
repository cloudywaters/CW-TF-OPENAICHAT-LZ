module "function" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "1.0.0"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = "functionapp"
  sku_name            = "Y1"      # Consumption plan
  sku_tier            = "Dynamic"

  site_config = {
    linux_fx_version = "PYTHON:3.11"
  }

  identity = {
    type = "SystemAssigned"
  }

  app_settings = var.app_settings
  tags         = var.tags
}

