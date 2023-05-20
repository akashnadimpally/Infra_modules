variable "outbound_nsg_name" {
  type =  string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "nsg_rule_name" {
    type = string
}

variable "outbound_priority_number" {
  type = number
}

variable "outbound_access_control" {
  type = string
}

variable "outbound_protocol_name" {
  type = string
}

variable "outbound_src_port" {
  type = string
}

variable "outbound_dest_port" {
  type = string
}

variable "outbound_src_address_prefix" {
  type = string
}

variable "outbound_dest_address_prefix" {
  type = string
}