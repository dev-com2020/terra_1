provider "azurerm" {
  features {}
  subscription_id = ""
}

locals {
  resource_group_name_loc = "hello"
  location_loc = "eastus"
  network = yamldecode(file("network.yaml"))
  now = timestamp()
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
  # description = var.opis == "Hello" ? "opis aplikacji":"brak informacji o aplikacji"
  value = "${local.now}-czas maszyny"
  sensitive = false
}
