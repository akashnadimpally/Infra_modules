resource "azurerm_network_interface_backend_address_pool_association" "associate" {
  network_interface_id    = var.nic_id
  ip_configuration_name   = var.ip_config_name_vm_nic
  backend_address_pool_id = var.backendpool_address_id
}