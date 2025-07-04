resource "azurerm_network_security_group" "this" {
  for_each = { for nsg in var.nsgs : nsg.name => nsg }

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  tags = each.value.tags
}
