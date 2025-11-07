#resource groups
module "resource_groups" {
  source = "../../modules/azurerm_resource_group"

  resource_groups = var.resource_groups
}

#virtual networks
module "virtual_networks" {
  source = "../../modules/azurerm_virtual_network"

  vnets = var.vnets

  depends_on = [module.resource_groups]
}

#storage accounts
module "storage_accounts" {
  source = "../../modules/azurerm_storage_account"

  storage_accounts = var.storage_accounts

  depends_on = [module.resource_groups]
} 

#Azure Container Registry (ACR)
module "acr" {
  source = "../../modules/azurerm_acr"

  acr_configs = var.acr_configs

  depends_on = [module.resource_groups]
}

#Azure Kubernetes Service (AK