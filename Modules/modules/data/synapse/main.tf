data "azurerm_client_config" "current" {}

resource "azurerm_synapse_workspace" "synapse_workspace" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = var.rg_name
  location                             = var.location_name
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  #   sql_administrator_login              = "sqladminuser"
  #   sql_administrator_login_password     = "H@Sh1CoR3!"

  aad_admin {
    login     = var.aad_admin
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }

}