# AZURE NETWORK Terraform module
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [User Stories for this module](#user-stories-for-this-module)
- [Usage](#usage)
- [Examples](#examples)
- [Modules](#modules)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


Terraform module which creates the following resources on **AZURE**:
- **virtual_network**
- **subnet**

## User Stories for this module

- AAOps I can easily create a network which contains a VNET and multiple subnets.
- AAOps I can easily create a network with custom DNS servers which contains a VNET and multiple subnets.
- AAOps I can easily create a network and export its logs with a Monitor Diagnostic Setting.
- AAOps I can easily create a network which contains a VNET and multiple subnets with delegation.

## Usage

```hcl
module "network" {
  source = "git@github.com:padok-team/terraform-azurerm-network.git?ref=v0.1.0"

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

- [Virtual network with 3 subnets](examples/basic_network_example/main.tf)
- [Virtual network with DNS servers and 3 subnets](examples/network_with_dns/main.tf)
- [Virtual network with 3 subnets with logs enabled](examples/network_with_logging/main.tf)
- [Virtual network with 3 subnets with delegation](examples/network_with_subnet_delegation/main.tf)

<!-- BEGIN_TF_DOCS -->
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_logger"></a> [logger](#module\_logger) | git@github.com:padok-team/terraform-azurerm-logger.git | v0.1.4 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The resource group resource. | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The VNET name | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers associated with the virtual network. | `list(string)` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the log analytics workspace where the logs will be exported. | `string` | `null` | no |
| <a name="input_logs_enabled"></a> [logs\_enabled](#input\_logs\_enabled) | Wether or not to enabled DiagnosticSetting | `bool` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnets with their CIDR block. | `map(string)` | `{}` | no |
| <a name="input_subnets_delegations"></a> [subnets\_delegations](#input\_subnets\_delegations) | A map of delegations configurations for each subnet keys. | <pre>map(object({<br>    name = string<br>    service_delegation = object({<br>      name    = string<br>      actions = list(string)<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_subnets_service_endpoints"></a> [subnets\_service\_endpoints](#input\_subnets\_service\_endpoints) | A map of service endpoint list for each subnet keys. | `map(list(string))` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | A map of subnets. |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | A virtual network resource instance. |
<!-- END_TF_DOCS -->

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```
