# Environment Variables
variable "environment" {
  description = "Environment (dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "region_code" {
  description = "Short region code (e.g., 'weu' for West Europe)"
  type        = string
}

variable "prefix" {
  description = "Prefix to be used in resource naming"
  type        = string
  default     = "chat"
}

variable "instance_num" {
  description = "Instance number for resources"
  type        = string
  default     = "001"
}

# Resource Group Variables
variable "resource_group_name" {
  description = "Core resource group name"
  type        = string
  default     = null # Will use the naming module if not specified
}

variable "network_rg" {
  description = "Network resource group name"
  type        = string
  default     = null # Will use the naming module if not specified
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

# Network Variables
variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    address_prefixes  = list(string)
    service_endpoints = optional(list(string))
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }))
  }))
}

# Static Web App Variables
variable "branch" {
  description = "Branch name for static web app"
  type        = string
}

variable "repository_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "web_app_settings" {
  description = "Application settings for static web app"
  type        = map(string)
  default     = {}
}

# Function App Variables
variable "function_app_name" {
  description = "Function app name"
  type        = string
  default     = null # Will use the naming module if not specified
}

# SQL Variables
variable "sql_admin_username" {
  description = "SQL admin username"
  type        = string
  sensitive   = true
}

# OpenAI Variables
variable "openai_subdomain" {
  description = "OpenAI service subdomain"
  type        = string
}

variable "openai_sku" {
  description = "OpenAI service SKU"
  type        = string
  default     = "S0"
}

# APIM Variables
variable "apim_publisher_name" {
  description = "API Management publisher name"
  type        = string
}

variable "apim_publisher_email" {
  description = "API Management publisher email"
  type        = string
}

variable "apim_sku" {
  description = "API Management SKU"
  type        = string
  default     = "Developer"
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}