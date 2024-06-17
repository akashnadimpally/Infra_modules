resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.location_name
  sku                           = var.sku_name
  admin_enabled                 = true
  public_network_access_enabled = true
  network_rule_bypass_option    = var.azure_services_bypass_allowed ? "AzureServices" : "None"

  data_endpoint_enabled = var.sku_name == "Premium" ? var.data_endpoint_enabled : null

  identity {
    type         = var.identity_type
    identity_ids = (var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null
  }

  /* encryption {
    enabled            = var.encryption_enabled
    key_vault_key_id   = var.encryption_enabled == true ? var.kv_key_id : null
    identity_client_id = var.encryption_enabled == true ? var.uami_ids[0] : null
  } */

  dynamic "georeplications" {
    for_each = var.georeplication_locations != null && var.sku_name == "Premium" ? var.georeplication_locations : []

    content {
      location                  = try(georeplications.value.location, georeplications.value)
      zone_redundancy_enabled   = try(georeplications.value.zone_redundancy_enabled, null)
      regional_endpoint_enabled = try(georeplications.value.regional_endpoint_enabled, null)
      tags                      = try(georeplications.value.tags, null)
    }
  }

  dynamic "network_rule_set" {
    for_each = length(concat(var.allowed_cidrs, var.allowed_subnets)) > 0 ? ["enabled"] : []

    content {
      default_action = "Deny"

      dynamic "ip_rule" {
        for_each = var.allowed_cidrs
        content {
          action   = "Allow"
          ip_range = ip_rule.value
        }
      }

      dynamic "virtual_network" {
        for_each = var.allowed_subnets
        content {
          action    = "Allow"
          subnet_id = virtual_network.value
        }
      }
    }
  }


}