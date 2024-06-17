variable "nic_count" {
  type = number
  default = 1
}

variable "nic_name" {
  type = string
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location_name" {
  type        = string
  description = "Location name"
}

variable "ip_config_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "pip_id" {
  type    = string
  default = null
}