variable "name" {
  description = "The name of the API Management instance"
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

variable "publisher_name" {
  description = "The name of the publisher"
  type        = string
}

variable "publisher_email" {
  description = "The email of the publisher"
  type        = string
}

variable "sku_name" {
  description = "The SKU of the API Management instance"
  type        = string
  default     = "Developer_1"
}

variable "function_api_spec_url" {
  description = "The URL of the Function API specification"
  type        = string
  default     = ""
}

variable "openai_api_spec_url" {
  description = "The URL of the OpenAI API specification"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
