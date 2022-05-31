resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  name                = local.vnet_name
  address_space       = var.virtual_network_address_space.vnet
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "aks_subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = local.aks_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_space.aks_subnet
}

resource "azurerm_subnet" "vn_subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = local.vn_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_space.vn_subnet
}

resource "azurerm_subnet" "pe_subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = local.pe_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_space.pe_subnet
}

resource "azurerm_subnet" "vm_subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = local.vm_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_space.vm_subnet
}