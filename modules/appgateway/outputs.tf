output "id" {
  description = "The ID of the Application Gateway"
  value       = azurerm_application_gateway.appgw.id
}

output "public_ip" {
  description = "The public IP address of the Application Gateway"
  value       = azurerm_public_ip.appgw.ip_address
}

output "name" {
  description = "The name of the Application Gateway"
  value       = azurerm_application_gateway.appgw.name
}