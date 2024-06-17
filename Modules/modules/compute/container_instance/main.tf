resource "azurerm_container_group" "ACI" {
  name                = var.ACI_name
  location            = var.location_name
  resource_group_name = var.rg_name
  ip_address_type     = var.ACI_ip_address_type
  //subnet_ids          = var.ACI_ip_address_type == "Private" ? var.subnet_ids : null
  os_type = var.ACI_OS_type

  identity {
    type         = var.identity_type
    identity_ids = (var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null
  }

  container {
    name   = var.ACI_container_name
    image  = var.ACI_container_image_name
    cpu    = var.ACI_CPU
    memory = var.ACI_memory

    ports {
      port     = var.container_port_number
      protocol = var.container_port_protocol
    }
  }

  image_registry_credential {
    user_assigned_identity_id = var.image_uami_ids
    server                    = var.image_server
  }



}