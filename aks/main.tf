resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = var.default_node_pool.name
    node_count          = var.default_node_pool.node_count
    vm_size             = var.default_node_pool.vm_size
    os_disk_size_gb     = var.default_node_pool.os_disk_size_gb
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    min_count           = var.default_node_pool.min_count
    max_count           = var.default_node_pool.max_count
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = var.kubernetes_version

  role_based_access_control_enabled = var.rbac_enabled

  network_profile {
    network_plugin = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }

  tags = var.tags
}
