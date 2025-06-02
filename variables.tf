variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
  default     = "hello-test-no_git"
}

variable "location" {
  description = "Region Azure"
  type        = string
  default     = "westeurope"
}

variable "regions" {
  description = "Lista regionów"
  type        = list(string)
  default     = ["westeurope", "northeurope", "uksouth"]
  # [for reg in var.regions: "azurerm_resource_group.terraform_rg" : reg]
}

variable "opis" {
  description = <<-EOT
  opis...
  ...
  ...
  ..
EOT
  type        = string
  default     = "Hello"
}

variable "tags" {
  description = "value"
  type = map(string)
  default = {}
}

variable "server_config" {
  description = "value"
  type = object({
    instance_type = string
    disk_size = number
    tags = map(string) 
  })
  default = {
    instance_type = "value"
    disk_size = 0
    tags = {
      "name" = "value"
    }
  }
  validation {
    condition = contains(["",""], var.instance_type)
    error_message = "value"
  }
  
}
