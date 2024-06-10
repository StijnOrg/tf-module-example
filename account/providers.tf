terraform {
  required_version = "~> 1.5" # currently we use the default Humanitec TF runner image, which is limited to TF 1.5.7
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
}

provider "azurerm" {
  use_aks_workload_identity = true
  use_cli                   = false
  subscription_id           = local.subscription_id
  storage_use_azuread       = true
  features {}
}