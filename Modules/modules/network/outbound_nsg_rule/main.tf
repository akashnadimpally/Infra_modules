resource "azurerm_network_security_rule" "outbound_nsg_rule" {
  name                        = var.nsg_rule_name
  priority                    = var.outbound_priority_number
  direction                   = "Outbound"
  access                      = var.outbound_access_control
  protocol                    = var.outbound_protocol_name
  source_port_range           = var.outbound_src_port
  destination_port_range      = var.outbound_dest_port
  source_address_prefix       = var.outbound_src_address_prefix
  destination_address_prefix  = var.outbound_dest_address_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = var.nsg_name
}