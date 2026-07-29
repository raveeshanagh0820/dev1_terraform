resource "azurerm_windows_virtual_machine" "vm" {
    for_each = var.vms_prod
    name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.nic_data[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

data "azurerm_network_interface" "nic_data" {
  for_each = var.nics_data
  name = each.value.name
  resource_group_name = each.value.resource_group_name
}