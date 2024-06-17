output "win_vm_id" {
  # value = azurerm_windows_virtual_machine.win_vm.id
  value = [for vm in azurerm_windows_virtual_machine.win_vm : vm.id ]
}

output "win_vm_identity_id" {
  value = [for vm in azurerm_windows_virtual_machine.win_vm : vm.identity]
}

output "win_vm_name" {
  value = [for vm in azurerm_windows_virtual_machine.win_vm : vm.name]
}

# output "system_assigned_identity_object_id" {
#   value = (var.identity_type == "SystemAssigned" || var.identity_type == "SystemAssigned, UserAssigned") ? azurerm_windows_virtual_machine.win_vm.identity[0].principal_id : null
# }

output "system_assigned_identity_object_id" {
  value = [for vm in azurerm_windows_virtual_machine.win_vm : contains(split(", ", vm.identity[0].type), "SystemAssigned") ? vm.identity[0].principal_id : null]
}
