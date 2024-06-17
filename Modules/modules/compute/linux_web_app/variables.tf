variable "linux_web_app_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "app_service_plan_id" {
  type = string
}

variable "application_stack" {
  type = map(string)
}


variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "vnet_subnet_id" {
  type    = string
  default = null
}

variable "https_only" {
  type    = bool
  default = false
}

variable "public_network_access" {
  type    = bool
  default = true
}
