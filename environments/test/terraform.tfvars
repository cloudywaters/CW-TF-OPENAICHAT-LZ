# Input variables for the environment

prefix              = "chat"
suffix              = "001"
location            = "australiaeast"


address_space = ["10.0.0.0/16"]
subnets = {
  "web"     = "10.0.1.0/24",
  "func"    = "10.0.2.0/24",
  "appgw"   = "10.0.3.0/24",
  "private" = "10.0.4.0/24"
}

branch              = "main"
repository_url      = "https://github.com/your-org/azure-landingzone-chatapp"
token_secret_name   = "STATIC_WEBAPP_TOKEN"

web_app_settings = {
  "ENVIRONMENT" = "test"
}
storage_account_name = "tfchatstorage"
sql_admin_username   = "sqladmin"
openai_subdomain     = "chatopenai001"

apim_publisher_name  = "ChatOps"
apim_publisher_email = "chat@example.com"
apim_sku             = "Developer_1"
tags = {
  project = "chat-landingzone"
  env     = "test"
}
