variable "resource_group" {
  description = "The resource group resource"
  type = object({
    name     = string
    location = string
  })
}

variable "vnet_name" {
  description = "The vnet name"
  type        = string
}
variable "vnet_address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}

variable "dns_servers" {
  description = "DNS servers associated with the virtual network."
  type        = list(string)
  default     = null
}

variable "subnets" {
  description = "A map of subnets with their CIDR block"
  type        = map(string)
}

# name =>  A name for this delegation.
# service_delegation.name => The name of service to delegate to.
# service_delegation.actions => A list of Actions which should be delegated. This list is specific to the service to delegate to.
variable "subnets_delegation" {
  description = "Delegation object to configure on the subnets"
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
  default = null

  validation {
    condition = var.subnets_delegation == null || can([
      for o in var.subnets_delegation : can(regex("^(Microsoft.ApiManagement/service|Microsoft.AzureCosmosDB/clusters|Microsoft.BareMetal/AzureVMware|Microsoft.BareMetal/CrayServers|Microsoft.Batch/batchAccounts|Microsoft.ContainerInstance/containerGroups|Microsoft.Databricks/workspaces|Microsoft.DBforMySQL/flexibleServers|Microsoft.DBforMySQL/serversv2|Microsoft.DBforPostgreSQL/flexibleServers|Microsoft.DBforPostgreSQL/serversv2|Microsoft.DBforPostgreSQL/singleServers|Microsoft.HardwareSecurityModules/dedicatedHSMs|Microsoft.Kusto/clusters|Microsoft.Logic/integrationServiceEnvironments|Microsoft.MachineLearningServices/workspaces|Microsoft.Netapp/volumes|Microsoft.Network/managedResolvers|Microsoft.PowerPlatform/vnetaccesslinks|Microsoft.ServiceFabricMesh/networks|Microsoft.Sql/managedInstances|Microsoft.Sql/servers|Microsoft.StreamAnalytics/streamingJobs|Microsoft.Synapse/workspaces|Microsoft.Web/hostingEnvironments|Microsoft.Web/serverFarms)$", o.service_delegation.name))
    ])
    error_message = "Please respect the required value given here: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#name>."
  }
}

variable "logs_enabled" {
  description = "Should the log export with DiagnosticSetting be enabled ?"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the log analytics workspace where to export logs."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "The ID of the storage account where to export logs."
  type        = string
  default     = null
}

variable "eventhub_authorization_rule_id" {
  description = "ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
