module "resource_group" {
  source   = "git@github.com:padok-team/terraform-azurerm-resource-group.git?ref=v0.0.2"
  name     = "example_rg"
  location = "West Europe"
}

module "network" {
  source = "git@github.com:padok-team/terraform-azurerm-network.git?ref=v0.0.1"

  resource_group     = module.resource_group.this
  vnet_name          = "example_vnet"
  vnet_address_space = ["10.0.0.0/8"]
  subnets = {
    "subnet1" = "10.0.0.0/16",
    "subnet2" = "10.1.0.0/16",
    "subnet3" = "10.2.0.0/16",
  }
}
