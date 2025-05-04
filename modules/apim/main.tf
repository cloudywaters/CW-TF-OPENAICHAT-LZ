
resource "azurerm_api_management" "apim" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_api_management_api" "function_api" {
  name                = "func-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Function App API"
  path                = "function"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = var.function_api_spec_url
  }
}

resource "azurerm_api_management_api" "openai_api" {
  name                = "openai-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "OpenAI API"
  path                = "openai"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = var.openai_api_spec_url
  }
}
