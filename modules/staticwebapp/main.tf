
module "static_web_app" {
  source  = "Azure/avm-res-web-static-web-app/azurerm"
  version = "1.0.0"

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  identity = {
    type = "SystemAssigned"
  }

  deployment = {
    branch            = var.branch
    repository_url    = var.repository_url
    token_secret_name = var.token_secret_name
  }

  app_settings = var.app_settings

  tags = var.tags
}
