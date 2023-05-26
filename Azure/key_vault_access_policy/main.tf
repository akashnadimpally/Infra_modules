data "azurerm_client_config" "current" {}

/* resource "azurerm_key_vault_access_policy" "kv_access_policy" {
  for_each      = { for policy in var.access_policies : policy.object_id => policy }
  key_vault_id  = var.kv_id
  tenant_id     = data.azurerm_client_config.current.tenant_id
  object_id     = each.value.object_id == "managed_identity" ? var.managed_identity_object_id : each.value.object_id
  secret_permissions = each.value.secret_permissions
  key_permissions    = each.value.key_permissions
  certificate_permissions = each.value.certificate_permissions
} */

resource "azurerm_key_vault_access_policy" "key_vault_access" {
  key_vault_id       = var.kv_id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.object_ids[0]
  key_permissions    = var.key_permission
  secret_permissions = var.secret_permission
  storage_permissions = var.storage_permission
}