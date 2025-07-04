variable "resource_groups" {
  description = "List of resource groups to create"
  type = list(object({
    name     = string
    location = string
  }))
}
