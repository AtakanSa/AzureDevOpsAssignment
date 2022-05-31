resource "azurerm_public_ip_prefix" "aks_egress_pip" {
  depends_on          = [azurerm_resource_group.rg]
  name                = local.aks_egress_pip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  prefix_length       = 29
  tags                = var.tags
}

resource "azurerm_public_ip" "aks_ingress_pip" {
  depends_on          = [azurerm_resource_group.rg]
  name                = local.aks_ingress_pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  tags                = var.tags
  sku                 = "Standard"
}
