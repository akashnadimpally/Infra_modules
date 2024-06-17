variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location_name" {
  type        = string
  description = "location name"
}

variable "create_resource_group" {
  description = "Controls whether to create the resource group or not"
  type        = bool
  default     = true
}

