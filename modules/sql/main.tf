module "sql_server" {
  source  = "Azure/avm-res-sql-server/azurerm"
  version = "0.1.4"

  name                       = var.sql_server_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  administrator_login        = var.admin_username
  administrator_login_password = var.admin_password
  tags                       = var.tags
}

resource "azurerm_mssql_database" "db" {
  name           = var.database_name
  server_id      = module.sql_server.id
  sku_name       = "Basic"
  zone_redundant = false
  tags           = var.tags
}

