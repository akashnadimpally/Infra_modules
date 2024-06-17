resource "azurerm_key_vault_key" "generated" {
  name         = var.kv_key_name
  key_vault_id = var.kv_id
  key_type     = var.key_type
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}