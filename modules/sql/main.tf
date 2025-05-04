
resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_database" "sql" {
  name           = var.name
  server_id      = azurerm_mssql_server.sql.id
  sku_name       = "Basic"
  zone_redundant = false
  tags           = var.tags
}
