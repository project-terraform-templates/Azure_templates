resource "azurerm_virtual_network" "this" {
  for_each = { for v in var.vnets : v.name => v }

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  address_space       = each.value.address_space

  tags = merge(
    {
      "environment" = "terraform"
    },
    each.value.tags
  )
}
