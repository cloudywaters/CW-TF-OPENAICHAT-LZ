
output "function_api_spec_url" {
  description = "URL to the Swagger/OpenAPI definition for the Function App"
  value       = "https://${azurerm_linux_function_app.function.default_hostname}/api/swagger.json"
}
output "name" {
  description = "Name of the Function App"
  value       = azurerm_linux_function_app.function.name
}
