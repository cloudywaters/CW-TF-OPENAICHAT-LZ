output "vnet_id" {
  value       = azurerm_virtual_network.example.id
  description = "The ID of the Virtual Network"
}

output "subnet_ids" {
  value       = azurerm_subnet.example.*.id
  description = "The IDs of the Subnets"
}