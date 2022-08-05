output "vnet" {
  description = "A virtual network resource instance."
  value       = azurerm_virtual_network.this
}

output "subnets" {
  description = "A map of subnets."
  value       = azurerm_subnet.these
}
