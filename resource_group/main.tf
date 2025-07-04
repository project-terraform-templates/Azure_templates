resource "azurerm_resource_group" "this"{
  for_each = { for index, rg in var.resource_gropu : index => rg }
  name = each.value.name
  location = each.value.location
}
