variable "res_id" {
  type        = string
  description = "Humanitec resource id."
}

variable "env_id" {
  type        = string
  description = "Humanitec env id"
}

variable "app_id" {
  type        = string
  description = "Name of the solution which will use this storage account"
}

variable "env_type" {
  description = "Humanitec Environment type."
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the storage account will be created in."
}

variable "location" {
  type        = string
  description = "The Azure location where the resource will be deployed."
  default     = "Germany West Central"
  validation {
    condition     = contains(["Germany West Central", "Germany North", "West Europe", "germanywestcentral", "germanynorth", "westeurope"], var.location)
    error_message = "Invalid location. Allowed values are Germany West Central, Germany North, West Europe, germanywestcentral, germanynorth, westeurope."
  }
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the Key Vault will be created in."
}

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = "Type of storage account to be created (BlobStorage/BlockBlobStorage/FileStorage/Storage/StorageV2)."
  validation {
    condition = contains([
      "BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"
    ], var.account_kind)
    error_message = "Account_kind must be one of the following BlobStorage/BlockBlobStorage/FileStorage/Storage/StorageV2."
  }
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "Account tier (Standard or Premium)."
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Account_tier must be either Standard or Premium."
  }
}

variable "account_replication_type" {
  type        = string
  default     = "ZRS"
  description = "Type of storage replication (LRS/GRS/RAGRS/ZRS/GZRS/RAGZRS)."
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Account_replication_type should be one of the following LRS/GRS/RAGRS/ZRS/GZRS/RAGZRS."
  }
}

variable "access_tier" {
  type        = string
  default     = "Hot"
  description = "Access tier (Hot or Cool)."
  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "Access_tier must be either Hot or Cool."
  }
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  default     = false
  description = "Allow or disallow public access to all nested items in the storage account.  (Default=false)."
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "Enable versioning on blob."
}

variable "change_feed_enabled" {
  type        = bool
  default     = true
  description = "Enable blob service properties for change feed events."
}

variable "delete_retention_policy_days" {
  type        = number
  default     = 7
  description = "Specifies the number of days that the blob should be retained. (Default = 7)"
  validation {
    condition     = (var.delete_retention_policy_days >= 1 && var.delete_retention_policy_days < 365)
    error_message = "Number of days for delete_retention_policy_days must be between 1 and 365."
  }
}

variable "container_delete_retention_policy_days" {
  type        = number
  default     = 7
  description = "Specifies the number of days that the container should be retained. (Default = 7)."
  validation {
    condition     = (var.container_delete_retention_policy_days >= 1 && var.container_delete_retention_policy_days < 365)
    error_message = "Number of days for container_delete_retention_policy_days must be between 1 and 365."
  }
}

variable "storage_account_access_subnet_name" {
  type        = list(string)
  default     = null
  description = "List of strings specifying which subnet can access this storage account."
}

variable "is_hns_enabled" {
  type        = bool
  default     = false
  description = "For Azure Data Lake Storage Gen 2 - this needs to be set to true.  (Default = false)."
}

variable "shared_access_key_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the storage account permits requests to be authorized with the account access keys.  (Default = false)."
}

variable "large_file_share_enabled" {
  type        = bool
  default     = false
  description = "Specifies wether Large File Shares are enabled. Only limited to locally redundant and zone redundant replication options."
}

variable "sftp_enabled" {
  type        = bool
  default     = false
  description = "Enables SFTP endpoint.  By setting this to true, versioning and change_feed will be disabled (Default = false)."
}

variable "private_endpoint_services" {
  type        = list(string)
  default     = []
  description = "List of services to connect to the private endpoint. Allowed services in array: blob, web, file."
  validation {
    condition     = alltrue([for service in var.private_endpoint_services : contains(["blob"], service)])
    error_message = "Invalid private_endpoint_services. Allowed value is blob."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

locals {
  tags = merge(var.tags, {
    "source"          = "platform-humanitec"
    "creationdate"    = timestamp()
    "environmenttype" = var.env_type
    "environment"     = var.env_id
  })

  resource_suffix = module.humanitecvars.humanitec_env_type_resource_suffix_mapping[var.env_type]

  subscription_id = module.humanitecvars.subscription_ids[local.resource_suffix]
  tenant_id       = module.humanitecvars.tenant_id

  name = "${module.naming.storage_account.slug}${random_string.storage_account_name_sufix.result}"
}