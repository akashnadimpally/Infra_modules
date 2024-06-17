resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  managed_disk_id    = var.managed_data_disk_id
  virtual_machine_id = var.vm_id
  lun                = "10"
  caching            = "ReadWrite"
}