output "prefix" {
  value = local.prefix
}

output "tags" {
  value = var.tags
}

output "rg_name" {
  value = local.rg_name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = true
}