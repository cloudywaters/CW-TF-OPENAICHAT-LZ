// modules/functionapp/main.tf

module "avm_function_app" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "0.6.3"               // pick the latest published version

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  // Consumption plan
  kind     = "functionapp"
  sku_name = "var.function_sku_name"
  sku_tier = "var.function_sku_tier"

  // Runtime stack
  site_config = {
    linux_fx_version = "PYTHON:3.11"
  }

  identity = {
    type = "SystemAssigned"
  }

  app_settings = var.app_settings
  tags         = var.tags
}


