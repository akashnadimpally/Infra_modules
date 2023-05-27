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

module "user_assigned_managed_identity" {
  source        = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/managed_identity"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  user_mi_name  = var.umi_name
}

module "azure_private_dns_zone" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/private_dns_zone"
  private_dns_zone_name = var.azure_private_dns_zone_name
  rg_name       = module.resource_group_azure.resource_group_name
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

module "nat_gateway_subnet" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = "natgateway_subnet"
    address_prefixes_ip = "192.168.3.0/27"
}

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

module "route_table" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/route_table"
    route_table_name = "${module.resource_group_azure.resource_group_name}-rt"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
}

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

module "ple_subnet_nsg" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/nsg"
  nsg_name = "ple_subnet_nsg"
  rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
  location_name = var.azure_location
}

module "ple_subnet_inbound_nsg_rule" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/inbound_nsg_rule"
  nsg_rule_name = "${module.ple_subnet_nsg.nsg_name_output}-inbound-deny"
  inbound_priority_number = 101
  inbound_access_control = "Deny"
  inbound_protocol_name = "Tcp"
  inbound_src_port = "*"
  inbound_dest_port = "*"
  inbound_src_address_prefix = "*"
  inbound_dest_address_prefix = "*"
  rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
  nsg_name = "${module.ple_subnet_nsg.nsg_name_output}"
}

module "ple_subnet" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
    rg_name = "${module.resource_group_vnet_azure.resource_group_name}"
    location_name = var.azure_location
    vnet_name = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
    vnet_address_prefix = module.virtualnet_azure.vnet_address_prefix
    existing_subnet_name = ""
    s_name = "ple_subnet"
    address_prefixes_ip = "192.168.4.0/27"
}

module "ple_subnet_nsg_association" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/nsg_subnet_association"
  nsg_subnet_id = module.ple_subnet.subnet_id
  nsg_id = module.ple_subnet_nsg.nsg_id
}

module "kv_subnet" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
  rg_name              = module.resource_group_vnet_azure.resource_group_name
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  vnet_address_prefix  = module.virtualnet_azure.vnet_address_prefix
  existing_subnet_name = ""
  s_name               = "keyvaultsubnet"
  address_prefixes_ip  = "192.168.5.0/27"
}

module "key_vault_creation" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/key_vault"
    kv_name = var.key_vault_name
    rg_name       = module.resource_group_azure.resource_group_name
    location_name = var.azure_location
    disk_encryption = var.disk_encrypt_bool
    purge_protection = var.purge_protection_enable
    sku_kv_name = var.sku_name
}

module "key_vault_ple" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/private_link_endpoint"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  private_link_endpoint_name = "${module.key_vault_creation.key_vault_name_output}-ple-kv"
  ple_subnet_id = module.kv_subnet.subnet_id
  private_connection_name = "${module.key_vault_creation.key_vault_name_output}-ple-connection"
  private_connection_res_id = module.key_vault_creation.key_vault_id
  resource_type_name = "vault"
}

/* module "key_vault_access_policies" {
    source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/key_vault_access_policy"
    kv_id = module.key_vault_creation.key_vault_id */
    /* access_policies = var.kv_access_policy */
    /* managed_identity_object_id = module.user_assigned_managed_identity.managed_identity_object_id */
    /* object_ids          = [module.user_assigned_managed_identity.managed_identity_object_id]
    key_permission     = ["Get", "List", "Create"]
    secret_permission  = ["Get", "List", "Set"]
    storage_permission = ["Get", "List"]
} */

module "storage_subnet" {
  source               = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/subnet"
  rg_name              = module.resource_group_vnet_azure.resource_group_name
  location_name        = var.azure_location
  vnet_name            = "${module.resource_group_vnet_azure.resource_group_name}-vnet"
  vnet_address_prefix  = module.virtualnet_azure.vnet_address_prefix
  existing_subnet_name = ""
  s_name               = "storagesubnet"
  address_prefixes_ip  = "192.168.6.0/27"
}

module "azure_storage_account" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/storage_account"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  storage_account_tier = "Standard"
  storage_account_name = "onbcrmitoolkavl2010"
  account_replication_type_name = "ZRS"
  HTTPS_traffic_enable = true
  allowed_vnet_subnetid = module.storage_subnet.subnet_id
}

module "storage_acc_container" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/storage_container"
  storage_container_name = "${module.azure_storage_account.storage_account_name}-horizoncontainer"
  storage_acc_name = module.azure_storage_account.storage_account_name
}

module "storage_ple" {
  source = "/Users/u1418758/Desktop/Repos/Infra_modules/Azure/private_link_endpoint"
  rg_name       = module.resource_group_azure.resource_group_name
  location_name = var.azure_location
  private_link_endpoint_name = "${module.azure_storage_account.storage_account_name}-ple-sa"
  ple_subnet_id = module.storage_subnet.subnet_id
  private_connection_name = "${module.azure_storage_account.storage_account_name}-ple-connection"
  private_connection_res_id = module.azure_storage_account.storage_account_id
  resource_type_name = "blob"
}
