resource "azurerm_application_gateway" "appgateway" {
    for_each = var.appgateways
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = each.value.gatewayname
    subnet_id = data.azurerm_subnet.data_appsub2[each.value.subnet_key].id
  }

  frontend_port {
    name = each.value.front_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name 
    public_ip_address_id = data.azurerm_public_ip.data_apppip[each.value.pip_key].id
  }

  backend_address_pool {
    name = each.value.backend_address_pool_name
  }

  backend_http_settings {
    name                  = each.value.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = each.value.http_listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_name
    frontend_port_name             = each.value.front_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = each.value.http_listener_name
    backend_address_pool_name  = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
  }
}

data "azurerm_subnet" "data_appsub2" {
  for_each =   var.datas_appsub2
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "data_apppip" {
    for_each = var.datas_apppip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}