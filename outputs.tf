# Resource Group Outputs
output "core_resource_group_name" {
  value = azurerm_resource_group.core.name
}

output "network_resource_group_name" {
  value = azurerm_resource_group.network.name
}

# Network Outputs
output "vnet_id" {
  value = module.network.vnet_id
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

# Key Vault Outputs
output "key_vault_id" {
  value = module.keyvault.id
}

output "key_vault_name" {
  value = module.keyvault.name
}

output "key_vault_uri" {
  value = module.keyvault.vault_uri
}

# Static Web App Outputs
output "static_web_app_id" {
  value = module.static_web_app.id
}

output "static_web_app_default_host_name" {
  value = module.static_web_app.default_host_name
}

# Function App Outputs
output "function_app_id" {
  value = module.function_app.id
}

output "function_app_hostname" {
  value = module.function_app.hostname
}

# SQL Outputs
output "sql_server_id" {
  value = module.sql.server_id
}

output "sql_database_id" {
  value = module.sql.database_id
}

# OpenAI Outputs
output "openai_id" {
  value = module.openai.id
}

output "openai_endpoint" {
  value = module.openai.endpoint
}

# APIM Outputs
output "apim_id" {
  value = module.apim.id
}

output "apim_gateway_url" {
  value = module.apim.gateway_url
}

# App Gateway Outputs
output "app_gateway_id" {
  value = module.appgateway.id
}

output "app_gateway_public_ip" {
  value = module.appgateway.public_ip
}
