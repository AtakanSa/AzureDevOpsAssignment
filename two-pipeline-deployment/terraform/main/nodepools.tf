resource "azurerm_kubernetes_cluster_node_pool" "traffic1" {
  depends_on            = [azurerm_kubernetes_cluster.cluster]
  name                  = "traffic1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  vm_size               = "Standard_D16s_v3"
  node_count            = 1
  min_count             = 1
  max_count             = 5
  tags                  = var.tags
  node_labels           = var.traffic_label
  os_disk_type          = "Ephemeral"
  os_disk_size_gb       = 128
  max_pods              = 30
  availability_zones    = ["1","2"]
  enable_auto_scaling   = true
  os_type               = "Linux" #default is linux but just wanted to add for showing
  mode                  = "User"  #default is user but just wanted to add for showing
  vnet_subnet_id        = azurerm_subnet.aks_subnet.id
}