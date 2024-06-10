output "account" {
  value = azurerm_storage_container.main.storage_account_name
}

output "container" {
  value = azurerm_storage_container.main.name
}