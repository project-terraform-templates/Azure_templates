variable "name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Azure Resource Group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
  default     = "1.29.2"
}

variable "rbac_enabled" {
  description = "Enable RBAC"
  type        = bool
  default     = true
}

variable "network_plugin" {
  description = "Network plugin (azure/kubenet)"
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "SKU of the load balancer"
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "default_node_pool" {
  description = "Default node pool configuration"
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    os_disk_size_gb     = number
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
  })
}
