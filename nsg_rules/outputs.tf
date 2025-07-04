output "nsg_rule_names" {
  value = [for rule in azurerm_network_security_rule.this : rule.name]
}
