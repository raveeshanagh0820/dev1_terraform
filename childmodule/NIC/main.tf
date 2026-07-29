resource "azurerm_network_interface" "nic" {
    for_each = var.nics_prod
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ipconfig_name
    subnet_id                     = data.azurerm_subnet.data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "data" {
  for_each =   var.datasubs_prod
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}