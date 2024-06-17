resource "azurerm_storage_container" "container" {
  count                 = var.count_container
  name                  = "${var.storage_account_container_name}${count.index + 1}"
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}