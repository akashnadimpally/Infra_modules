resource "azurerm_private_endpoint" "example" {
  name                = "example-private-endpoint"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  subnet_id           = azurerm_subnet.example.id
  private_service_connection {
    name                           = "example-private-service-connection"
    private_connection_resource_id = "<Azure resource ID of the resource you want to connect to>"
    subresource_names              = ["<subresource names, if any>"]
  }
}