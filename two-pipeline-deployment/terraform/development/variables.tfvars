project_code            = "library"
environment             = "dev"
sku                     = "Premium"
tags                    = {
                            Department = "DevOps"
                            Project    = "Library"
                            Createdby  = "Terraform"
                          }
subscription_code       = "dev"
location                = "westeurope"
location_code           = "azwe"
subscription_id         = ""
subnet_address_space    = {
                            aks_subnet    = [
                              "10.40.0.0/16"
                            ]
                            vn_subnet    = [
                              "10.41.0.0/16"
                            ]
                            pe_subnet    = [
                              "10.42.0.0/22"
                            ]
                            vm_subnet    = [
                              "10.42.4.0/22"
                            ]
                          }
virtual_network_address_space = {
                            vnet     = [
                              "10.40.0.0/14"
                            ]
                          }
client_id               = ""
client_secret           = ""
tenant_id               = ""