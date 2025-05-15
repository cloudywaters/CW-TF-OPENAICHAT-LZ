output "id" {
  description = "The ID of the SQL database"
  value       = azurerm_mssql_database.database.id
}

output "server_id" {
  description = "The ID of the SQL server"
  value       = azurerm_mssql_server.server.id
}

output "database_id" {
  description = "The ID of the SQL database"
  value       = azurerm_mssql_database.database.id
}

output "connection_string" {
  description = "The connection string for the SQL database"
  value       = "Server=${azurerm_mssql_server.server.fully_qualified_domain_name};Database=${azurerm_mssql_database.database.name};User ID=${var.admin_username};Password=${var.admin_password};"
  sensitive   = true
}
