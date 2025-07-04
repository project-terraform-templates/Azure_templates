variable "nics" {
  description = "List of NICs to create"
  type = list(object({
    name           = string
    location       = string
    resource_group = string
    subnet_id      = string
    tags           = optional(map(string), {})
  }))
}
