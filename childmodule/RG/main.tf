resource "azurerm_resource_group" "rgs1" {
  for_each = var.rgs_prod
  name = each.value.name
  location = each.value.location
}