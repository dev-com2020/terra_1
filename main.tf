provider "azurerm" {
  features {}
  subscription_id = ""
}

locals {
  resource_group_name_loc = upper("test_hello_tk_k")
  location_loc            = lower("eastus")
  network                 = yamldecode(file("network.yaml"))
  now                     = timestamp()
  max_value = max(5,12,9)
  mix_value = min(5,12,9)
  list_length = length(var.regions)
  formated_date = formatdate("YYYY-MM-DD",timestamp())
}
resource "azurerm_resource_group" "hello" {
  name     = format("RG-%s",terraform.workspace)
  location = var.location
  tags = {
    Name = "instance-${count.index + 1}"
  }
}
// komentarz
# komentarz
/*
komentarz
komentarz
komentarz
*/
resource "azurerm_storage_account" "backend" {
  name                     = "accountk1"
  resource_group_name      = azurerm_resource_group.hello.name
  location                 = local.location_loc
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


output "web_app_name" {
  # description = var.opis == "Hello" ? "opis aplikacji":"brak informacji o aplikacji"
  value     = "${local.now}-powstanie maszyny"
  sensitive = false
}
