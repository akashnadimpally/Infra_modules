resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  name                  = var.private_dns_zone_virtual_network_link_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = var.vnet_id
}