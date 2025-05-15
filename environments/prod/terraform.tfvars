# Environment configuration
environment  = "prod"
project_name = "chat"
region_code  = "aue"  # Australia East
location     = "australiaeast"
instance_num = "001"  # Using the suffix as instance number

# Resource Group names - if you want to override the naming module's conventions
resource_group_name = "rg-prod-chat-001"
network_rg          = "rg-prod-chat-network-001"

# Network configuration
address_space = ["10.0.0.0/16"]
subnets = {
  web = {
    address_prefixes = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Web"]
  }
  func = {
    address_prefixes = ["10.0.2.0/24"]
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Web"]
  }
  appgw = {
    address_prefixes = ["10.0.3.0/24"]
  }
  private = {
    address_prefixes = ["10.0.4.0/24"]
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.CognitiveServices"]
  }
}

# Static Web App configuration
branch              = "main"
repository_url      = "https://github.com/your-org/azure-landingzone-chatapp"
web_app_settings = {
  "ENVIRONMENT" = "prod"
  "API_BASE_URL" = "https://apim-prod-chat-aue-001.azure-api.net"
}

# Function App configuration 
function_app_name   = "func-prod-chat-aue-001" # Optional - will use naming module if not specified

# Storage configuration (added to match variable)
storage_account_name = "stprodchataue001" # Following Azure naming constraints (lowercase, no hyphens)

# SQL Server configuration
sql_admin_username   = "sqladmin"
# Note: sql_admin_password should be passed securely via environment variables or secure storage
# export TF_VAR_sql_admin_password="YourSecurePassword"

# OpenAI configuration
openai_subdomain     = "chatopenai001"
openai_sku           = "S0"

# API Management configuration
apim_publisher_name  = "ChatOps"
apim_publisher_email = "chat@example.com"
apim_sku             = "Developer_1"

# Resource tagging strategy
tags = {
  project     = "chat-landingzone"
  environment = "prod"
  owner       = "ChatOps Team"
  costCenter  = "12345"
  application = "ChatAI"
}
