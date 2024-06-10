resource "azurerm_storage_container" "main" {
  name                  = local.name
  storage_account_name  = var.account_name
  container_access_type = "private"
}