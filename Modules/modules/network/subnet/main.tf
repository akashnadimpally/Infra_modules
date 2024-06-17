# data "azurerm_subnet" "existing_subnet" {
#  count                = var.existing_subnet_name != "" ? 1 : 0
#  name                 = var.existing_subnet_name
#  virtual_network_name = var.vnet_name
#  resource_group_name  = var.rg_name
#} 

resource "azurerm_subnet" "new_subnet" {
  #count                = var.create_subnet && length(data.azurerm_subnet.existing_subnet) == 0 ? 1 : 0
  #name                 = var.create_subnet ? "subnet1" : ""
  name                 = var.s_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  # address_prefixes     = var.create_subnet ? ["10.0.0.0/24"] : []
  address_prefixes = [var.address_prefixes_ip]
  # service_endpoints = var.service_endpoints
  # delegation {
  #   name = var.delegation

  #   service_delegation {
  #     name    = var.service_delegation_name
  #     actions = var.service_delegation_actions
  #   }
  # }
}