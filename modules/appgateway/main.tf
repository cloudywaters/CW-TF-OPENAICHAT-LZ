module "appgw" {
  source  = "Azure/avm-res-network-applicationgateway/azurerm"
  version = "0.4.0"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku = {
    tier     = "WAF_v2"
    name     = "WAF_v2"
    capacity = 2
  }

  frontend_ports = [
    { name = "http", port = 80 },
    { name = "https", port = 443 }
  ]

  gateway_ip_configuration = {
    name      = "appgw-ipcfg"
    subnet_id = var.subnet_id
  }

  backend_address_pools = [
    { name = "backend-pool" }
  ]

  backend_http_settings = [
    {
      name                  = "backend-settings"
      cookie_based_affinity = "Disabled"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 30
    }
  ]

  http_listeners = [
    {
      name                           = "listener"
      frontend_ip_configuration_name = "appgw-feip"
      frontend_port_name             = "https"
      protocol                       = "Https"
    }
  ]

  request_routing_rules = [
    {
      name                       = "rule1"
      rule_type                  = "Basic"
      http_listener_name         = "listener"
      backend_address_pool_name  = "backend-pool"
      backend_http_settings_name = "backend-settings"
    }
  ]

  tags = var.tags
}
