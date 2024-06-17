variable "vnet_name" {
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

/* variable "existing_vnet_name" {
  type    = string
  default = ""  # Leave it empty if the virtual network doesn't exist
} */
/* variable "create_vnet" {
  type        = bool
  description = "Create virtual network if it doesn't exist"
  default     = true
} */

variable "vnet_address_prefix_ip" {
  type        = string
  description = "description"
}


# variable "subnet_name" {
#   type        = string
#   description = "description"
# }

