resource "azurerm_backup_policy_vm" "backup_policy_vm" {
  name                = var.backup_policy_vm_name
  resource_group_name = var.rg_name
  recovery_vault_name = var.recovery_services_vault_name
  policy_type         = "V2"

  backup {
    frequency = "Daily"
    time      = "22:00"
  }

  retention_daily {
    count = 7
  }

}