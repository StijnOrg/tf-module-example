output "account" {
  value       = azurerm_storage_container.main.storage_account_name
  description = "Name of the storage account. Required output by Humanitec Resource Type."
}

output "container" {
  value       = azurerm_storage_container.main.name
  description = "value of the container. Required output by Humanitec Resource Type."
}