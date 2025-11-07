variable "aks_clusters" {
  description = "Map of AKS clusters"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version  = optional(string)

    node_pool = object({
      name            = string
      node_count      = number
      vm_size         = string
      os_disk_size_gb = optional(number)
      subnet_id       = optional(string)
    })

    acr_id = optional(string)

    tags = map(string)
  }))
}
