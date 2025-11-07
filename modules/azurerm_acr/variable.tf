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
