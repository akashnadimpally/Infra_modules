variable "lb_id" {
  type = string
}

variable "lb_backendpool_address_name" {
  type = string
  /* default = "BackendPool" */
}

variable "vnet_id" {
  type = string
}
