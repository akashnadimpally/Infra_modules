output "public_ip" {
  value = azurerm_public_ip.pip_azure.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.pip_azure.id
}