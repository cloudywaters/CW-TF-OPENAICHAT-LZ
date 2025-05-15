variable "name" {
  description = "The name of the function app"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region of the resources"
  type        = string
}

variable "app_settings" {
  description = "Application settings for the function app"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "create_api_spec" {
  description = "Whether to create an API Management API for the function"
  type        = bool
  default     = false
}

variable "api_management_name" {
  description = "The name of the API Management instance"
  type        = string
  default     = ""
}
