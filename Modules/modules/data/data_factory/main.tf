resource "azurerm_data_factory" "data_factory" {
  name                = var.adf_name
  location            = var.location_name
  resource_group_name = var.rg_name

  public_network_enabled = false

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}