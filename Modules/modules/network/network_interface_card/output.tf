output "nic_name" {
  # value = azurerm_network_interface.nic[*].name
  value = [for nic in azurerm_network_interface.nic : nic.name]
}

output "nic_id" {
  # value = azurerm_network_interface.nic[*].id
  value = [for nic in azurerm_network_interface.nic : nic.id]
}

output "ipconfig_name" {
  # value = azurerm_network_interface.nic[*].ip_configuration
  value = [for nic in azurerm_network_interface.nic : nic.ip_configuration]
}