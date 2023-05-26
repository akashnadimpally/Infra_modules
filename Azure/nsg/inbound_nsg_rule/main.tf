resource "azurerm_network_security_rule" "outbound_nsg_rule" {
  name                        = var.nsg_rule_name
  priority                    = var.inbound_priority_number
  direction                   = "Inbound"
  access                      = var.inbound_access_control
  protocol                    = var.inbound_protocol_name
  source_port_range          = var.inbound_src_port
  destination_port_range     = var.inbound_dest_port
  source_address_prefix      = var.inbound_src_address_prefix
  destination_address_prefix = var.inbound_dest_address_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = var.nsg_name
}