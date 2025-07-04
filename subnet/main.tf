resource "azurerm_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

  delegation {
    name = "default"
    service_delegation {
      name    = "Microsoft.Network/virtualNetworks/subnets"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

  service_endpoints = lookup(each.value, "service_endpoints", null)

  depends_on = []
}
