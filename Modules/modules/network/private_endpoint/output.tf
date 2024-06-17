output "private_dns_zone_configs" {
  value = azurerm_private_endpoint.private_endpoint.private_dns_zone_configs[0].name
}