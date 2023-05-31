resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  location                    = var.location_name
  resource_group_name         = var.rg_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.account_replication_type_name
  enable_https_traffic_only = var.HTTPS_traffic_enable
  allow_nested_items_to_be_public = false
  #allow_blob_public_access = false
  #public_network_access_enabled = false

  network_rules {
    bypass = [ "None" ]
    default_action = "Deny"
    #virtual_network_subnet_ids = [var.allowed_vnet_subnetid]
    /* ip_rules                   = [] */
  }

}