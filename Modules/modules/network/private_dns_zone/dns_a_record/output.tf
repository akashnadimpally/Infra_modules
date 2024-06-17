output "private_dns_id" {
  value = azurerm_private_dns_a_record.dns_a_record.id
}

output "private_dns_fqdn" {
  value = azurerm_private_dns_a_record.dns_a_record.fqdn
}