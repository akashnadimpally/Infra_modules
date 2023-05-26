module "resource_group_azure" {
  source        = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/resource_group"
  rg_name       = var.resource_group_name
  location_name = var.azure_location
}

module "resource_group_vnet_azure" {
  source        = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/resource_group"
  rg_name       = "${module.resource_group_azure.resource_group_name}-vnet-rg"
  location_name = var.azure_location
}

module "virtualnet_azure" {
  source                 = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/virtual_network"
  rg_name                = module.resource_group_vnet_azure.resource_group_name
  location_name          = var.azure_location
  vnet_name              = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  existing_vnet_name     = "" # Provide the existing virtual network name if it exists, or leave it empty
  vnet_address_prefix_ip = "192.168.0.0/16"
}

module "iaas_subnet1" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
  rg_name              = module.resource_group_vnet_azure.resource_group_name
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  vnet_address_prefix  = module.virtualnet_azure.vnet_address_prefix
  existing_subnet_name = ""
  s_name               = var.subnet_name
  address_prefixes_ip  = "192.168.1.0/27"
}

module "iaas_subnet2" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
  rg_name              = module.resource_group_vnet_azure.resource_group_name
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  vnet_address_prefix  = module.virtualnet_azure.vnet_address_prefix
  existing_subnet_name = ""
  s_name               = "subnet2"
  address_prefixes_ip  = "192.168.2.0/27"
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
  source        = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/managed_identity"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  user_mi_name  = var.umi_name
}


/* module "key_vault_creation" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/key_vault"
    kv_name = var.key_vault_name
    rg_name       = module.resource_group_azure.resource_group_name
    location_name = var.azure_location
    disk_encryption = var.disk_encrypt_bool
    purge_protection = var.purge_protection_enable
    sku_kv_name = var.sku_name
} */

/* module "key_vault_access_policies" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/key_vault/key_vault_access_policy"
    kv_id = module.key_vault_creation.key_vault_id */
    /* access_policies = var.kv_access_policy */
    /* managed_identity_object_id = module.user_assigned_managed_identity.managed_identity_object_id */
    /* object_ids          = [module.user_assigned_managed_identity.managed_identity_object_id]
    key_permission     = ["Get", "List", "Create"]
    secret_permission  = ["Get", "List", "Set"]
    storage_permission = ["Get", "List"]
} */

/* module "azure_private_dns_zone" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/private_dns_zone"
  private_dns_zone_name = var.azure_private_dns_zone_name
  rg_name       = module.resource_group_azure.resource_group_name
} */

module "storage_subnet" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
  rg_name              = module.resource_group_vnet_azure.resource_group_name
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  vnet_address_prefix  = module.virtualnet_azure.vnet_address_prefix
  existing_subnet_name = ""
  s_name               = "storagesubnet"
  address_prefixes_ip  = "192.168.5.0/27"
}

module "azure_storage_account" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/storage_account"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  storage_account_tier = "Standard"
  storage_account_name = ""
  account_replication_type_name = "GRS"
  HTTPS_traffic_enable = true
  allowed_vnet_subnetid = module.storage_subnet.subnet_id
}


