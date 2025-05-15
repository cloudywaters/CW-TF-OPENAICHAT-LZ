output "id" {
  description = "The ID of the API Management instance"
  value       = azurerm_api_management.apim.id
}

output "gateway_url" {
  description = "The gateway URL of the API Management instance"
  value       = "https://${azurerm_api_management.apim.gateway_url}"
}

output "name" {
  description = "The name of the API Management instance"
  value       = azurerm_api_management.apim.name
}

output "public_ip_addresses" {
  description = "The public IP addresses of the API Management instance"
  value       = azurerm_api_management.apim.public_ip_addresses
}
