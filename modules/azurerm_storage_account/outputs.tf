output "storage_account_names" {
  description = "List of storage account names created"
  value       = { for k, v in azurerm_storage_account.this : k => v.name }
}

output "primary_endpoints" {
  description = "Primary endpoints for the created storage accounts"
  value       = { for k, v in azurerm_storage_account.this : k => v.primary_blob_endpoint }
}
