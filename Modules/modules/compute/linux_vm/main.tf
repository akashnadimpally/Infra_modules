resource "azurerm_linux_virtual_machine" "linux_vm" {
  count = var.vm_count
  name                            = "${var.linux_vm_name}${count.index}"
  resource_group_name             = var.rg_name
  location                        = var.location_name
  size                            = var.size_name
  disable_password_authentication = false
  admin_username                  = var.admin_user
  admin_password                  = var.admin_pass
  network_interface_ids = [
    var.nic_id[count.index],
  ]

  os_disk {
    caching              = var.cache_os_disk
    storage_account_type = var.storage_acc_type_os_disk
  }

  source_image_reference {
    publisher = var.linux_flavour_publisher
    offer     = var.linux_flavour_name
    sku       = var.linux_flavour_version
    version   = "latest"
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
  custom_data = var.linux_custom_data
}

# resource "azurerm_virtual_machine_extension" "linux_vm_ext" {
#   name                 = var.linux_vm_extension_name
#   virtual_machine_id   = azurerm_linux_virtual_machine.linux_vm.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "1.9"

#   settings = <<SETTINGS
#   {
#     "commandToExecute": "bash /Users/u1418758/Desktop/Summer/summer2023_akashnadimpally_azure_terraform/docker_install.sh"
#   }
#   SETTINGS
# }