variable "key_vault_id" {
  type = string
}

# variable "object_ids_permissions" {
#   description = "Map of object IDs and their corresponding permissions"
#   type        = map(object({
#     key_permissions           = list(string)
#     secret_permissions        = list(string)
#     certificate_permissions   = list(string)
#   }))
# }

variable "kv_obj_id" {
  type = string
}

variable "kv_key_permissions" {
  type = list(any)
}

variable "kv_secret_permissions" {
  type = list(any)
}

variable "kv_certificate_permissions" {
  type = list(any)
}