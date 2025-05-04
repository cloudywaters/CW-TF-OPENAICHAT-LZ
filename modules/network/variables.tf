
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group for VNet"
  type        = string
}
variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
}
variable "subnets" {
  description = "Map of subnet name to address prefix"
  type        = map(string)
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
