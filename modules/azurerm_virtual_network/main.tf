resource "azurerm_virtual_network" "vnet" {
  for_each            = var.var_vnet
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  tags = {
    environment = "generic"
    project     = "landing-zone"
  }
}
