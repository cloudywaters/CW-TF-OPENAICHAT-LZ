module "openai" {
  source  = "Azure/avm-res-cognitiveservices-account/azurerm"
  version = "1.0.0"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "S0"
  kind                = "OpenAI"
  custom_subdomain    = var.subdomain

  network_acls = {
    default_action = "Deny"
    virtual_network_rules = [{
      subnet_id = var.subnet_id
    }]
  }

  tags = var.tags
}

