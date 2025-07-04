resource "azurerm_network_security_rule" "this" {
  for_each = {
    for rule in flatten([
      for nsg in var.nsg_rules : [
        for rule in nsg.rules : {
          nsg_name           = nsg.name
          resource_group     = nsg.resource_group
          rule_name          = rule.name
          priority           = rule.priority
          direction          = rule.direction
          access             = rule.access
          protocol           = rule.protocol
          source_port_range  = rule.source_port_range
          destination_port_range = rule.destination_port_range
          source_address_prefix  = rule.source_address_prefix
          destination_address_prefix = rule.destination_address_prefix
        }
      ]
    ]) : "${rule.nsg_name}-${rule.rule_name}" => rule
  }

  name                        = each.value.rule_name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = each.value.resource_group
  network_security_group_name = each.value.nsg_name
}
