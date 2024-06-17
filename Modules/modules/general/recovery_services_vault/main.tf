resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault_name
  location            = var.location_name
  resource_group_name = var.rg_name
  sku                 = "Standard"

  public_network_access_enabled = false

  storage_mode_type = "LocallyRedundant"

  identity {
    type         = "UserAssigned"
    identity_ids = var.user_managed_identity_ids
  }

  soft_delete_enabled = false
}