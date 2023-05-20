resource "azurerm_public_ip" "pip_azure" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.location_name
  allocation_method   = var.allocation_method_name
  sku = var.sku_name
}

