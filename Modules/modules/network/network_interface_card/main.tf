resource "azurerm_network_interface" "nic" {
  count = var.nic_count
  name                = "${var.nic_name}${count.index}"
  location            = var.location_name
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = try(var.pip_id, "")
  }
}