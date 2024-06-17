data "azurerm_client_config" "current" {}

resource "azurerm_kubernetes_cluster" "aks" {
  name                             = var.aks_name
  location                         = var.location_name
  resource_group_name              = var.rg_name
  dns_prefix                       = var.aks_dns_prefix
  automatic_channel_upgrade        = var.aks_automatic_channel_upgrade
  http_application_routing_enabled = false
  # kubernetes_version = ""
  local_account_disabled = false
  # node_resource_group = var.rg_name
  sku_tier                  = var.aks_sku
  open_service_mesh_enabled = true
  # public_network_access_enabled = true

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_pool_count
    vm_size    = var.node_pool_vm_size
  }

  # azure_active_directory_role_based_access_control {
  #   managed = true
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  # }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }

}
