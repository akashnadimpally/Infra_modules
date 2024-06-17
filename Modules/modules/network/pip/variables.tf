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
  type = string
  default     = "Dynamic"
  description = "description"
  validation {
    condition = contains(["Static", "Dynamic"],var.allocation_method_name)
    error_message = "Must be Static or Dynamic"
  }
}

variable "sku_name" {
  type = string
  /* default = "Standard" */
  validation {
    condition = contains(["Basic", "Standard"],var.sku_name)
    error_message = "Must be Basic or Standard"
  }
}

variable "sku_tier" {
  type = string
  default = "Regional"
  validation {
    condition = contains(["Regional", "Global"],var.sku_tier)
    error_message = "Must be either Global or Regional"
  }
}