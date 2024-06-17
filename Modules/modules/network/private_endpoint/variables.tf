variable "private_endpoint_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "private_service_connection_name" {
  type = string
}

variable "private_endpoint_connection_resource_id" {
  type = string
}

variable "private_endpoint_subresource_names" {
  type = list(any)
}

variable "private_dns_zone_name" {
  type = string
}

variable "private_dns_zone_ids" {
  type = string
}