output "id" {
  description = "The ID of the OpenAI service"
  value       = azurerm_cognitive_account.openai.id
}

output "endpoint" {
  description = "The endpoint of the OpenAI service"
  value       = azurerm_cognitive_account.openai.endpoint
}

output "primary_key" {
  description = "The primary access key for the OpenAI service"
  value       = azurerm_cognitive_account.openai.primary_access_key
  sensitive   = true
}

output "openai_api_spec_url" {
  description = "The URL of the OpenAI API specification"
  value       = "${azurerm_cognitive_account.openai.endpoint}/openai/swagger.json"
}
