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


