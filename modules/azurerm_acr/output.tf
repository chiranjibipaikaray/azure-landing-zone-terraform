output "acr_names" {
  description = "Names of the created ACRs"
  value       = { for k, v in azurerm_container_registry.acr : k => v.name }
}

output "acr_login_servers" {
  description = "Login servers (URLs) for the created ACRs"
  value       = { for k, v in azurerm_container_registry.acr : k => v.login_server }
}