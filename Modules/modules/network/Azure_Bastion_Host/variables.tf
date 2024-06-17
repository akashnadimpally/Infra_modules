variable "bastion_host_name" {
  type = string
}

variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location_name" {
  type        = string
  description = "location name"
}

variable "s_net_id" {
  type = string
}

variable "pip_id" {
  type = string
}

variable "bastion_config_name" {
  type = string
}