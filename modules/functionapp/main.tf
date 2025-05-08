module "avm_function_app" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = ">=0.7.0"                  // pick the latest published version

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  // Required arguments
  os_type                 = "Linux"  // Specify the OS type
  service_plan_resource_id = var.service_plan_resource_id

  // Runtime stack
  site_config = {
    linux_fx_version = "PYTHON:3.11"
  }

  app_settings = var.app_settings
  tags         = var.tags
}


