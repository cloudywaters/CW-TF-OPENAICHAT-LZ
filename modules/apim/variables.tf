
variable "name" {
  description = "API Management name"
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
variable "publisher_name" {
  description = "Publisher name"
  type        = string
}
variable "publisher_email" {
  description = "Publisher email"
  type        = string
}
variable "sku_name" {
  description = "SKU (e.g., Developer_1, Consumption)"
  type        = string
}
variable "function_api_spec_url" {
  description = "URL to Swagger/OpenAPI spec for Function App"
  type        = string
}
variable "openai_api_spec_url" {
  description = "URL to Swagger/OpenAPI spec for OpenAI"
  type        = string
}
variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
