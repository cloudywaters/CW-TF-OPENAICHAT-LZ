
variable "name" {
  description = "OpenAI resource name"
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
variable "subdomain" {
  description = "Custom subdomain name"
  type        = string
}
variable "tags" {
  description = "Tags to apply to OpenAI"
  type        = map(string)
}
variable "sku_name" {
  type        = string
  description = "The SKU name for the OpenAI resource"
  default     = "S0"
}