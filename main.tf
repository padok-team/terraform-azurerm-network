resource "azurerm_virtual_network" "this" {
  name = var.vnet_name

  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  address_space = var.vnet_address_space
  dns_servers   = var.dns_servers

  tags = var.tags
}

resource "azurerm_subnet" "these" {
  for_each = var.subnets

  name = each.key

  resource_group_name = var.resource_group.name

  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value]

  service_endpoints = lookup(var.subnets_service_endpoints, each.key, [])

  dynamic "delegation" {
    for_each = contains([for k, v in var.subnets_delegations : k], each.key) ? [1] : []

    content {
      name = var.subnets_delegations[each.key].name
      service_delegation {
        name    = var.subnets_delegations[each.key].service_delegation.name
        actions = var.subnets_delegations[each.key].service_delegation.actions
      }
    }
  }
}

module "logger" {
  source = "git@github.com:padok-team/terraform-azurerm-logger.git?ref=v0.3.0"
  count  = var.logs_enabled == true ? 1 : 0

  resource_group = var.resource_group

  resources_to_logs    = [azurerm_virtual_network.this.id]
  resources_to_metrics = [azurerm_virtual_network.this.id]

  log_analytics_workspace_id = var.log_analytics_workspace_id
}
