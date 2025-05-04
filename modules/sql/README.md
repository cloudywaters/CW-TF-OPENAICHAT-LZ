# SQL Server and Database Module

This module deploys an Azure SQL Server and a SQL Database.

## Inputs

- `sql_server_name`: Name of the SQL Server.
- `name`: Name of the SQL Database.
- `resource_group_name`: Name of the resource group.
- `location`: Azure region where the resources will be deployed.
- `admin_username`: Admin username for the SQL Server.
- `admin_password`: Admin password for the SQL Server (sensitive).
- `tags`: Tags to apply to the resources.

## Outputs

- `sql_server_name`: The name of the deployed SQL Server.

## Example Usage

```hcl
module "sql" {
  source              = "./modules/sql"
  sql_server_name     = "example-sql-server"
  name                = "example-database"
  resource_group_name = "example-rg"
  location            = "eastus"
  admin_username      = "adminuser"
  admin_password      = "securepassword"
  tags = {
    project = "example-project"
    env     = "production"
  }
}
```
