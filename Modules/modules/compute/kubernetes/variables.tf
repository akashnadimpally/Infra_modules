variable "aks_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "aks_dns_prefix" {
  type = string
}

variable "node_pool_name" {
  type = string
}

variable "node_pool_count" {
  type = number
}

variable "node_pool_vm_size" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "aks_sku" {
  type = string
}

variable "aks_automatic_channel_upgrade" {
  type = string
}

