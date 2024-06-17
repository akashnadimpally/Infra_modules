resource "azurerm_windows_virtual_machine" "win_vm" {
  count = var.vm_count
  name                = "${var.windows_vm_name}${count.index}"
  resource_group_name = var.rg_name
  location            = var.location_name
  size                = var.size_name
  admin_username      = var.admin_user
  admin_password      = var.admin_pass
  network_interface_ids = [var.nic_id[count.index],]

  os_disk {
    caching              = var.cache_os_disk
    storage_account_type = var.storage_acc_type_os_disk
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.src_image_ref_sku_name
    version   = "latest"
  }

  identity {
    type         = var.identity_type
    identity_ids = [(var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? var.uami_ids : null]
  }
}

/* resource "azurerm_virtual_machine_extension" "win_vm_ext" {
  name                 = "IIS"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
      "commandToExecute" : "powershell Install-WindowsFeature -name Web-Server,Web-Asp-Net45,NET-Framework-Features -IncludeManagementTools"
    }
  SETTINGS

} */

/* resource "azurerm_virtual_machine_extension" "win_vm_ext2" {
  name                 = "DeploymentGroup"
  virtual_machine_id   = azurerm_windows_virtual_machine.win_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
  {
    "fileUris": ["https://gitlab.com/rohit104/summer2023_akashnadimpally_azure_terraform/-/raw/main/scripts/ADO_DG.ps1?ref_type=heads"],
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File ADO_DG.ps1"
  }
  SETTINGS

  depends_on = [ azurerm_virtual_machine_extension.win_vm_ext ]
}
 */




