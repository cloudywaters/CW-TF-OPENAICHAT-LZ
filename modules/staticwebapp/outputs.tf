output "id" {
  description = "The ID of the Static Web App"
  value       = azurerm_static_site.swa.id
}

output "name" {
  description = "The name of the Static Web App"
  value       = azurerm_static_site.swa.name
}

output "default_host_name" {
  description = "The default hostname of the Static Web App"
  value       = azurerm_static_site.swa.default_host_name
}

output "api_key" {
  description = "The API key of the Static Web App"
  value       = azurerm_static_site.swa.api_key
  sensitive   = true
}

output "identity" {
  description = "The managed identity of the Static Web App"
  value       = azurerm_static_site.swa.identity
}
