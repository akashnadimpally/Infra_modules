output "mongodb_database_id" {
  value = azurerm_cosmosdb_mongo_database.mongo_database.id
}

output "mongodb_database_name" {
  value = azurerm_cosmosdb_mongo_database.mongo_database.name
}