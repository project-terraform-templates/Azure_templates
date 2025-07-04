variable "associations" {
  description = "List of NSG-subnet associations"
  type = list(object({
    subnet_id = string
    nsg_id    = string
  }))
}
