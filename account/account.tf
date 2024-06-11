resource "random_string" "storage_account_name_sufix" {
  length  = 16
  special = false
  lower   = true
  upper   = false
}

resource "azurerm_storage_account" "main" {
  name                            = local.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  tags                            = local.tags
  account_kind                    = var.account_kind
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  access_tier                     = var.access_tier
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  shared_access_key_enabled       = var.shared_access_key_enabled
  is_hns_enabled                  = var.is_hns_enabled || var.sftp_enabled ? true : false
  sftp_enabled                    = var.sftp_enabled
  large_file_share_enabled        = var.large_file_share_enabled
  enable_https_traffic_only       = true

  blob_properties {
    versioning_enabled  = var.sftp_enabled ? false : var.versioning_enabled
    change_feed_enabled = var.sftp_enabled ? false : var.change_feed_enabled
    delete_retention_policy {
      days = var.delete_retention_policy_days
    }
    container_delete_retention_policy {
      days = var.container_delete_retention_policy_days
    }
  }
}

resource "azurerm_storage_account_network_rules" "st_network_rules" {
  storage_account_id = azurerm_storage_account.main.id
  default_action     = length(var.private_endpoint_services) > 0 ? "Deny" : "Allow"
  bypass             = ["AzureServices"]
  ip_rules           = module.humanitecvars.trusted_wan_ips
}

module "private_endpoint" {
  for_each            = toset(var.private_endpoint_services)
  source              = "github.com/liantisit-iac-modules/azure-private-endpoint-base?ref=1.0.3"
  resource_suffix     = var.resource_suffix
  resource_name       = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  resource_id         = azurerm_storage_account.main.id
  subresource_name    = each.value
  kind                = each.value != "file" ? "http" : "data"
  tags                = var.tags
}