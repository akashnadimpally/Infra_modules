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

/* variable "access_policies" {
  description = "List of access policies for the Key Vault"
  type        = list(object({
    tenant_id               = string
    object_id               = string
    secret_permissions      = list(string)
    key_permissions         = list(string)
    certificate_permissions = list(string)
  }))
} */

variable "kv_name" {
    type = string
}

variable "disk_encryption" {
  type = bool
}

variable "purge_protection" {
  type = bool
}

/* variable "kv_id" {
  type = string
} */

/* variable "managed_obj_id" {
  type = string
} */

/* variable "access_policies" {
  description = "List of access policies for the Key Vault."
  type        = list(object({
    object_id = string
    secret_permissions = list(string)
    key_permissions    = list(string)
    certificate_permissions = list(string)
  }))
   default = [
    {
      object_id                = "object_id_1"
      secret_permissions       = ["get", "list"]
      key_permissions          = ["decrypt", "sign"]
      certificate_permissions = ["get", "list"]
    }, */
/* 
    {
      object_id                = "object_id_2"
      secret_permissions       = ["get", "list", "set"]
      key_permissions          = ["decrypt", "sign"]
      certificate_permissions = ["get", "list"]
    },
    {
      object_id                = "object_id_3"
      secret_permissions       = ["get", "list"]
      key_permissions          = ["decrypt", "sign", "wrapKey"]
      certificate_permissions = ["get", "list"]
    },
     */
  /* ]
} */

