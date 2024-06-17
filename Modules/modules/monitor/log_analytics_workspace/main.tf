resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  location            = var.location_name
  resource_group_name = var.rg_name
  sku                 = var.sku_name
  retention_in_days   = 30
}