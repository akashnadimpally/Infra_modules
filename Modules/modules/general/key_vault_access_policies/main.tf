data "azurerm_client_config" "current" {}

/* resource "azurerm_key_vault_access_policy" "identity_access" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id */
/* object_id    = var.identity_object_id
  key_permissions = var.kv_key_permissions
  certificate_permissions = var.kv_certificate_permissions
  secret_permissions = var.kv_secret_permissions */

#dynamic "access_policy" {
/* for_each = var.object_ids_permissions */

#content {
/* object_id        = each.key
      key_permissions  = each.value.key_permissions
      secret_permissions = each.value.secret_permissions
      certificate_permissions = each.value.certificate_permissions */
#}
#}

/* } */

# resource "azurerm_key_vault_access_policy" "identity_access" {
#   for_each = var.object_ids_permissions

#   key_vault_id              = var.key_vault_id
#   tenant_id                 = data.azurerm_client_config.current.tenant_id
#   object_id                 = each.key
#   key_permissions           = each.value.key_permissions
#   secret_permissions        = each.value.secret_permissions
#   certificate_permissions   = each.value.certificate_permissions
# }

resource "azurerm_key_vault_access_policy" "identity_access" {
  key_vault_id            = var.key_vault_id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.kv_obj_id
  key_permissions         = var.kv_key_permissions
  secret_permissions      = var.kv_secret_permissions
  certificate_permissions = var.kv_certificate_permissions
}