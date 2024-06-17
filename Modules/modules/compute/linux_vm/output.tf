output "vm_name" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.admin_username]
}

output "linux_vm_id" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}

output "system_assigned_identity_object_id" {
  value = coalesce(
    [for vm in azurerm_linux_virtual_machine.linux_vm : 
      contains(split(", ", vm.identity.0.type), "SystemAssigned") ? vm.identity.0.principal_id : null
    ][0],
    null
  )
}