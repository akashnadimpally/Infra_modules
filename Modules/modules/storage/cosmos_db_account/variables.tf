variable "cosmosdb_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location_name" {
  type = string
}

variable "zone_redundancy_enabled" {
  description = "True to enabled zone redundancy on default primary location"
  type        = bool
  default     = true
}

variable "offer_type" {
  type = string
}

variable "kind" {
  type = string
}

variable "mongo_server_version" {
  type = string
}

variable "free_tier_enabled" {
  type    = bool
  default = true
}

variable "analytical_storage_enabled" {
  type    = string
  default = false
}

variable "schema_analytical_storage_type" {
  type    = string
  default = null

  # validation {
  #   condition     = try(contains(["FullFidelity", "WellDefined"], var.analytical_storage_type), true)
  #   error_message = "The `analytical_storage_type` value must be valid. Possible values are `FullFidelity` and `WellDefined`."
  # }
}

variable "capabilities" {
  type        = list(string)
  description = <<EOD
Configures the capabilities to enable for this Cosmos DB account:
Possible values are
  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,
  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,
  MongoDBv3.4 and mongoEnableDocLevelTTL.
EOD
  default     = []
}

variable "consistency_policy_level" {
  description = "Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`"
  type        = string
  default     = "BoundedStaleness"
}

variable "consistency_policy_max_interval_in_seconds" {
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 10
}

variable "consistency_policy_max_staleness_prefix" {
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 200
}

variable "failover_locations" {
  description = "The name of the Azure region to host replicated data and their priority."
  type        = map(map(string))
  default     = null
}

variable "identity_type" {
  type = string
}

variable "uami_ids" {
  type = string
}

variable "public_network_accessibility" {
  type = bool
}