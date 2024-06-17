

resource "azurerm_role_assignment" "example" {
  scope                = var.scope
  role_definition_name = var.role_def_name
  principal_id         = var.obj_id
}