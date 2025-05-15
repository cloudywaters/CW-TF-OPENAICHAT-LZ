# Azure Function App Module

# The Storage Account for Function App
resource "azurerm_storage_account" "function" {
  name                     = lower(replace("st${var.name}sa", "-", ""))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  
  tags = var.tags
}

# App Service Plan for Function App
resource "azurerm_service_plan" "function" {
  name                = "plan-${var.name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption plan
  
  tags = var.tags
}

# Function App
resource "azurerm_linux_function_app" "function" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.function.id
  storage_account_name       = azurerm_storage_account.function.name
  storage_account_access_key = azurerm_storage_account.function.primary_access_key
  
  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
  
  app_settings = var.app_settings
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = var.tags
}

# Function API Management API
resource "azurerm_api_management_api" "function" {
  count               = var.create_api_spec ? 1 : 0
  name                = "function-api"
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = "Function API"
  path                = "function"
  protocols           = ["https"]
}


