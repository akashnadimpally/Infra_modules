
resource "azurerm_service_plan" "service_plan" {
  name                = var.service_plan_name
  location            = var.location_name
  resource_group_name = var.rg_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}