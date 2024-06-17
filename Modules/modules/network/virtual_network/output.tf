#output "virtual_network_name" {
#  value = length(azurerm_virtual_network.virtual_network) > 0 ? azurerm_virtual_network.virtual_network[0].name : ""
#} 

output "virtual_network_name" {
  value = azurerm_virtual_network.virtual_network.name
}

/* output "vnet_address_prefix" {
  value = local.vnet_address_prefix
} */

output "vnet_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "vnet_address_prefix" {
  value = var.vnet_address_prefix_ip
}