
resource "azurerm_disk_encryption_set" "des" {
  name                = var.des_name
  resource_group_name = var.rg_name
  location            = var.location_name
  key_vault_key_id    = var.kv_key_id

  identity {
    type         = "UserAssigned"
    identity_ids = [var.user_assigned_mi_id]
  }
}