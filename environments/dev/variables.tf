
#resource groups
variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

#virtual networks
variable "vnets" {
  description = "Map of Virtual Networks and their subnets"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    subnets = map(object({
      name           = string
      address_prefix = list(string)
    }))
    tags = map(string)
  }))
}

#storage accounts
variable "storage_accounts" {
  description = "Map of Storage Accounts to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    access_tier              = optional(string)
    tags                     = map(string)
  }))
}

#azure container registry
variable "acr_configs" {
  description = "Map of ACR configurations"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string          # Basic | Standard | Premium
    admin_enabled       = optional(bool)
    tags                = map(string)
  }))
}

