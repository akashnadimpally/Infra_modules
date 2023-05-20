output "virtual_network" {
  value = length(azurerm_virtual_network.virtual_network) > 0 ? azurerm_virtual_network.virtual_network[0].name : ""
}

output "vnet_address_prefix" {
  value = local.vnet_address_prefix
}


