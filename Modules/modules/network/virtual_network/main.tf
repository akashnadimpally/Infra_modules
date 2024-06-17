#data "azurerm_virtual_network" "existing_virtual_networks" {
#  count               = var.existing_vnet_name != "" ? 1 : 0
#  name                = var.existing_vnet_name
#  resource_group_name = var.rg_name
#}

#locals {
#  existing_vnet_exists      = length(data.azurerm_virtual_network.existing_virtual_networks) > 0
#  existing_address_spaces   = [for vnet in data.azurerm_virtual_network.existing_virtual_networks : vnet.address_space]
#  incremented_address       = cidrsubnet("10.0.0.0/16", 8, length(local.existing_address_spaces) + 1)
#  vnet_address_prefix       = length(data.azurerm_virtual_network.existing_virtual_networks) > 0 ? data.azurerm_virtual_network.existing_virtual_networks[0].address_space[0] : cidrsubnet("10.0.0.0/16", 8, length(var.existing_vnet_name))
#}

#resource "azurerm_virtual_network" "virtual_network" {
#  name                = var.vnet_name
#  location            = var.location_name
#  resource_group_name = var.rg_name
#  #address_space       = [local.vnet_address_prefix]
#  address_space       = [var.vnet_address_prefix_ip]
#  count               = var.create_vnet && (!local.existing_vnet_exists || var.existing_vnet_name == "") ? 1 : 0
#}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  location            = var.location_name
  resource_group_name = var.rg_name
  address_space       = [var.vnet_address_prefix_ip]
}

