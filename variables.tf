// Prefix for resource naming convention
variable "prefix" {}

// Suffix for resource naming convention to ensure uniqueness
variable "suffix" {}

// Azure region where resources will be deployed
variable "location" {}

// Name of the core resource group
variable "resource_group_name" {}

// Name of the network resource group
variable "network_rg" {}

// Address space for the virtual network
variable "address_space" {
  type = list(string)
}

// Subnet definitions for the virtual network
variable "subnets" {
  type = map(string)
}

// Branch name for deployment
variable "branch" {}

// Repository URL for the static web app
variable "repository_url" {}

// Secret name for the deployment token
variable "token_secret_name" {}

// Application settings for the web app
variable "web_app_settings" {
  type = map(string)
}

// Application settings for the function app
variable "function_app_settings" {
  type = map(string)
}

// Name of the storage account
variable "storage_account_name" {}

// SQL admin username
variable "sql_admin_username" {}

// SQL admin password (sensitive)
variable "sql_admin_password" {
  sensitive = true
}

// Subdomain for OpenAI Cognitive Services
variable "openai_subdomain" {}

// Publisher name for API Management
variable "apim_publisher_name" {}

// Publisher email for API Management
variable "apim_publisher_email" {}

// SKU for API Management
variable "apim_sku" {}

// Subnet ID for Application Gateway
variable "appgw_subnet_id" {}

// Tags to apply to all resources
variable "tags" {
  type = map(string)
}
