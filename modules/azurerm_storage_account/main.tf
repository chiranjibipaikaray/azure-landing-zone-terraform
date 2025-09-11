resource "azurerm_storage_account" "storage" {
    for_each = var.var_storage
  name                     = each.value.storage_name
  resource_group_name      = each.value.resource_group_name 
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = each.value.account_replication_type

  tags = {
  environment = "generic"
  project     = "landing-zone"
}

}