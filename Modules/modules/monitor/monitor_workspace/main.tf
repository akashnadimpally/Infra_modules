resource "azurerm_monitor_workspace" "workspace" {
  name                          = var.monitor_ws_name
  resource_group_name           = var.rg_name
  location                      = var.location_name
  public_network_access_enabled = var.public_access
}