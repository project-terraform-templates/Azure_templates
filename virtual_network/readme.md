# Azure Virtual Network Module

This module creates one or more Azure Virtual Networks.

## Inputs

- `vnets`: A list of objects with the following:
  - `name`: Name of the VNet
  - `location`: Azure location
  - `resource_group`: Name of the resource group
  - `address_space`: List of CIDR blocks
  - `tags`: (Optional) Tags

## Outputs

- `vnet_names`: List of VNet names created
- `vnet_ids`: Map of VNet name to ID

example usage in application:

module "vnet" {
  source = "../templates/vnet"

  vnets = [
    {
      name           = "myapp-vnet"
      location       = "eastus"
      resource_group = "myapp-rg"
      address_space  = ["10.0.0.0/16"]
    }
  ]
}
