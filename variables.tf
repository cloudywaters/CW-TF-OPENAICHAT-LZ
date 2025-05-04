
variable "prefix" {}
variable "suffix" {}
variable "location" {}
variable "resource_group_name" {}
variable "network_rg" {}
variable "address_space" {
  type = list(string)
}
variable "subnets" {
  type = map(string)
}
variable "branch" {}
variable "repository_url" {}
variable "token_secret_name" {}
variable "web_app_settings" {
  type = map(string)
}
variable "function_app_settings" {
  type = map(string)
}
variable "storage_account_name" {}
variable "sql_admin_username" {}
variable "sql_admin_password" {
  sensitive = true
}
variable "openai_subdomain" {}
variable "apim_publisher_name" {}
variable "apim_publisher_email" {}
variable "apim_sku" {}
variable "function_api_spec_url" {}
variable "openai_api_spec_url" {}
variable "appgw_subnet_id" {}
variable "tags" {
  type = map(string)
}
