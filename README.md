# AZURE NETWORK Terraform module

Terraform module which creates the following resources on **AZURE**:
- **virtual_network**
- **subnet**

## User Stories for this module

- AAOPS I can easily create a network which contain a vnet and multiple subnets.

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

- [Creation of a virtual network and 3 subnets](examples/main.tf)

<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet"></a> [subnet](#module\_subnet) | git@github.com:padok-team/terraform-azurerm-subnet.git | v0.0.1 |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | git@github.com:padok-team/terraform-azurerm-virtual-network.git | v0.0.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The resource group resource | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnets with their CIDR block | `map(string)` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The vnet name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The map of subnets |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | The vnet resource |
<!-- END_TF_DOCS -->
