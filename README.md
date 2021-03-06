## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ./db | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./network | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.LB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backendPool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.outRule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.LB](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lbnatrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_linux_virtual_machine.terminal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_monitor_autoscale_setting.AutoscaleSetting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_resource_group.week6](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.backendstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_virtual_machine_scale_set.scaleSet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_scale_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | n/a | `string` | `"app"` | no |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | n/a | `number` | `8080` | no |
| <a name="input_dbname"></a> [dbname](#input\_dbname) | variable "dbname\_prod" { default = "psqlservice" } | `string` | `"psqlservice-stage"` | no |
| <a name="input_dbname_stage"></a> [dbname\_stage](#input\_dbname\_stage) | n/a | `string` | `"psqlservice-stage"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"australiaeast"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"week6-stg"` | no |
| <a name="input_secret"></a> [secret](#input\_secret) | n/a | `string` | `"coolpassword"` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | `string` | `"backendstorage2022"` | no |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | n/a | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password_for_servers"></a> [admin\_password\_for\_servers](#output\_admin\_password\_for\_servers) | n/a |
| <a name="output_admin_password_for_servers_and_db"></a> [admin\_password\_for\_servers\_and\_db](#output\_admin\_password\_for\_servers\_and\_db) | n/a |
| <a name="output_admin_user_for_servers"></a> [admin\_user\_for\_servers](#output\_admin\_user\_for\_servers) | n/a |
| <a name="output_app_public_ip"></a> [app\_public\_ip](#output\_app\_public\_ip) | n/a |
| <a name="output_db_server_password"></a> [db\_server\_password](#output\_db\_server\_password) | n/a |
| <a name="output_db_server_user"></a> [db\_server\_user](#output\_db\_server\_user) | n/a |
| <a name="output_mannger_machine_public_ip"></a> [mannger\_machine\_public\_ip](#output\_mannger\_machine\_public\_ip) | n/a |
