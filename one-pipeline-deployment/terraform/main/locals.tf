locals {
  #general prefix
  prefix = "${var.subscription_code}-${var.location_code}-${var.environment}-${var.project_code}"
  acr_prefix = "${var.subscription_code}${var.location_code}${var.environment}${var.project_code}"
  #resource groups
  rg_name = "rg-${local.prefix}"
  acr_name = "acr${local.acr_prefix}"
  #law
  workspace_name = "law-${local.prefix}"
  #vnet
  vnet_name = "vnet-${local.prefix}"
  #subnet
  aks_subnet_name = "snet-${local.prefix}-aks"
  vn_subnet_name = "snet-${local.prefix}-vn"
  pe_subnet_name = "snet-${local.prefix}-pe"
  vm_subnet_name = "snet-${local.prefix}-vm"
  #aks
  aks_cluster_name = "aks-${local.prefix}"
  aks_aad_admin_name = "aks-${local.prefix}-administrators"
  #aks_aad_admin_name_id = azuread_group.aks_administrators.id
  aks_aad_viewers_name = "aks-${local.prefix}-viewers"
  dns_prefix = "dns-${local.prefix}"
  #pip
  aks_egress_pip_name = "pip-${local.prefix}-egress"
  aks_ingress_pip_name = "pip-${local.prefix}-ingress"
}
