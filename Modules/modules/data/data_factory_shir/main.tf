resource "azurerm_data_factory_integration_runtime_self_hosted" "adf_shir" {
  name            = var.adf_shir
  data_factory_id = var.adf_id
}