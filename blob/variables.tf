variable "account_name" {
  type        = string
  description = "Name of the storage account to be created."
}

variable "app_id" {
  type        = string
  description = "Humanitec Application ID"
}

variable "env_id" {
  type        = string
  description = "Humanitec Environment ID"
}

variable "res_id" {
  type        = string
  description = "Humanitec Resource ID"
}

variable "env_type" {
  type        = string
  description = "Humanitec Environment type."
}

locals {
  storage_account_container_prefix = "c-"
  resource_suffix                  = module.humanitecvars.humanitec_env_type_resource_suffix_mapping[var.env_type]

  subscription_id = module.humanitecvars.subscription_ids[local.resource_suffix]
  tenant_id       = module.humanitecvars.tenant_id

  workload_name = replace(trimprefix(var.res_id, "modules."), "/.external.*/", "")

  name = lower(substr("${local.storage_account_container_prefix}${var.app_id}-${var.env_id}-${local.workload_name}", 0, 62))
}