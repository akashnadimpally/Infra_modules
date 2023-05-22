module "resource_group_azure" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/resource_group"
    rg_name = var.resource_group_name
    location_name = var.azure_location
}

module "resource_group_vnet_azure" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/resource_group"
    rg_name = "${module.resource_group_azure.resource_group_name}-vnet-rg"
    location_name = var.azure_location
}

module "virtualnet_azure" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/virtual_network"
  rg_name              = "${module.resource_group_vnet_azure.resource_group_name}"
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  existing_vnet_name   = ""  # Provide the existing virtual network name if it exists, or leave it empty
  vnet_address_prefix_ip = "192.168.0.0/16"
}

module "iaas_subnet" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = var.subnet_name
    address_prefixes_ip = "192.168.1.0/27"
}

module "iaas_subnet2" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = "subnet2"
    address_prefixes_ip = "192.168.2.0/27"
}

/* module "pip" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/pip"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    pip_name = var.public_ip_name
    allocation_method_name = var.allocate_method_name
    sku_name = var.sku_name_azure
} */

/* module "nat_gateway_subnet" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = "natgateway_subnet"
    address_prefixes_ip = "192.168.3.0/27"
} */

#module "nat_gateway" {
#    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/nat_gateway"
#    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
#    location_name = var.azure_location
#    nat_name = var.nat_name_azure
#    nat_sku_name = var.nat_sku_name_azure
    /* nat_zones = var.nat_zones_value */
    #pip_ip_address_id = "${module.pip.public_ip_id}"
    #nat_gateway_subnet_id = "${module.nat_gateway_subnet.subnet_id}"
#}

 /* module "network_sg" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/nsg"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    nsg_name = "${module.resource_group_azure.resource_group_name}-nsg"
} */

/* module "route_table" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/route_table"
    route_table_name = "${module.resource_group_azure.resource_group_name}-rt"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
} */

#module "routes" {
#    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/routes"
#    route_table_name = "${module.resource_group_azure.resource_group_name}-rt"
#    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
#    location_name = var.azure_location
#    route_name = "${module.resource_group_azure.resource_group_name}-route"
#    rt_address_prefix = var.rt_addr_prfx
#    next_hop_type_name = var.nxt_hop_type
#    /* nxt_hop_ip_addr = var.next_ip_address_hop */
#}


/* module "ple_subnet" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = "ple_subnet"
    address_prefixes_ip = "192.168.4.0/27"
} */


module "user_assigned_managed_identity" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/managed_identity"
    rg_name = "${module.resource_group_azure.resource_group_name}"
    location_name = var.azure_location
    user_mi_name = var.umi_name
}



