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
