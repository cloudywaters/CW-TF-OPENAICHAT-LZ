
variable "name" {
  description = "Key Vault name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "admin_object_id" {
  description = "Admin or bootstrapper object ID for initial access"
  type        = string
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
