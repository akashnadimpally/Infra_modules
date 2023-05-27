output "storage_account_id" {
    value = azurerm_storage_account.storage_account.id
}

output "storage_account_primary_key" {
    value = azurerm_storage_account.storage_account.primary_access_key
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}