resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_acc
  resource_group_name = var.rg_name

  location                        = var.location_name
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind
  access_tier                     = var.access_tier
  enable_https_traffic_only       = var.enable_https_traffic_only
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  public_network_access_enabled   = var.public_network_access_enabled
  is_hns_enabled                  = var.hns_enabled
  min_tls_version                 = "TLS1_2"

  network_rules {
    default_action = var.network_action
    bypass         = ["AzureServices"]
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.subnet_id
  }

  # customer_managed_key {
  #   key_vault_key_id = var.kv_key_id
  #   user_assigned_identity_id = var.uami_ids
  # }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}