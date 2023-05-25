output "managed_identity_object_id" {
  value = azurerm_user_assigned_identity.user_a_mi.principal_id
}

output "managed_identity_client_id" {
  value = azurerm_user_assigned_identity.user_a_mi.client_id
}
