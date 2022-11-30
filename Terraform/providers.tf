# terraform {
#   required_version = ">=0.12"

#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~>2.0"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = "~>3.0"
#     }
#     tls = {
#       source = "hashicorp/tls"
#       version = "~>4.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
#   use_msi = true
#   subscription_id = "6fea5c6b-073f-4a0d-9a56-51e719c4b283"
#   client_id = "266e5e46-fe8f-4f16-af90-29fc5613d918"
#   client_secret = "K1x8Q~cH-r1MjED~R2__ghmB9SGPasJ9AqzA9a~W"
#   tenant_id = "f2567840-b2b7-49ad-8240-568a42281394"
#   skip_provider_registration = true
# }
# terraform {
#   required_version = ">=0.12"
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~>2.0"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = "~>3.0"
#     }
#     tls = {
#       source = "hashicorp/tls"
#       version = "~>4.0"
#     }
#   }
#   backend "azurerm" { 
#     resource_group_name  = "resource-group-duvan-garcia"
#     storage_account_name = "storageduvan"
#     container_name       = "storageduvan"
#     key                  = "Rr0t+jYUM8DY5aWI69el3PD2eve/FzJEWQz/QBq+w0M1MIeI3uIXqsBYsYyB1ejb7lM8PA4JoSGg+ASt8kbiMg=="
#     subscription_id      = "6fea5c6b-073f-4a0d-9a56-51e719c4b283"
#     client_id = "266e5e46-fe8f-4f16-af90-29fc5613d918"
#     client_secret = "K1x8Q~cH-r1MjED~R2__ghmB9SGPasJ9AqzA9a~W"
#     tenant_id = "f2567840-b2b7-49ad-8240-568a42281394"
#   }
    
# }
# provider "azurerm" {
#   features {}
#   use_msi = true
#   subscription_id = "6fea5c6b-073f-4a0d-9a56-51e719c4b283"
#   client_id = "266e5e46-fe8f-4f16-af90-29fc5613d918"
#   client_secret = "K1x8Q~cH-r1MjED~R2__ghmB9SGPasJ9AqzA9a~W"
#   tenant_id = "f2567840-b2b7-49ad-8240-568a42281394"
#   skip_provider_registration = true
# }

terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }
  backend "azurerm" { 
    resource_group_name  = "resource-group-duvan-garcia"
    storage_account_name = "storageduvan"
    container_name       = "storageduvan"
    key                  = "codelab.microsoft.storageduvan"
    access_key = "Rr0t+jYUM8DY5aWI69el3PD2eve/FzJEWQz/QBq+w0M1MIeI3uIXqsBYsYyB1ejb7lM8PA4JoSGg+ASt8kbiMg=="
    subscription_id      = "6fea5c6b-073f-4a0d-9a56-51e719c4b283"
    client_id = "266e5e46-fe8f-4f16-af90-29fc5613d918"
    client_secret = "K1x8Q~cH-r1MjED~R2__ghmB9SGPasJ9AqzA9a~W"
    tenant_id = "f2567840-b2b7-49ad-8240-568a42281394"
  }
    
}
provider "azurerm" {
  features {}
  use_msi = true
  subscription_id = "6fea5c6b-073f-4a0d-9a56-51e719c4b283"
  client_id = "266e5e46-fe8f-4f16-af90-29fc5613d918"
  client_secret = "K1x8Q~cH-r1MjED~R2__ghmB9SGPasJ9AqzA9a~W"
  tenant_id = "f2567840-b2b7-49ad-8240-568a42281394"
  skip_provider_registration = true
}
