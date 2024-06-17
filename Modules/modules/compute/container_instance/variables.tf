variable "ACI_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "ACI_ip_address_type" {
  type = string
}

# variable "subnet_ids" {
#   type = list(string)
# }

variable "ACI_OS_type" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = list(string)
}

variable "ACI_container_name" {
  type = string
}

variable "ACI_container_image_name" {
  type = string
}

variable "ACI_CPU" {
  type = string
}

variable "ACI_memory" {
  type = string
}

variable "container_port_number" {
  type = number
}

variable "container_port_protocol" {
  type = string
}

variable "image_uami_ids" {
  type = string
}

variable "image_server" {
  type = string
}