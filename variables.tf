variable "resource_group" {
  description = "The resource group resource."
  type = object({
    name     = string
    location = string
  })
}

variable "vnet_name" {
  description = "The VNET name"
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
  description = "A map of subnets with their CIDR block."
  type        = map(string)
  default     = {}
}

variable "subnets_service_endpoints" {
  description = "A map of service endpoint list for each subnet keys."
  type        = map(list(string))
  default     = {}
}

variable "subnets_delegations" {
  description = "A map of delegations configurations for each subnet keys."
  type = map(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
  default = {}
}

variable "enable_logging" {
  description = "Wether or not to enabled DiagnosticSetting"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "The ID of the log analytics workspace where the logs will be exported."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
