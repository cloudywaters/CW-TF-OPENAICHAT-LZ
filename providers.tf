terraform {
  required_version = ">= 1.11"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.70"    # pick a single Azurerm version
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.8"     # pick a single AzAPI version
    }
  }
}