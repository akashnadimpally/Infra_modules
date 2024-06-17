resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake_gen2_filesystem" {
  name               = var.data_lake_gen2_filesystem_name
  storage_account_id = var.storage_acc_id

}