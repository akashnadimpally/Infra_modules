output "lb_id" {
  value = azurerm_lb.load_balancer.id
}

output "lb_name" {
  value = azurerm_lb.load_balancer.name
}

output "frontendip_config_name" {
  value = azurerm_lb.load_balancer.private_ip_address
}