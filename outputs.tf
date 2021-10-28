output "vnet" {
  description = "The vnet resource"
  value       = module.virtual_network.this
}

output "subnets" {
  description = "The map of subnets"
  value = {
    for key, subnet in module.subnet :
    key => subnet
  }
}
