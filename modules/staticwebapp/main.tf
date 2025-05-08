module "swa" {
  source  = "Azure/avm-res-web-staticsite/azurerm"
  version = ">=0.6.0"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  deployment = {
    branch            = var.branch
    repository_url    = var.repository_url
    token_secret_name = var.token_secret_name
  }

  app_settings = var.app_settings
  tags         = var.tags
}

