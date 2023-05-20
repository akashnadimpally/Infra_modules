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
