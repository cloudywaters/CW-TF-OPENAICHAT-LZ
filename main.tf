module "naming" {
  source = "./modules/naming"
  prefix = var.prefix
  suffix = var.suffix
}

resource "azurerm_resource_group" "core" {
  name     = module.naming.core_rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "network" {
  name     = module.naming.network_rg_name
  location = var.location
  tags     = var.tags
}

module "network" {
  depends_on         = [azurerm_resource_group.network]
  source              = "./modules/network"
  vnet_name           = module.naming.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags
}

module "static_web_app" {
  source              = "./modules/staticwebapp"
  name                = module.naming.static_web_app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.core.name
  branch              = var.branch
  repository_url      = var.repository_url
  token_secret_name   = "@Microsoft.KeyVault(SecretName=static-webapp-token)"
  app_settings        = var.web_app_settings
  tags                = var.tags
}

module "function_app" {
  source                = "./modules/functionapp"
  name                  = module.naming.function_app_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.core.name
  storage_account_name  = var.storage_account_name
  app_settings          = {
    "OPENAI_API_KEY" = "@Microsoft.KeyVault(SecretName=openai-api-key)"
    "OPENAI_API_SPEC_URL" = module.openai.openai_api_spec_url
  }
  tags                  = var.tags
}

module "sql" {
  source                = "./modules/sql"
  name                  = module.naming.sql_db_name
  sql_server_name       = module.naming.sql_server_name
  resource_group_name   = azurerm_resource_group.core.name
  location              = var.location
  admin_username        = var.sql_admin_username
  admin_password        = var.sql_admin_password
  tags                  = var.tags
}

module "openai" {
  source                = "./modules/openai"
  name                  = module.naming.openai_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.core.name
  subdomain             = var.openai_subdomain
  tags                  = var.tags
}

module "apim" {
  depends_on            = [module.function_app]
  depends_on            = [module.openai]
  source                = "./modules/apim"
  name                  = module.naming.apim_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.core.name
  publisher_name        = var.apim_publisher_name
  publisher_email       = var.apim_publisher_email
  sku_name              = var.apim_sku
  function_api_spec_url = module.function_app.function_api_spec_url
  openai_api_spec_url   = module.openai.openai_api_spec_url
  tags                  = var.tags
}

module "appgateway" {
  depends_on            = [module.network]
  depends_on            = [module.apim]
  depends_on            = [module.static_web_app]
  depends_on            = [module.function_app]
  source                = "./modules/appgateway"
  name                  = module.naming.app_gateway_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.core.name
  subnet_id             = var.appgw_subnet_id
  tags                  = var.tags
}

resource "random_password" "sql_admin_password" {
  length  = 16
  special = true
}

resource "random_password" "openai_api_key" {
  length  = 32
  special = true
}

resource "random_password" "static_webapp_token" {
  length  = 40
  special = true
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  value        = random_password.sql_admin_password.result
  key_vault_id = module.keyvault.id
}

resource "azurerm_key_vault_secret" "openai_api_key" {
  name         = "openai-api-key"
  value        = random_password.openai_api_key.result
  key_vault_id = module.keyvault.id
}

resource "azurerm_key_vault_secret" "static_webapp_token" {
  name         = "static-webapp-token"
  value        = random_password.static_webapp_token.result
  key_vault_id = module.keyvault.id
}

resource "azurerm_key_vault_access_policy" "functionapp" {
  key_vault_id = module.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_linux_function_app.function.identity[0].principal_id

  secret_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "staticwebapp" {
  key_vault_id = module.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_static_site.static.identity[0].principal_id

  secret_permissions = ["get"]
}
