resource "azurerm_windows_virtual_machine_scale_set" "windows_vmss" {
  /* count  = var.os_flavor == "windows" ? 1 : 0 */
  name                     = var.windows_vmss_name
  resource_group_name      = var.rg_name
  location                 = var.location_name
  sku                      = var.sku_name
  instances                = var.instances_count
  admin_password           = var.admin_pass
  admin_username           = var.admin_user
  computer_name_prefix     = var.prefix_name
  upgrade_mode             = var.os_upgrade_mode
  enable_automatic_updates = var.os_upgrade_mode != "Automatic" ? var.enable_windows_vm_automatic_updates : false

  /* scale_in {
    rule = "Default"
    force_deletion_enabled = true
  } */

  /* dynamic "automatic_os_upgrade_policy" {
    for_each = var.os_upgrade_mode == "Automatic" ? [1] : []
    content {
      disable_automatic_rollback  = true
      enable_automatic_os_upgrade = true
    }
  } */

  /* dynamic "rolling_upgrade_policy" {
    for_each = var.os_upgrade_mode != "Manual" ? [1] : []
    content {
      max_batch_instance_percent              = var.rolling_upgrade_policy.max_batch_instance_percent
      max_unhealthy_instance_percent          = var.rolling_upgrade_policy.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = var.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = var.rolling_upgrade_policy.pause_time_between_batches
    }
  } */

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.src_image_ref_sku_name
    version   = "latest"
  }

  os_disk {
    storage_account_type = var.storage_acc_type_os_disk
    caching              = var.cache_os_disk
  }

  network_interface {
    name                      = var.nic_name
    primary                   = true
    network_security_group_id = var.nsg_id

    ip_configuration {
      name                                   = var.ip_config_name
      primary                                = true
      subnet_id                              = var.subnetid
      load_balancer_backend_address_pool_ids = [var.lb_backend_addresspool_id]
    }
  }
}


resource "azurerm_monitor_autoscale_setting" "auto_scaling" {
  name                = var.auto_scale_setting_name
  resource_group_name = var.rg_name
  location            = var.location_name
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.windows_vmss.id

  profile {
    name = "defaultProfile"

    capacity {
      default = var.instances_count
      minimum = var.min_instances_count
      maximum = var.max_instances_count
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.windows_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.windows_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}

resource "azurerm_virtual_machine_scale_set_extension" "vmss_iis" {
  count                        = var.install_iis_server_on_instances && var.os_flavor == "windows" ? 1 : 0
  name                         = "install-iis"
  publisher                    = "Microsoft.Compute"
  type                         = "CustomScriptExtension"
  type_handler_version         = "1.9"
  virtual_machine_scale_set_id = azurerm_windows_virtual_machine_scale_set.windows_vmss.id

  settings = <<SETTINGS
    {
      "commandToExecute" : "powershell Install-WindowsFeature -name Web-Server -IncludeManagementTools"
    }
  SETTINGS
}