
variable "name" {
  description = "Application Gateway name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group for App Gateway"
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID for App Gateway"
  type        = string
}
variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
}
