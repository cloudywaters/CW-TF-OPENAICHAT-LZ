
output "static_web_app_name" {
  value = "${var.prefix}-swa-${var.suffix}"
}
output "function_app_name" {
  value = "${var.prefix}-func-${var.suffix}"
}
output "sql_server_name" {
  value = "${var.prefix}-sqlsvr-${var.suffix}"
}
output "sql_db_name" {
  value = "${var.prefix}-sqldb-${var.suffix}"
}
output "openai_name" {
  value = "${var.prefix}-openai-${var.suffix}"
}
output "apim_name" {
  value = "${var.prefix}-apim-${var.suffix}"
}
output "vnet_name" {
  value = "${var.prefix}-vnet-${var.suffix}"
}
output "core_rg_name" {
  value = "${var.prefix}-core-rg-${var.suffix}"
}
output "network_rg_name" {
  value = "${var.prefix}-network-rg-${var.suffix}"
}