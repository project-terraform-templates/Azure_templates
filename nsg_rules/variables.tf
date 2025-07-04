variable "nsg_rules" {
  description = "List of NSGs with their associated rules"
  type = list(object({
    name           = string
    resource_group = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string  # "Inbound" or "Outbound"
      access                     = string  # "Allow" or "Deny"
      protocol                   = string  # "Tcp", "Udp", "*"
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
