resource "azurerm_network_interface" "nic" {
  for_each            = var.var_nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.var_vm
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids =[
    azurerm_network_interface.nic[each.key].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
    publisher = each.value.image_publisher # Published ID from Azure Marketplace
    offer     = each.value.image_offer     # Product ID from Azure Marketplace
    sku       = each.value.image_sku       # Plan ID from Azure Marketplace
    version   = each.value.image_version   # Version of the image
  }
}
