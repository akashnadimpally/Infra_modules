resource "azurerm_virtual_network_peering" "peer" {
  name                         = var.vnet_peering_name
  resource_group_name          = var.rg_name
  virtual_network_name         = var.vnet_name
  remote_virtual_network_id    = var.vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}