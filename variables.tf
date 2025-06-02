variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
  default     = "hello-world-rg"
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

variable "tags3" {
  description = "Lista tagów"
  type        = list(string)
  nullable = true
  default = null
}
variable "tags2" {
  description = "Lista tagów2"
  type        = object({
    AppName = optional(string,"prod") 
  })
  default = null
}

variable "super_secret" {
  type = string
  description = "Super secret string"
  sensitive = true
  validation {
    condition = "length(var.super_secret) > 0"
    error_message = "Super secret string is required"
  }
  validation {
    condition = "regex(var.super_secret, '^[a-zA-Z0-9]+$')"
    error_message = "Super secret string must contain only alphanumeric characters"
  }
  validation {
    condition = "length(var.super_secret) < 100"
    error_message = "Super secret string must be less than 100 characters long"
  }
}

variable "tags" {
  description = "Tags requested for deployment attributes mapping."
  type = object({
    Environment = string
    Company = string
    Count = number
    AppName = string
    CostLimit = number
    Backup = bool
  })
  default = {}

  validation {
    condition = contains([
      "prd", "pre", "sit","uat","dev","int","test","nonprd"
    ], var.tags.Environment)
    error_message = "infomracja o błędzie"
  }
}