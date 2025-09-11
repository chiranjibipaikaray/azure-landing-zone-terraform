resource "azurerm_public_ip" "pip" {
    for_each = var.var_pip
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  tags = {
    environment = "generic"
    project     = "landing-zone"
  }
}