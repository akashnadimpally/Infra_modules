variable "windows_vmss_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "instances_count" {
  type = number
}

variable "admin_pass" {
  type      = string
  sensitive = true
}

variable "admin_user" {
  type = string
}

variable "src_image_ref_sku_name" {
  type = string
}

variable "storage_acc_type_os_disk" {
  type = string
}

variable "cache_os_disk" {
  type = string
}

variable "nic_name" {
  type = string
}

variable "nsg_id" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "subnetid" {
  type = string
}

variable "min_instances_count" {
  type = number
}

variable "max_instances_count" {
  type = number
}

variable "prefix_name" {
  type = string
}

variable "lb_backend_addresspool_id" {
  type = string
}

variable "auto_scale_setting_name" {
  type = string
}

variable "enable_windows_vm_automatic_updates" {
  type        = bool
  description = "Are automatic updates enabled for Windows Virtual Machine in this scale set?"
  default     = true
}

variable "os_upgrade_mode" {
  type        = string
  description = "Specifies how Upgrades (e.g. changing the Image/SKU) should be performed to Virtual Machine Instances. Possible values are Automatic, Manual and Rolling. Defaults to Automatic"
  default     = "Automatic"
}

variable "os_flavor" {
  type    = string
  default = "windows"
}

variable "install_iis_server_on_instances" {
  type        = bool
  description = "Install ISS server on every Instance in the VM scale set"
  default     = false
}