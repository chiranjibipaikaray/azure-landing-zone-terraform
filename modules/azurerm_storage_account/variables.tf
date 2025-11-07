variable "storage_accounts" {
  description = "Map of storage account configurations"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    access_tier              = optional(string)
    allow_blob_public_access = optional(bool)
    tags                     = map(string)
  }))
}
