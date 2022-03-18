module "virtual_network" {
  source = "git@github.com:padok-team/terraform-azurerm-virtual-network.git?ref=v0.1.0"

  name                = var.vnet_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  address_space       = var.vnet_address_space
  dns_servers         = var.dns_servers

  tags = var.tags
}

module "subnet" {
  source               = "git@github.com:padok-team/terraform-azurerm-subnet.git?ref=v0.1.0"
  for_each             = var.subnets
  name                 = each.key
  address_prefixes     = [each.value]
  resource_group_name  = var.resource_group.name
  virtual_network_name = module.virtual_network.this.name

  delegations = var.subnets_delegations
}

data "azurerm_monitor_diagnostic_categories" "this" {
  count       = var.logs_enabled ? 1 : 0
  resource_id = module.virtual_network.this.id
}
resource "azurerm_monitor_diagnostic_setting" "this" {
  count              = var.logs_enabled ? 1 : 0
  name               = "Diagnostic-${var.vnet_name}"
  target_resource_id = module.virtual_network.this.id

  log_analytics_workspace_id     = var.log_analytics_workspace_id
  storage_account_id             = var.storage_account_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id

  log_analytics_destination_type = null

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[count.index].logs
    content {
      category = log.value
      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[count.index].metrics
    content {
      category = metric.value
      retention_policy {
        days    = 0
        enabled = false
      }
    }
  }
}
