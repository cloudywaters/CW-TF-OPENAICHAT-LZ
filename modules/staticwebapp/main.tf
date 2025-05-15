# Azure Static Web App Module

resource "azurerm_static_site" "swa" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  
  # Standard SKU is required for private endpoints
  sku_tier            = "Standard"
  sku_size            = "Standard"
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = var.tags
}

# Static Web App Source Control Configuration
# Note: In production, we recommend using GitHub Actions for deployment
resource "azurerm_static_site_custom_domain" "custom_domain" {
  count               = var.custom_domain != "" ? 1 : 0
  static_site_id      = azurerm_static_site.swa.id
  domain_name         = var.custom_domain
  validation_type     = "cname-delegation"
}

# Apply app settings using the Az CLI (as Terraform doesn't directly support this)
resource "null_resource" "apply_app_settings" {
  count = length(var.app_settings) > 0 ? 1 : 0

  triggers = {
    app_settings = jsonencode(var.app_settings)
  }

  provisioner "local-exec" {
    command = <<EOT
      az staticwebapp appsettings set --name ${azurerm_static_site.swa.name} --resource-group ${var.resource_group_name} --setting-names ${join(" ", [for k, v in var.app_settings : "${k}=${v}"])}
    EOT
  }

  depends_on = [
    azurerm_static_site.swa
  ]
}

