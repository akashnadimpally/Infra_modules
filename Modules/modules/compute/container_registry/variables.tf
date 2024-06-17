variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "georeplication_locations" {
  description = <<DESC
  A list of Azure locations where the Ccontainer Registry should be geo-replicated. Only activated on Premium SKU.
  Supported properties are:
    location                  = string
    zone_redundancy_enabled   = bool
    regional_endpoint_enabled = bool
    tags                      = map(string)
  or this can be a list of `string` (each element is a location)
DESC
  type        = any
  default     = []
}

variable "azure_services_bypass_allowed" {
  type = bool
}

variable "data_endpoint_enabled" {
  type = bool
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type    = list(any)
  default = []
}

variable "encryption_enabled" {
  type = bool
}

variable "kv_key_id" {
  type = string
}

variable "allowed_cidrs" {
  default = []
  type    = list(string)
}

variable "allowed_subnets" {
  default = []
  type    = list(string)
}