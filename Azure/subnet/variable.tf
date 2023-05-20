variable "location_name" {
  type        = string
  description = "Location name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "existing_subnet_name" {
  type    = string
  default = ""
}

variable "vnet_address_prefix" {
  type        = string
  description = "Virtual network address prefix"
}

variable "create_subnet" {
  type        = bool
  description = "Create the subnet if it does not exist"
  default     = true
}

variable "address_prefixes_ip" {
  type        = string
  description = "description"
}


variable "s_name" {
  type = string
  description = "description"
}
