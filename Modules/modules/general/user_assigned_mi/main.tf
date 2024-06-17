resource "azurerm_user_assigned_identity" "user_a_mi" {
  name                = var.user_mi_name
  location            = var.location_name
  resource_group_name = var.rg_name
}