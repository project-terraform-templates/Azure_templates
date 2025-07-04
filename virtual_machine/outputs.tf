output "vm_ids" {
  value = { for name, vm in azurerm_windows_virtual_machine.this : name => vm.id }
}
