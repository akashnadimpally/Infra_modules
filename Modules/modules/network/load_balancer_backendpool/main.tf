resource "azurerm_lb_backend_address_pool" "backendpool_addr_pool" {
  loadbalancer_id = var.lb_id
  name            = var.lb_backendpool_address_name
  /* virtual_network_id  = var.vnet_id */
}