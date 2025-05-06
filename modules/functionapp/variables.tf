
variable "name" {
  description = "Function App name"
  type        = string
}
variable "location" {
  description = "Azure location"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "storage_account_name" {
  description = "Storage account for Function App"
  type        = string
}
variable "app_settings" {
  description = "Application settings"
  type        = map(string)
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
variable "function_sku_name" {
  description = "Function App SKU name"
  type        = map(string)
  }
variable "function_sku_tier" {
  description = "Function App SKU tier"
  type        = map(string)
}
