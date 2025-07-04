# Azure Subnet Module

This module creates one or more Azure Subnets in existing VNets.

## Inputs

- `subnets`: A list of objects, each with:
  - `name`: Subnet name
  - `resource_group`: Resource group name
  - `vnet_name`: Associated VNet name
  - `address_prefixes`: List of CIDR blocks
  - `service_endpoints`: (Optional) List of service endpoints

## Outputs

- `subnet_ids`: Map of subnet names to their resource IDs
- `subnet_names`: List of subnet names
example application usecase:

module "subnet" {
  source = "../templates/subnet"

  subnets = [
    {
      name             = "subnet-01"
      resource_group   = "myapp-rg"
      vnet_name        = "myapp-vnet"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-02"
      resource_group   = "myapp-rg"
      vnet_name        = "myapp-vnet"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
}
