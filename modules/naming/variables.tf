variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name or application identifier"
  type        = string
}

variable "region_code" {
  description = "Short region code (e.g., 'weu' for West Europe)"
  type        = string
}

variable "prefix" {
  description = "Prefix to be used in naming convention"
  type        = string
}

variable "suffix" {
  description = "Suffix to be used in naming convention (e.g., instance number)"
  type        = string
  default     = "001"
}

variable "instance_num" {
  description = "Instance number, starting from 001"
  type        = string
  default     = "001"
}
