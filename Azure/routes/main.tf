resource "azurerm_route" "rt_route" {
  name                   = var.route_name
  resource_group_name    = var.rg_name
  route_table_name       = var.route_table_name
  address_prefix         = var.rt_address_prefix
  next_hop_type          = var.next_hop_type_name
  /* next_hop_in_ip_address = var.nxt_hop_ip_addr */
}