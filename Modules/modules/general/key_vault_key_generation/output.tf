output "kv_key_name" {
  value = azurerm_key_vault_key.generated.name
}

output "kv_key_id" {
  value = azurerm_key_vault_key.generated.id
}