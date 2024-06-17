resource "azurerm_managed_disk" "data_disk" {
  count = var.data_disk_count
  name                   = "${var.data_disk_name}${count.index}"
  location               = var.location_name
  resource_group_name    = var.rg_name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  # disk_encryption_set_id = var.des_encryption_id
}