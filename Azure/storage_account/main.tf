resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  location                    = var.location_name
  resource_group_name         = var.rg_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.account_replication_type_name
  enable_https_traffic_only = var.HTTPS_traffic_enable 

  /* network_rules {
    default_action = "Deny"

    virtual_network_subnet_ids = [
      var.allowed_vnet_subnetid
    ]
  } */
}