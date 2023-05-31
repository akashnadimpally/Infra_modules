resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_acc_name
  container_access_type = "private"
}