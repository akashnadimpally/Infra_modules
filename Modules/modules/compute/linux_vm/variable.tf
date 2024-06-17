variable "vm_count" {
  type = number
  default = 1
}

variable "linux_vm_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "size_name" {
  type = string
}

variable "admin_pass" {
  type      = string
  sensitive = true
}

variable "admin_user" {
  type = string
}

variable "nic_id" {
  type = list(string)
}

variable "linux_flavour_version" {
  type = string
}

variable "cache_os_disk" {
  type = string
}

variable "storage_acc_type_os_disk" {
  type = string
}

variable "linux_flavour_name" {
  type = string
}

variable "linux_vm_extension_name" {
  type    = string
  default = null
}

variable "linux_flavour_publisher" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "linux_custom_data" {
  type    = string
  default = null
}