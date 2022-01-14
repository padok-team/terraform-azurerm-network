# This example creates a virtual network with 3 subnets and exports VNET logs to a log analytics workspace.
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.82.0"
    }
  }
}
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  features {}
}

module "resource_group" {
  source   = "git@github.com:padok-team/terraform-azurerm-resource-group.git?ref=v1.0.0"
  name     = "example_rg"
  location = "West Europe"
}

module "log_analytics_workspace" {
  source = "git@github.com:padok-team/terraform-azurerm-diagnostic-settings.git?ref=v1.0.0"

  resource_group_name     = module.resource_group.this.name
  resource_group_location = module.resource_group.this.location

  name      = "example-law"
  resources = [] # We wan to create a log analytics workspace alone
}

module "network" {
  source = "./../.."

  resource_group     = module.resource_group.this
  vnet_name          = "example_vnet"
  vnet_address_space = ["10.0.0.0/8"]
  subnets = {
    "subnet1" = "10.0.0.0/16",
    "subnet2" = "10.1.0.0/16",
    "subnet3" = "10.2.0.0/16",
  }

  logs_enabled               = true
  log_analytics_workspace_id = module.log_analytics_workspace.azurerm_log_analytics_workspace_id
}
