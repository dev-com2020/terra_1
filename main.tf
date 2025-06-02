provider "azurerm" {
  features {}
  subscription_id = "ae5c06a5-35d9-4549-a05c-e9cf1c7a36e3"
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
  name = "${local.resource_group_name_loc}account"
  resource_group_name = azurerm_resource_group.hello.name
  location = local.location_loc
  account_tier = "Standard"
  account_replication_type = "LRS"
}

 
output "web_app_name" {
  description = "value of web app name"
  value = azurerm_storage_account.backend.name
  sensitive = true
}
