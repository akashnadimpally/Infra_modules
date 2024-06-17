resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.location_name
  resource_group_name = var.rg_name
  subnet_id           = var.private_subnet_id
  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = var.private_endpoint_connection_resource_id
    subresource_names              = var.private_endpoint_subresource_names
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_name
    private_dns_zone_ids = [var.private_dns_zone_ids]
  }
}