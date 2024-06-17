resource "azurerm_lb_probe" "example" {
  loadbalancer_id = var.lb_id
  name            = var.lb_probe_name
  port            = var.port_number
  protocol        = var.protocol_name
}