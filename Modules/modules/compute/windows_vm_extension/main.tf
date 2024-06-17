resource "azurerm_virtual_machine_extension" "vm_ext" {
  name                 = var.win_vm_ext_name
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
    "fileUris": ["file:///Users/u1418758/Desktop/summer2023_akashnadimpally_azure_terraform/scripts/ADO_DG.ps1"],
    "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File ADO_DG.ps1"
    }
  SETTINGS

}