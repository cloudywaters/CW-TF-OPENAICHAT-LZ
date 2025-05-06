#########################
# main.tf (root module with explicit dependencies)
#########################

# Create Resource Groups
resource "azurerm_resource_group" "core" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "network" {
  name     = var.network_rg
  location = var.location
  tags     = var.tags
}


# Networking Module (depends on network RG)
module "network" {
  source              = "./modules/network"
  vnet_name           = module.naming.virtual_network_name
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags

  depends_on = [
    azurerm_resource_group.network
  ]
}

# Key Vault Module (after network)
module "keyvault" {
  source              = "./modules/keyvault"
  name                = module.naming.key_vault_name
  resource_group_name = azurerm_resource_group.core.name
  location            = var.location
  admin_object_id     = data.azurerm_client_config.current.object_id
  tags                = var.tags

  depends_on = [
    module.network
  ]
}

# Static Web App Module (needs keyvault & network)
module "static_web_app" {
  source              = "./modules/staticwebapp"
  name                = module.naming.static_web_app_name
  resource_group_name = azurerm_resource_group.core.name
  location            = var.location
  branch              = var.branch
  repository_url      = var.repository_url
  token_secret_name   = "@Microsoft.KeyVault(SecretName=static-webapp-token)"
  app_settings        = var.web_app_settings
  tags                = var.tags

  depends_on = [
    module.keyvault,
    module.network
  ]
}

# Function App Module (needs keyvault & network)
module "avm_function_app" {
  source                  = "./modules/functionapp"
  name                    = var.function_app_name
  resource_group_name     = azurerm_resource_group.core.name
  location                = var.location
  app_settings          = { "OPENAI_API_KEY" = "@Microsoft.KeyVault(SecretName=openai-api-key)" }
  tags                  = var.tags

  depends_on = [
    module.keyvault,
    module.network
  ]
}

# SQL Module (needs keyvault & network)
module "sql" {
  source                = "./modules/sql"
  name                  = module.naming.sql_database_name
  sql_server_name       = module.naming.sql_server_name
  resource_group_name   = azurerm_resource_group.core.name
  location              = var.location
  admin_username        = var.sql_admin_username
  admin_password        = azurerm_key_vault_secret.sql_admin_password.value
  tags                  = var.tags

  depends_on = [
    module.keyvault,
    module.network
  ]
}

# OpenAI Module (after network)
module "openai" {
  source                = "./modules/openai"
  name                  = module.naming.openai_name
  resource_group_name   = azurerm_resource_group.core.name
  location              = var.location
  subdomain             = var.openai_subdomain
  tags                  = var.tags

  depends_on = [
    module.network
  ]
}

# API Management Module (after function and openai)
module "apim" {
  source                = "./modules/apim"
  name                  = module.naming.apim_name
  resource_group_name   = azurerm_resource_group.core.name
  location              = var.location
  publisher_name        = var.apim_publisher_name
  publisher_email       = var.apim_publisher_email
  sku_name              = var.apim_sku
  function_api_spec_url = module.function_app.function_api_spec_url
  openai_api_spec_url   = module.openai.openai_api_spec_url
  tags                  = var.tags

  depends_on = [
    module.function_app,
    module.openai
  ]
}

# Application Gateway Module (after network)
module "appgateway" {
  source                = "./modules/appgateway"
  name                  = module.naming.application_gateway_name
  resource_group_name   = azurerm_resource_group.core.name
  location              = var.location
  subnet_id             = module.network.subnets["appgw"].id
  tags                  = var.tags

  depends_on = [
    module.network
  ]
}

# Secret generation and Key Vault storage (auto-generated)
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

# Access Policies for Managed Identities
resource "azurerm_key_vault_access_policy" "functionapp" {
  key_vault_id = module.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.function_app.identity.principal_id

  secret_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "staticwebapp" {
  key_vault_id = module.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.static_web_app.identity.principal_id

  secret_permissions = ["get"]
}
