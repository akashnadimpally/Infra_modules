variable "rg_name" {
  type = string
}

variable "nsg_rule_name" {
  type = string
}

variable "inbound_priority_number" {
  type = number
}

variable "inbound_access_control" {
  type = string
}

variable "inbound_protocol_name" {
  type = string
}

variable "inbound_src_port" {
  type = string
}

variable "inbound_dest_port" {
  type = string
}

variable "inbound_src_address_prefix" {
  type = string
}

variable "inbound_dest_address_prefix" {
  type = string
}

variable "nsg_name" {
  type = string
}
