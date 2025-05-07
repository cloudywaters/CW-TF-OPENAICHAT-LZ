terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.13.0"
    }
  }
}