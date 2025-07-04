resource "azurerm_network_interface" "this" {
  for_each = { for nic in var.nics : nic.name => nic }

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = each.value.tags
}
