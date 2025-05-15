output "id" {
  description = "The ID of the Function App"
  value       = azurerm_linux_function_app.function.id
}

output "hostname" {
  description = "The default hostname of the Function App"
  value       = azurerm_linux_function_app.function.default_hostname
}

output "identity" {
  description = "The managed identity of the Function App"
  value       = azurerm_linux_function_app.function.identity
}

output "function_api_spec_url" {
  description = "The URL of the Function API specification"
  value       = "https://${azurerm_linux_function_app.function.default_hostname}/api/swagger.json"
}

output "name" {
  description = "The name of the Function App"
  value       = azurerm_linux_function_app.function.name
}
