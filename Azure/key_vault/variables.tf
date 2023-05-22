variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location_name" {
  type        = string
  description = "location name"
}

variable "sku_kv_name" {
  type = string
}

variable "access_policies" {
  description = "List of access policies for the Key Vault"
  type        = list(object({
    tenant_id               = string
    object_id               = string
    secret_permissions      = list(string)
    key_permissions         = list(string)
    certificate_permissions = list(string)
  }))
}

variable "kv_name" {
    type = string
}

variable "disk_encryption" {
  type = bool
}

variable "purge_protection" {
  type = bool
}

