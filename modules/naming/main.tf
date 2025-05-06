# Root module (e.g. in main.tf)
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "1.0.0"

  project     = var.project        # e.g. "chatapp"
  environment = var.environment    # e.g. "sandbox","test","prod"
  application = var.application    # e.g. "ai-chat"
  location    = var.location
  delimiter   = "-" 

  tags = var.tags
}
