resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location_name
  resource_group_name = var.rg_name
  sku                 = var.sku_name

  /* dynamic "frontend_ip_configuration" { */
  /* for_each = var.type == "Public" ? [1] : []
    content {
      name                 = var.frontend_ip_configuration_name
      public_ip_address_id = var.lb_pip
      subnet_id = var.subnet_id_internal */
  /* private_ip_address_allocation = var.private_ip_address_allocation_type
      private_ip_address = var.lb_private_ip_address */
  /* }
  } */

  /* frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name == "public" ? lower("lbext-frontend-${var.vmscaleset_name}") : lower("lbint-frontend-${var.vmscaleset_name}")
    public_ip_address_id          = var.enable_load_balancer == true && var.frontend_ip_configuration_name == "public" ? azurerm_public_ip.pip[count.index].id : null
    private_ip_address_allocation = var.frontend_ip_configuration_name == "private" ? var.private_ip_address_allocation_type : null
    private_ip_address            = var.frontend_ip_configuration_name == "private" && var.private_ip_address_allocation_type == "Static" ? var.lb_private_ip_address : null
    subnet_id                     = var.frontend_ip_configuration_name == "private" ? data.azurerm_subnet.snet.id : null
  } */

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = var.lb_pip_id
    subnet_id            = try(var.subnet_id_internal, "")

  }

}