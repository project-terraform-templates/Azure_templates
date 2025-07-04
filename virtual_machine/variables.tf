variable "vms" {
  description = "List of VMs to create"
  type = list(object({
    name              = string
    location          = string
    resource_group    = string
    nic_id            = string
    vm_size           = string
    admin_username    = string
    admin_password    = string
    image_publisher   = string
    image_offer       = string
    image_sku         = string
    image_version     = string
    tags              = optional(map(string), {})
  }))
}
