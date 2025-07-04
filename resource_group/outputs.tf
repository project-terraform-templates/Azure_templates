output "resource_group_names" {
  value = [for rg in azurerm_resource_group.this : rg.name]
}
