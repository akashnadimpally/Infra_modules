variable "object_ids" {
  description = "List of object IDs to configure access for"
  type        = list(string)
}

variable "key_permission" {
  description = "List of key permissions"
  type        = list(string)
}

variable "secret_permission" {
  description = "List of secret permissions"
  type        = list(string)
}

variable "storage_permission" {
  type = list(string)
}

variable "kv_id" {
  type = string
}