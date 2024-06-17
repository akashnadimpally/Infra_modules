resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.rg_name
  recovery_vault_name = var.recovery_services_vault_name
  source_vm_id        = var.vm_id
  backup_policy_id    = var.backup_policy_id
}