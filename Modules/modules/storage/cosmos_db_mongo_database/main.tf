resource "azurerm_cosmosdb_mongo_database" "mongo_database" {
  name                = var.mongo_database_name
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  throughput          = 400
}