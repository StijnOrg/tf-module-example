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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_humanitecvars"></a> [humanitecvars](#module\_humanitecvars) | github.com/liantisit-iac-modules/humanitecvars | v1 |
| <a name="module_naming"></a> [naming](#module\_naming) | Azure/naming/azurerm | ~> 0.4 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_container.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Name of the storage account to be created. | `string` | n/a | yes |
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | Humanitec Application ID | `string` | n/a | yes |
| <a name="input_env_id"></a> [env\_id](#input\_env\_id) | Humanitec Environment ID | `string` | n/a | yes |
| <a name="input_env_type"></a> [env\_type](#input\_env\_type) | Humanitec Environment type. | `string` | n/a | yes |
| <a name="input_res_id"></a> [res\_id](#input\_res\_id) | Humanitec Resource ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | n/a |
| <a name="output_container"></a> [container](#output\_container) | n/a |
<!-- END_TF_DOCS -->