resource "azurerm_resource_group" "rg" {
  for_each = var.rg_var
  name     = each.value.rg_name
  location = each.value.location

  tags = {
    environment = "generic"
    project     = "landing-zone"
  }
}
