output "vnet_names" {
  value = [for v in azurerm_virtual_network.this : v.name]
}

output "vnet_ids" {
  value = { for k, v in azurerm_virtual_network.this : k => v.id }
}
