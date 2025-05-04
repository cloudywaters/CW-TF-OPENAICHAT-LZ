
output "openai_api_spec_url" {
  description = "URL to the OpenAPI spec for the OpenAI API (custom hosted or static location)"
  value       = "https://${azurerm_cognitive_account.openai.name}.openai.azure.com/openai/swagger.json"
}
