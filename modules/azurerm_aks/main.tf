# ------------------------------------------------
# Azure Kubernetes Service (AKS)
# ------------------------------------------------
resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks_clusters

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = try(each.value.kubernetes_version, null)

  default_node_pool {
    name                = each.value.node_pool.name
    node_count          = each.value.node_pool.node_count
    vm_size             = each.value.node_pool.vm_size
    os_disk_size_gb     = try(each.value.node_pool.os_disk_size_gb, 128)
    vnet_subnet_id      = try(each.value.node_pool.subnet_id, null)
  }

  identity {
    type = "SystemAssigned"
  }

  # Optional attach to ACR
  depends_on = [azurerm_role_assignment.acr_pull_role]

  tags = each.value.tags
}

# ------------------------------------------------
# Optional Role Assignment for ACR Pull Access
# ------------------------------------------------
resource "azurerm_role_assignment" "acr_pull_role" {
  for_each = {
    for key, cluster in var.aks_clusters :
    key => cluster
    if try(cluster.acr_id, null) != null
  }

  scope                = each.value.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
}
