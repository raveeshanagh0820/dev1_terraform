rgs_prod = {
  rg_prod1 = {
    name     = "rg1_prod1"
    location = "Japan East"
  }
}

pips_prod = {
  pip1_prod1 = {
    name                = "AppGW_pip1"
    resource_group_name = "rg1_prod1"
    location            = "Japan East"
    allocation_method   = "Static"
  }
 }

vnets_prod = {

  vnet_prod1 = {
    name                = "vnet1_prod1"
    location            = "Japan East"
    resource_group_name = "rg1_prod1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets_prod = {
  subnet_prod1 = {
    name                 = "subnet1_prod1"
    resource_group_name  = "rg1_prod1"
    virtual_network_name = "vnet1_prod1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet_prod2 = {
    name                 = "subnet2_prod1"
    resource_group_name  = "rg1_prod1"
    virtual_network_name = "vnet1_prod1"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet_prod3 = {
    name                 = "appsubnt1_prod1"
    resource_group_name  = "rg1_prod1"
    virtual_network_name = "vnet1_prod1"
    address_prefixes     = ["10.0.3.0/24"]
  }

  }


nics_prod = {
  nic1_prod1 = {
    name                = "nic1_prod1"
    location            = "Japan East"
    resource_group_name = "rg1_prod1"
    ipconfig_name       = "nic1_ipcofig1"
    subnet_key          = "datasub_prod1"
  }
  
}
datasubs_prod = {
  datasub_prod1 = {
    name                 = "subnet1_prod1"
    virtual_network_name = "vnet1_prod1"
    resource_group_name  = "rg1_prod1"
  }
  datasub_prod2 = {
    name                 = "subnet2_prod1"
    virtual_network_name = "vnet1_prod1"
    resource_group_name  = "rg1_prod1"
  }
}


vms_prod = {
  vm1 = {
    name                = "vm1-prod1"
    resource_group_name = "rg1_prod1"
    location            = "Japan East"
    size                = "Standard_D2s_v3"
    admin_username      = "adminuser"
    admin_password      = "P@$$w0rd1234!"
  }
  vm2 = {
    name                = "vm2-prod1"
    resource_group_name = "rg1_prod1"
    location            = "Japan East"
    size                = "Standard_D2s_v3"
    admin_username      = "adminuser"
    admin_password      = "P@$$w0rd1234!"
  
  }
   vm3 = {
    name                = "vm3-prod1"
    resource_group_name = "rg1_prod1"
    location            = "Japan East"
    size                = "Standard_D2s_v3"
    admin_username      = "adminuser"
    admin_password      = "P@$$w0rd1234!"
  
  }
}

nics_data = {
  nic_data1 = {
    name                = "nic1_prod1"
    resource_group_name = "rg1_prod1"
  }
}

appgateways = {
  appgw = {
    name                       = "appgateway"
    resource_group_name        = "rg1_prod1"
    location                   = "Japan East"
    gatewayname                = "gateway-ip-confi"
    front_port_name            = "frontend_port"
    frontend_ip_name           = "frontend_ip_config"
    backend__address_pool_name = "backend_appgw"
    backend_http_settings_name = "back_app_set"
    http_listener_name         = "listener"
    request_routing_rule_name  = "appgw_routing_rule"
    subnet_key="appsubnt1_prod1"
    pip_key= "data_appip"
  }
}

datas_appsub2 = {
  data_appsub = {
    name                 = "appsubnt1_prod1"
    virtual_network_name = "vnet1_prod1"
    resource_group_name  = "rg1_prod1"
  }
}

datas_apppip = {
  data_appip = {
    name                = "AppGW_pip1"
    resource_group_name = "rg1_prod1"
  }
}
