variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name              = string
    resource_group    = string
    vnet_name         = string
    address_prefixes  = list(string)
    service_endpoints = optional(list(string))
  }))
}
