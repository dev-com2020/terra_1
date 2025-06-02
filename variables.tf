variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
  default     = "helloworldrg"
}

variable "location" {
  description = "Region Azure"
  type        = string
  default     = "westeurope"
}

variable "regions" {
  description = "Lista regionów"
  type        = list(string)
  default = ["westeurope","northeurope","uksouth"]
}