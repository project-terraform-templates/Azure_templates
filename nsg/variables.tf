variable "nsgs" {
  description = "List of NSGs to create"
  type = list(object({
    name           = string
    location       = string
    resource_group = string
    tags           = optional(map(string), {})
  }))
}
