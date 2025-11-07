# ------------------------------------------------
# Azure Container Registry (ACR)
# ------------------------------------------------
resource "azurerm_container_registry" "acr" {
  for_each = var.acr_configs

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = try(each.value.admin_enabled, false)

  tags = each.value.tags
}
