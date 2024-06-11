<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_humanitecvars"></a> [humanitecvars](#module\_humanitecvars) | github.com/liantisit-iac-modules/humanitecvars | v1 |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | ~> 0.4 |
| <a name="module_private_endpoint"></a> [private\_endpoint](#module\_private\_endpoint) | github.com/liantisit-iac-modules/azure-private-endpoint-base | 1.0.3 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.st_network_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [random_string.storage_account_name_sufix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | Access tier (Hot or Cool). | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Type of storage account to be created (BlobStorage/BlockBlobStorage/FileStorage/Storage/StorageV2). | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Type of storage replication (LRS/GRS/RAGRS/ZRS/GZRS/RAGZRS). | `string` | `"ZRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Account tier (Standard or Premium). | `string` | `"Standard"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Allow or disallow public access to all nested items in the storage account.  (Default=false). | `bool` | `false` | no |
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | Name of the solution which will use this storage account | `string` | n/a | yes |
| <a name="input_change_feed_enabled"></a> [change\_feed\_enabled](#input\_change\_feed\_enabled) | Enable blob service properties for change feed events. | `bool` | `true` | no |
| <a name="input_container_delete_retention_policy_days"></a> [container\_delete\_retention\_policy\_days](#input\_container\_delete\_retention\_policy\_days) | Specifies the number of days that the container should be retained. (Default = 7). | `number` | `7` | no |
| <a name="input_delete_retention_policy_days"></a> [delete\_retention\_policy\_days](#input\_delete\_retention\_policy\_days) | Specifies the number of days that the blob should be retained. (Default = 7) | `number` | `7` | no |
| <a name="input_env_id"></a> [env\_id](#input\_env\_id) | Humanitec env id | `string` | n/a | yes |
| <a name="input_env_type"></a> [env\_type](#input\_env\_type) | Humanitec Environment type. | `string` | n/a | yes |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | For Azure Data Lake Storage Gen 2 - this needs to be set to true.  (Default = false). | `bool` | `false` | no |
| <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled) | Specifies wether Large File Shares are enabled. Only limited to locally redundant and zone redundant replication options. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where the resource will be deployed. | `string` | `"Germany West Central"` | no |
| <a name="input_private_endpoint_services"></a> [private\_endpoint\_services](#input\_private\_endpoint\_services) | List of services to connect to the private endpoint. Allowed services in array: blob, web, file. | `list(string)` | `[]` | no |
| <a name="input_res_id"></a> [res\_id](#input\_res\_id) | Humanitec resource id. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the storage account will be created in. | `string` | n/a | yes |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | Enables SFTP endpoint.  By setting this to true, versioning and change\_feed will be disabled (Default = false). | `bool` | `false` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | Specifies whether the storage account permits requests to be authorized with the account access keys.  (Default = false). | `bool` | `false` | no |
| <a name="input_storage_account_access_subnet_name"></a> [storage\_account\_access\_subnet\_name](#input\_storage\_account\_access\_subnet\_name) | List of strings specifying which subnet can access this storage account. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable versioning on blob. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Azure resource name of created storage account. Required output by Humanitec Resource Type. |
<!-- END_TF_DOCS -->