data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                          = var.kv_name
  location                      = var.location_name
  resource_group_name           = var.rg_name
  enabled_for_disk_encryption   = true
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 7
  purge_protection_enabled      = true
  public_network_access_enabled = true

  sku_name = "standard"

  network_acls {
    default_action = var.network_action
    bypass         = "AzureServices"
  }

}