resource "azurerm_private_dns_a_record" "dns_a_record" {
  name                = var.dns_a_record_name
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.rg_name
  ttl                 = 300
  records             = [var.private_dns_ip]
}