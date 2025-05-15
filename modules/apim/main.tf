# Azure API Management Module

resource "azurerm_api_management" "apim" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
  
  tags = var.tags
}

# Function API
resource "azurerm_api_management_api" "function" {
  count               = var.function_api_spec_url != "" ? 1 : 0
  name                = "function-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Function API"
  path                = "function"
  protocols           = ["https"]
  
  import {
    content_format = "swagger-json"
    content_value  = var.function_api_spec_url
  }
}

# OpenAI API
resource "azurerm_api_management_api" "openai" {
  count               = var.openai_api_spec_url != "" ? 1 : 0
  name                = "openai-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "OpenAI API"
  path                = "openai"
  protocols           = ["https"]
  
  import {
    content_format = "swagger-json"
    content_value  = var.openai_api_spec_url
  }
}
