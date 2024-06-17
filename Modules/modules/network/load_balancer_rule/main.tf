resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = var.lb_id
  name                           = var.lb_rule_name
  protocol                       = var.protocol_name
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.lb_frontend_ip_config_name
  backend_address_pool_ids       = try([var.be_ppol_ids], "")
  probe_id                       = try(var.probeid, "")
}