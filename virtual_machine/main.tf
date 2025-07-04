resource "azurerm_windows_virtual_machine" "this" {
  for_each = { for vm in var.vms : vm.name => vm }

  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group
  network_interface_ids = [each.value.nic_id]
  size                  = each.value.vm_size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  os_disk {
    name              = "${each.value.name}-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  tags = each.value.tags
}
