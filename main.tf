provider "azurerm" {
  features {}
}

locals {
  resource_group_name_loc = "hello"
  location_loc = "eastus"
  network = yamldecode(file("network.yaml"))
}

resource "azurerm_resource_group" "hello" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "backend" {
  name = "${local.resource_group_name_loc}-storage-account"
  resource_group_name = azurerm_resource_group.hello.name
  location = azurerm_resource_group.locals.location_loc
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "vnet" {
  name = local.network.vnet
  address_space = [local.network.address_space]
  resource_group_name = azurerm_resource_group.hello.name
  location = azurerm_resource_group.locals.location_loc
  dynamic "subnets" {
    for_each = local.network.subnets
    content {
      name = subnets.value.name
      address_prefixes = subnets.value.iprange
    }
  }
}
  
output "web_app_name" {
  description = "value of web app name"
  value = azurerm_storage_account.backend.name
  sensitive = true
}
