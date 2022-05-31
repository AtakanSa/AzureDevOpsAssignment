resource "azurerm_log_analytics_workspace" "shared" {
  depends_on            = [azurerm_resource_group.rg]
  name                  = local.workspace_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  retention_in_days     = 30
}
