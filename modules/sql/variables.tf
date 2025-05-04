
variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}
variable "name" {
  description = "SQL Database name"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "admin_username" {
  description = "SQL admin username"
  type        = string
}
variable "admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}
variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
