terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.117.0, < 5.0.0"  # Updated version constraint to satisfy all modules
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"  # Updated to be compatible with all modules
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 1.13.0, < 3.0.0"
    }
    # Fix the namespace for modtm provider
    modtm = {
      source  = "Azure/modtm"
      version = "~> 0.3"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1, < 2.0.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

