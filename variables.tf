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
variable "subnets" {
  description = "A map of subnets with their CIDR block"
  type        = map(string)
}
