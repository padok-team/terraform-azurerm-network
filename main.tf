module "virtual_network" {
  source = "git@github.com:padok-team/terraform-azurerm-virtual-network.git?ref=v0.0.1"

  name                = var.vnet_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  address_space       = var.vnet_address_space
}

module "subnet" {
  source               = "git@github.com:padok-team/terraform-azurerm-subnet.git?ref=v0.0.1"
  for_each             = var.subnets
  name                 = each.key
  address_prefixes     = [each.value]
  resource_group_name  = var.resource_group.name
  virtual_network_name = module.virtual_network.this.name
}
