resource "azurerm_storage_share" "file_share" {
  name                 = var.storage_acc_file_share_name
  storage_account_name = var.storage_acc_name
  access_tier          = var.file_share_access_tier
  quota                = 150
  enabled_protocol     = "SMB"
}