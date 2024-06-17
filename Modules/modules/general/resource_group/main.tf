# data "azurerm_resources" "existing_resources" {
#  resource_group_name = var.rg_name
#  type                = "Microsoft.Resources/resourceGroups"
#}

resource "azurerm_resource_group" "resource_group" {
  name     = var.rg_name
  location = var.location_name

  #  count    = length(data.azurerm_resources.existing_resources.resources) == 0 ? 1 : 0

  # lifecycle {
  #   prevent_destroy = true
  # }

}
