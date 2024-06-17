variable "linux_function_app_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_access_key" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "user_assigned_mi_id" {
  type = string
}

variable "application_stack" {
  type = map(string)
}

