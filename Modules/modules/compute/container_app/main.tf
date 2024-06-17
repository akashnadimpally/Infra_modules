resource "azurerm_container_app_environment" "container_app_environment" {
  name                       = "${var.container_app_name}env"
  location                   = var.location_name
  resource_group_name        = var.rg_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.container_app_environment.id
  resource_group_name          = var.rg_name
  revision_mode                = var.container_app_revision_mode

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type == "UserAssigned" ? var.uami_ids : null
  }

  # dynamic "template" {
  #   for_each = var.container_template
  #   content {
  #     container {
  #     name   = var.container_name
  #     image  = var.container_image
  #     cpu    = var.container_cpu
  #     memory = var.container_memory 
  #     }
  #   }

  # }

  registry {
    server   = var.registry_server_name
    identity = var.registry_uami_ids
  }

  template {
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.container_cpu
      memory = var.container_memory
    }
  }

  ingress {
    allow_insecure_connections = true
    target_port                = 8080
    traffic_weight {
      percentage = 100
    }
  }
}