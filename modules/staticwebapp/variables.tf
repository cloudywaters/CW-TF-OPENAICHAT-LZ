variable "name" {
  description = "The name of the Static Web App"
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

variable "branch" {
  description = "The branch to deploy"
  type        = string
  default     = "main"
}

variable "repository_url" {
  description = "The URL of the GitHub repository"
  type        = string
  default     = ""
}

variable "token_secret_name" {
  description = "The name of the secret containing the GitHub token"
  type        = string
  default     = ""
}

variable "custom_domain" {
  description = "The custom domain for the Static Web App"
  type        = string
  default     = ""
}

variable "app_settings" {
  description = "Application settings for the Static Web App"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
