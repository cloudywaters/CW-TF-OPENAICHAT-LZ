# Azure CAF Naming module
# Based on https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

locals {
  # Resource type prefixes as per Azure CAF
  prefix_map = {
    resource_group         = "rg"
    virtual_network        = "vnet"
    subnet                 = "snet"
    network_security_group = "nsg"
    key_vault              = "kv"
    sql_server             = "sql"
    sql_database           = "sqldb"
    static_web_app         = "swa"
    function_app           = "func"
    application_gateway    = "agw"
    api_management         = "apim"
    openai                 = "oai"
  }
  
  # Generate resource names with standard pattern: prefix-env-project-region-###
  resource_group_name      = "${local.prefix_map.resource_group}-${var.environment}-${var.project_name}-${var.instance_num}"
  virtual_network_name     = "${local.prefix_map.virtual_network}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  key_vault_name           = "${local.prefix_map.key_vault}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  sql_server_name          = "${local.prefix_map.sql_server}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  sql_database_name        = "${local.prefix_map.sql_database}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  static_web_app_name      = "${local.prefix_map.static_web_app}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  function_app_name        = "${local.prefix_map.function_app}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  application_gateway_name = "${local.prefix_map.application_gateway}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  apim_name                = "${local.prefix_map.api_management}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
  openai_name              = "${local.prefix_map.openai}-${var.environment}-${var.project_name}-${var.region_code}-${var.instance_num}"
}
