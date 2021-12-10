# AZURE NETWORK Terraform module

Terraform module which creates the following resources on **AZURE**:
- **virtual_network**
- **subnet**

## User Stories for this module

- AAOPS I can easily create a network which contain a vnet and multiple subnets.
- AAOPS I can easily create a network with custom DNS servers which contain a vnet and multiple subnets.
- AAOPS I can easily create a network and export its logs with a Monitor Diagnostic Setting.
- AAOPS I can easily create a network which contain a vnet and multiple subnets with delegation.

## Usage

```hcl
module "network" {
  source = "git@github.com:padok-team/terraform-azurerm-network.git?ref=v0.0.1"

  resource_group     = "my-rg-name"
  vnet_name          = "example_vnet"
  vnet_address_space = ["10.0.0.0/8"]
  subnets = {
    "subnet1" = "10.0.0.0/16",
    "subnet2" = "10.1.0.0/16",
    "subnet3" = "10.2.0.0/16",
  }
}
```

## Examples

- [Creation of a virtual network and 3 subnets](examples/basic_network_example/main.tf)
- [Creation of a virtual network with DNS servers and 3 subnets](examples/network_with_dns/main.tf)
- [Creation of a virtual network and 3 subnets with logs enabled](examples/network_with_logging/main.tf)
- [Creation of a virtual network and 3 subnets with delegation](examples/network_with_subnet_delegation/main.tf)

<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet"></a> [subnet](#module\_subnet) | git@github.com:padok-team/terraform-azurerm-subnet.git | v0.0.2 |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | git@github.com:padok-team/terraform-azurerm-virtual-network.git | v0.0.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The resource group resource | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnets with their CIDR block | `map(string)` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The vnet name | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers associated with the virtual network. | `list(string)` | `null` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the log analytics workspace where to export logs. | `string` | `null` | no |
| <a name="input_logs_enabled"></a> [logs\_enabled](#input\_logs\_enabled) | Should the log export with DiagnosticSetting be enabled ? | `bool` | `false` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the storage account where to export logs. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The map of subnets |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | The vnet resource |
<!-- END_TF_DOCS -->
