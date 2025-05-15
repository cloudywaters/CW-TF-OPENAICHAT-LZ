output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnets" {
  description = "Map of subnet objects"
  value       = azurerm_subnet.subnet
}

output "nsg_ids" {
  description = "Map of network security group IDs"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}