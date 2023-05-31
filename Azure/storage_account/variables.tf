variable "storage_account_name" {
    type = string
    description = "(optional) describe your variable"
}

variable "rg_name" {
    type = string
}

variable "location_name" {
    type = string
}

variable "storage_account_tier" {
  type = string
}

variable "account_replication_type_name" {
  type = string
}

variable "HTTPS_traffic_enable" {
  type = bool
}

/* variable "allowed_vnet_subnetid" {
    type = string
} */