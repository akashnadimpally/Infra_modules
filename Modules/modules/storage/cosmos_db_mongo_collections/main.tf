resource "azurerm_cosmosdb_mongo_collection" "cosmosdb_mongo_collection" {
  name                = var.cosmosdb_mongo_collection_name
  resource_group_name = var.rg_name
  account_name        = var.cosmosdb_account_name
  database_name       = var.mongo_database_name

  default_ttl_seconds = "777"
  # shard_key           = "uniqueKey"
  throughput = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}