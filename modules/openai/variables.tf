variable "name" {
  description = "The name of the OpenAI service"
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

variable "subdomain" {
  description = "The custom subdomain name for the OpenAI service"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the OpenAI service"
  type        = string
  default     = "S0"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}