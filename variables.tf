variable "resource_group_name" {
  type        = string
  default     = "horizon"
  description = "description"
}

variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "description"
}

# variable "virtual_network_name" {
#   type        = string
#   description = "description"
# }

variable "subnet_name" {
  type        = string
  default     = "subnet1"
  description = "description"
}

variable "public_ip_name" {
  type        = string
  default     = "horizon-pip"
  description = "description"
}

variable "allocate_method_name" {
  type = string
  default = "Static"
}

variable "sku_name_azure" {
  type = string
  default = "Standard"
}


variable "nat_name_azure" {
  type = string
  default = "horizon-nat"
}

variable "nat_sku_name_azure" {
  type = string
  default = "Standard"
}

variable "nat_zones_value" {
  type = string
  default = "1"
}

variable "network_security_group_name" {
  type = string
  default = "horizon-nsg"
}