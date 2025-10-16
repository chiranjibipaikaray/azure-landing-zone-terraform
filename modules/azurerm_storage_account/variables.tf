variable "var_storage" {
  type = map(object(
    {
      name                     = string
      location                 = string
      account_tier             = string
      account_replication_type = string
      account_kind             = optional(string)
    }
  ))
}
