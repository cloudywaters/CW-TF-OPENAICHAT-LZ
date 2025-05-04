
variable "name" {
  description = "Name of the Static Web App"
  type        = string
}
variable "location" {
  description = "Azure location"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "branch" {
  description = "Branch name for deployment"
  type        = string
}
variable "repository_url" {
  description = "GitHub repository URL"
  type        = string
}
variable "token_secret_name" {
  description = "Secret name for deployment token"
  type        = string
}
variable "app_settings" {
  description = "App settings for the Static Web App"
  type        = map(string)
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
