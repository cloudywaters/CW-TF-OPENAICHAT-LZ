module "appgw" {
  source  = "Azure/avm-res-network-applicationgateway/azurerm"
  version = "1.0.0"

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku = {
    tier     = "WAF_v2"
    name     = "WAF_v2"
    capacity = 2
  }

  frontend_ports = [
    { name = "http";  port = 80  },
    { name = "https"; port = 443 }
  ]

  frontend_ip_configurations = [
    { name = "appgw-feip"; public_ip_address_id = var.public_ip_id }
  ]

  gateway_ip_configurations = [
    { name = "appgw-ipcfg"; subnet_id = var.subnet_id }
  ]

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

  waf_policy = {
    enabled          = true
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.2"
  }

  tags = var.tags
}
