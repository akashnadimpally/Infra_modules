resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bastion_host_name
  location            = var.location_name
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = var.bastion_config_name
    subnet_id            = var.s_net_id
    public_ip_address_id = var.pip_id
  }
}