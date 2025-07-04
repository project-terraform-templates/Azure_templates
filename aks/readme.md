example uses :

module "aks" {
  source = "../templates/aks"

  name                = "myapp-aks"
  location            = "eastus"
  resource_group      = "myapp-rg"
  dns_prefix          = "myappaks"
  kubernetes_version  = "1.29.2"
  rbac_enabled        = true
  network_plugin      = "azure"
  load_balancer_sku   = "standard"

  default_node_pool = {
    name                = "default"
    vm_size             = "Standard_DS2_v2"
    node_count          = 2
    os_disk_size_gb     = 50
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  tags = {
    environment = "dev"
    team        = "platform"
  }
}
