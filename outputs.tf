
output "static_web_url" {
  value = module.static_web_app.name
}
output "function_app_url" {
  value = module.function_app.name
}
output "sql_server_name" {
  value = module.sql.sql_server_name
}
output "openai_endpoint" {
  value = module.openai.name
}
output "apim_instance_name" {
  value = module.apim.name
}
output "application_gateway_name" {
  value = module.appgateway.name
}

output "core_resource_group_name" {
  value = azurerm_resource_group.core.name
}
output "network_resource_group_name" {
  value = azurerm_resource_group.network.name
}
output "function_app_name" {
  description = "Name of the Function App"
  value       = module.function_app.name
}

output "static_webapp_name" {
  description = "Name of the Static Web App"
  value       = module.static_web_app.name
}

output "resource_group_name" {
  description = "Resource group used for all app resources"
  value       = azurerm_resource_group.core.name
}
