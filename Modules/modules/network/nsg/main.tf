resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location_name
  resource_group_name = var.rg_name
}