variable "vm_count" {
  type = number
  default = 1
}

variable "windows_vm_name" {
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

variable "src_image_ref_sku_name" {
  type = string
}

variable "cache_os_disk" {
  type = string
}

variable "storage_acc_type_os_disk" {
  type = string
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

