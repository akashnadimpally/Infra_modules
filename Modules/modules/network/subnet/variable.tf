# variable "location_name" {
#   type        = string
#   description = "Location name"
# }

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "existing_subnet_name" {
  type    = string
  default = ""
}

variable "vnet_address_prefix" {
  type        = string
  description = "Virtual network address prefix"
}

variable "create_subnet" {
  type        = bool
  description = "Create the subnet if it does not exist"
  default     = true
}

variable "address_prefixes_ip" {
  type        = string
  description = "description"
}


variable "s_name" {
  type        = string
  description = "description"
}

# variable "service_endpoints" {
#   type = list(string)
#   default = []
# }

# variable "delegation" {
#   type = string
#   default = "delegation"
# }

# variable "service_delegation_name" {
#   type = string
#   default = null
#   validation {
#     condition     = contains([null, "GitHub.Network/networkSettings", "Microsoft.ApiManagement/service", "Microsoft.Apollo/npu", "Microsoft.App/environments", "Microsoft.App/testClients", "Microsoft.AVS/PrivateClouds", "Microsoft.AzureCosmosDB/clusters", "Microsoft.BareMetal/AzureHostedService", "Microsoft.BareMetal/AzureHPC", "Microsoft.BareMetal/AzurePaymentHSM", "Microsoft.BareMetal/AzureVMware", "Microsoft.BareMetal/CrayServers", "Microsoft.BareMetal/MonitoringServers", "Microsoft.Batch/batchAccounts", "Microsoft.CloudTest/hostedpools", "Microsoft.CloudTest/images", "Microsoft.CloudTest/pools", "Microsoft.Codespaces/plans", "Microsoft.ContainerInstance/containerGroups", "Microsoft.ContainerService/managedClusters", "Microsoft.ContainerService/TestClients", "Microsoft.Databricks/workspaces", "Microsoft.DBforMySQL/flexibleServers", "Microsoft.DBforMySQL/servers", "Microsoft.DBforMySQL/serversv2", "Microsoft.DBforPostgreSQL/flexibleServers", "Microsoft.DBforPostgreSQL/serversv2", "Microsoft.DBforPostgreSQL/singleServers", "Microsoft.DelegatedNetwork/controller", "Microsoft.DevCenter/networkConnection", "Microsoft.DocumentDB/cassandraClusters", "Microsoft.Fidalgo/networkSettings", "Microsoft.HardwareSecurityModules/dedicatedHSMs", "Microsoft.Kusto/clusters", "Microsoft.LabServices/labplans", "Microsoft.Logic/integrationServiceEnvironments", "Microsoft.MachineLearningServices/workspaces", "Microsoft.Netapp/volumes", "Microsoft.Network/dnsResolvers", "Microsoft.Network/managedResolvers", "Microsoft.Network/fpgaNetworkInterfaces", "Microsoft.Network/networkWatchers", "Microsoft.Network/virtualNetworkGateways", "Microsoft.Orbital/orbitalGateways", "Microsoft.PowerPlatform/enterprisePolicies", "Microsoft.PowerPlatform/vnetaccesslinks", "Microsoft.ServiceFabricMesh/networks", "Microsoft.ServiceNetworking/trafficControllers", "Microsoft.Singularity/accounts/networks", "Microsoft.Singularity/accounts/npu", "Microsoft.Sql/managedInstances", "Microsoft.Sql/managedInstancesOnebox", "Microsoft.Sql/managedInstancesStage", "Microsoft.Sql/managedInstancesTest", "Microsoft.Sql/servers", "Microsoft.StoragePool/diskPools", "Microsoft.StreamAnalytics/streamingJobs", "Microsoft.Synapse/workspaces", "Microsoft.Web/hostingEnvironments", "Microsoft.Web/serverFarms", "NGINX.NGINXPLUS/nginxDeployments", "PaloAltoNetworks.Cloudngfw/firewalls", "Qumulo.Storage/fileSystems"], var.service_delegation_name)
#     error_message = "Please provision the resources as mentioned in the defined list"
#   }
# }

# variable "service_delegation_actions" {
#   type = any
#   default = []
#   # validation {
#   #   condition = contains(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/publicIPAddresses/join/action", "Microsoft.Network/publicIPAddresses/read", "Microsoft.Network/virtualNetworks/read", "Microsoft.Network/virtualNetworks/subnets/action", "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"],var.service_delegation_actions)
#   #   error_message = "Please provision the resources as mentioned in the defined list"
#   # }
# }