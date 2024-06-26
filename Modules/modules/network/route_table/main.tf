resource "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  location            = var.location_name
  resource_group_name = var.rg_name
  #disable_bgp_route_propagation = false

  /* route {
    name           = var.route_name
    address_prefix = var.rt_address_prefix
    next_hop_type  = var.next_hop_type_name
  } */

}

resource "azurerm_subnet_route_table_association" "RT_subnet" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.route_table.id
}