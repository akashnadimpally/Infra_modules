variable "ms_sql_server_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "sql_admin_username" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "azure_AD_auth_only" {
  type = bool
}