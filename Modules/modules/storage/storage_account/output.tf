output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "storage_account_sami_id" {
  value = azurerm_storage_account.storage_account.identity
}

output "storage_account_primary_access" {
  value = azurerm_storage_account.storage_account.primary_access_key
}