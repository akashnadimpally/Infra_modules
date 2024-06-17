data "azurerm_client_config" "current" {}

resource "azurerm_mssql_server" "ms_sql_server" {
  name                              = var.ms_sql_server_name
  resource_group_name               = var.rg_name
  location                          = var.location_name
  version                           = "12.0"
  primary_user_assigned_identity_id = var.identity_type == "UserAssigned" ? var.uami_ids : null
  administrator_login               = var.azure_AD_auth_only == false ? var.admin_username : null
  administrator_login_password      = var.azure_AD_auth_only == false ? var.admin_password : null

  azuread_administrator {
    login_username              = var.sql_admin_username
    object_id                   = data.azurerm_client_config.current.object_id
    azuread_authentication_only = var.azure_AD_auth_only
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}