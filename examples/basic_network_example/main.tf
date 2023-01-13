# This example creates a virtual network with 3 subnets.
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
}
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "example_rg"
  location = "West Europe"
}

module "network" {
  source = "../.."

  resource_group     = azurerm_resource_group.this
  vnet_name          = "example_vnet"
  vnet_address_space = ["10.0.0.0/8"]
  subnets = {
    "subnet1" = "10.0.0.0/16",
    "subnet2" = "10.1.0.0/16",
    "subnet3" = "10.2.0.0/16",
  }

  tags = {
    terraform : "true"
  }
}
