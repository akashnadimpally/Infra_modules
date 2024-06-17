resource "azurerm_key_vault_secret" "kv_secret" {
  name         = var.key_vault_secret_name
  value        = var.secret_value
  key_vault_id = var.kv_id
}

resource "time_sleep" "wait_180_seconds" {
  create_duration = "180s"
  depends_on      = [azurerm_key_vault_secret.kv_secret]
}