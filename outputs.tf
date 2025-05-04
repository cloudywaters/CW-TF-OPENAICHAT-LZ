
output "static_web_url" {
  value = module.static_web_app.name
}
output "function_app_url" {
  value = module.function_app.name
}
output "sql_server_name" {
  value = module.sql.sql_server_name
}
output "openai_endpoint" {
  value = module.openai.name
}
output "apim_instance_name" {
  value = module.apim.name
}
output "application_gateway_name" {
  value = module.appgateway.name
}
