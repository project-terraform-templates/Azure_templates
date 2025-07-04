resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = { for assoc in var.associations : "${assoc.subnet_id}-${assoc.nsg_id}" => assoc }

  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.nsg_id
}
