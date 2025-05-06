module "function" {
  source  = "Azure/avm-res-compute-functionapp/azurerm"
  version = "0.4.0"

  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  service_plan_resource_id = var.service_plan_resource_id  # Pass the App Service Plan resource ID
  os_type                  = var.os_type                   # Specify the OS type (e.g., Linux or Windows)

  app_settings = {
    "FUNCTIONS_EXTENSION_VERSION" = "~4"
    "WEBSITE_RUN_FROM_PACKAGE"    = "1"
  }

  tags = var.tags
}

