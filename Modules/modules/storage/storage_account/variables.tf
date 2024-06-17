variable "storage_acc" {
  type = string
  validation {
    condition = (3 <= length(var.storage_acc) || length(var.storage_acc) <= 24 )
    error_message = "Storage account name must be between 3 to 24 characters length"
  }
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "network_action" {
  type = string
}

variable "ip_rules" {
  type = list(string)
  default = []
}

variable "subnet_id" {
  type = list(string)
  default = []
}

variable "account_kind" {
  type = string
}

variable "access_tier" {
  type = string
}

# variable "user_assigned_mi_id" {
#   type = string
# }

# variable "kv_key_id" {
#   type = string
#   default = ""
# }

variable "hns_enabled" {
  type = bool
}

variable "allow_nested_items_to_be_public" {
  type = bool
  default = false
}

variable "public_network_access_enabled" {
  type = bool
  default = false
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "enable_https_traffic_only" {
  type    = bool
  default = true
}