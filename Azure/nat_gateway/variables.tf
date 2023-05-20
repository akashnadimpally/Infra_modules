variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location_name" {
  type        = string
  description = "location name"
}

variable "nat_name" {
  type = string
}

variable "nat_sku_name" {
  type = string
  default = "Standard"
}

/* variable "nat_zones" {
  type = string
} */

variable "pip_ip_address_id" {
    type = string
}

variable "nat_gateway_subnet_id" {
  type = string
}