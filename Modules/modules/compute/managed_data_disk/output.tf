output "managed_data_disk_id" {
  # value = azurerm_managed_disk.data_disk.id
  value = [for disk in azurerm_managed_disk.data_disk : disk.id ]
}