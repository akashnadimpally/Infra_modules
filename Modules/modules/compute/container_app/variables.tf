variable "container_app_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "container_app_revision_mode" {
  type = string
}

variable "container_cpu" {
  type = number
}

variable "container_memory" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_name" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = list(string)
}

variable "registry_server_name" {
  type = string
}

variable "registry_uami_ids" {
  type = string
}