variable "name" {
  description = "The name of the SQL database"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server"
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

variable "admin_username" {
  description = "The administrator username for the SQL server"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "The administrator password for the SQL server"
  type        = string
  sensitive   = true
}

variable "server_version" {
  description = "The version of the SQL Server (e.g., '12.0')"
  type        = string
  default     = "12.0"
}

variable "collation" {
  description = "SQL database collation"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "sku_name" {
  description = "SQL database SKU name"
  type        = string
  default     = "Basic"
}

variable "max_size_gb" {
  description = "The maximum size of the SQL database in gigabytes"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
