variable "pip_name" {
  type        = string
  description = "description"
}

variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location_name" {
  type        = string
  description = "location name"
}

variable "allocation_method_name" {
  type        = string
  default     = "Dynamic"
  description = "description"
}

variable "sku_name" {
  type = string
  default = "Standard"
}