locals {
  default_failover_locations = {
    default = {
      location       = "eastus"
      zone_redundant = var.zone_redundancy_enabled
    }
  }
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = var.cosmosdb_name
  location            = var.location_name
  resource_group_name = var.rg_name
  //default_identity_type = join("=", ["UserAssignedIdentity", azurerm_user_assigned_identity.example.id])
  offer_type                 = var.offer_type
  kind                       = var.kind
  mongo_server_version       = var.kind == "MongoDB" ? var.mongo_server_version : null
  enable_free_tier           = var.free_tier_enabled
  analytical_storage_enabled = var.analytical_storage_enabled

  public_network_access_enabled = var.public_network_accessibility

  dynamic "analytical_storage" {
    for_each = var.analytical_storage_enabled != null ? ["enabled"] : []
    content {
      schema_type = var.schema_analytical_storage_type
    }
  }

  enable_automatic_failover = true

  dynamic "capabilities" {
    for_each = toset(var.capabilities)
    content {
      name = capabilities.key
    }
  }


  consistency_policy {
    consistency_level       = var.consistency_policy_level
    max_interval_in_seconds = var.consistency_policy_max_interval_in_seconds
    max_staleness_prefix    = var.consistency_policy_max_staleness_prefix
  }

  dynamic "geo_location" {
    for_each = var.failover_locations != null ? var.failover_locations : local.default_failover_locations
    content {
      location          = geo_location.value.location
      failover_priority = lookup(geo_location.value, "priority", 0)
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}