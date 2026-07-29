module "resource_group_name" {
  source = "../childmodule/RG"
  rgs_prod = var.rgs_prod
}

module "public_ip" {
  depends_on = [module.resource_group_name]
  source = "../childmodule/PIP"
  pips_prod   = var.pips_prod
}

module "virtual_network" {
  depends_on = [module.resource_group_name]
  source = "../childmodule/VNET"
  vnets_prod  = var.vnets_prod
}
module "subnet" {
  depends_on  = [module.virtual_network]
 source = "../childmodule/SUBNET"
  subnets_prod = var.subnets_prod
}
module "NIC" {
  depends_on   = [module.resource_group_name,module.subnet]
  source = "../childmodule/NIC"
  nics_prod     = var.nics_prod
  datasubs_prod = var.datasubs_prod
}

module "VM_prod" {
  depends_on = [module.NIC]
 source = "../childmodule/VM"
  vms_prod    = var.vms_prod
  nics_data   = var.nics_data
}

module "appgateways" {
  depends_on = [ module.subnet,module.public_ip ]
  source = "../childmodule/AppGW"
  appgateways= var.appgateways
  datas_appsub2 = var.datas_appsub2
  datas_apppip = var.datas_apppip
}





# module "bastion" {
#   depends_on = [ module.subnet,module.public_ip ]
#   source        = "../Childmodule/Bastion"
#   bastion_prod  = var.bastion_prod
#   datasub1_prod = var.datasub1_prod
#   data_pip_prod = var.data_pip_prod
# }

# module "Nat" {
#   depends_on = [module.resource_group_name,module.public_ip,module.subnet]
#   source     = "../Childmodule/NAT"
#   NAT_prod   = var.NAT_prod
# }

# module "NSG" {
#   depends_on = [module.resource_group_name, module.subnet]
#   source     = "../Childmodule/NSG"
#   NSG_prod   = var.NSG_prod
# }
