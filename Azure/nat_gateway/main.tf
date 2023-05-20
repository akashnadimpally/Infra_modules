resource "azurerm_nat_gateway" "nat_gateway" {
  name                    = var.nat_name
  location                = var.location_name
  resource_group_name     = var.rg_name
  sku_name                = var.nat_sku_name
  idle_timeout_in_minutes = 10
  /* zones                   = [var.nat_zones] */
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_association" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = var.pip_ip_address_id

}

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_association" {
  subnet_id      = var.nat_gateway_subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}