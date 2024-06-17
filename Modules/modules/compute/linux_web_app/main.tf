locals {
  application_stack_struct = {
    dotnet_version    = null
    docker_image_name = null
    # docker_image_tag = null
    # use_dotnet_isolated_runtime = null
    java_version   = null
    node_version   = null
    python_version = null
    # powershell_core_version     = null
    # use_custom_runtime          = null
  }
  application_stack = merge(local.application_stack_struct, var.application_stack)
}

resource "azurerm_linux_web_app" "linux_web_app" {
  name                          = var.linux_web_app_name
  resource_group_name           = var.rg_name
  location                      = var.location_name
  service_plan_id               = var.app_service_plan_id
  public_network_access_enabled = var.public_network_access
  virtual_network_subnet_id     = var.vnet_subnet_id
  https_only                    = var.https_only
  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }

  # active_directory {
  #   client_id = ""
  # }

  site_config {
    # ip_restriction {
    #   action = ""
    #   ip_address = ""
    # }
    application_stack {
      dotnet_version = local.application_stack.dotnet_version
      # use_dotnet_isolated_runtime = local.application_stack.use_dotnet_isolated_runtime
      docker_image_name = local.application_stack.docker_image_name
      # docker_registry_url = local.application_stack.
      java_version   = local.application_stack.java_version
      node_version   = local.application_stack.node_version
      python_version = local.application_stack.python_version
      # powershell_core_version     = local.application_stack.powershell_core_version
      # use_custom_runtime          = local.application_stack.use_custom_runtime
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}