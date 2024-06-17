variable "lb_id" {
  type = string
}

variable "lb_rule_name" {
  type = string
}

variable "protocol_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "lb_frontend_ip_config_name" {
  type = string
}

variable "be_ppol_ids" {
  type = string
}

variable "probeid" {
  type = string
}