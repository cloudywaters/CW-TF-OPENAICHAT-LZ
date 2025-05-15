# Azure OpenAI Service module

# Azure OpenAI Service
resource "azurerm_cognitive_account" "openai" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  kind                  = "OpenAI"
  sku_name              = var.sku_name
  custom_subdomain_name = var.subdomain
  
  tags = var.tags
}

# OpenAI Model Deployment - GPT
resource "azurerm_cognitive_deployment" "gpt" {
  name                 = "gpt-35-turbo"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  
  model {
    name     = "gpt-35-turbo"
    version  = "0301"
    format   = "OpenAI"
  }
  
  sku {
    name     = "Standard"
    capacity = 1
  }
}

# OpenAI Model Deployment - Embeddings
resource "azurerm_cognitive_deployment" "embeddings" {
  name                 = "text-embedding-ada-002"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  
  model {
    name     = "text-embedding-ada-002"
    version  = "2"
    format   = "OpenAI"
  }
  
  sku {
    name     = "Standard"
    capacity = 1
  }
}

