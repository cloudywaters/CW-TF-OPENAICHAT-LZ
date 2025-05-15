resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
  
  tags = var.tags
}

resource "azurerm_mssql_database" "database" {
  name                = var.name
  server_id           = azurerm_mssql_server.server.id
  collation           = var.collation
  sku_name            = var.sku_name
  max_size_gb         = var.max_size_gb
  
  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

