resource "azurerm_mssql_database" "ms_sql_database" {
  name                 = var.ms_sql_database_name
  server_id            = var.ms_sql_server_id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = var.sql_db_max_size_gb
  read_scale           = false
  sku_name             = var.sql_sku_name
  storage_account_type = var.storage_acc_type
  zone_redundant       = false
  min_capacity         = 1
  read_replica_count   = 1
}