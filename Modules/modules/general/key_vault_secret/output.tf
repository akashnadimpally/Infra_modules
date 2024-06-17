output "kv_secret_id" {
  value = azurerm_key_vault_secret.kv_secret.id
}

output "kv_secret_name" {
  value = azurerm_key_vault_secret.kv_secret.name
}

output "kv_secret_value" {
  value     = azurerm_key_vault_secret.kv_secret.value
  sensitive = true
}