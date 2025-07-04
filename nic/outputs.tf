output "nic_ids" {
  value = { for name, nic in azurerm_network_interface.this : name => nic.id }
}
