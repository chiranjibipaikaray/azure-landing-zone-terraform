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
