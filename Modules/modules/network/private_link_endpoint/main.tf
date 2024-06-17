resource "azurerm_private_endpoint" "ple" {
  name                = var.private_link_endpoint_name
  resource_group_name = var.rg_name
  location            = var.location_name
  subnet_id           = var.ple_subnet_id
  private_service_connection {
    name                           = var.private_connection_name
    is_manual_connection           = false
    private_connection_resource_id = var.private_connection_res_id
    subresource_names              = [var.resource_type_name]
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [var.private_dns_zone_zone_id]
  }
}

