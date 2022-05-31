data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false
}

resource "azurerm_kubernetes_cluster" "cluster" {
  depends_on              = [azurerm_resource_group.rg]
  name                    = local.aks_cluster_name
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = local.dns_prefix
  tags                    = var.tags
  sku_tier                = "Paid"

  default_node_pool {
    name                    = "systempool"
    enable_auto_scaling     = true
    min_count               = 1
    max_count               = 3
    vm_size                 = "Standard_F8s_v2"
    os_disk_size_gb         = 128
    os_disk_type            = "Ephemeral"
    vnet_subnet_id          = azurerm_subnet.aks_subnet.id
    availability_zones      = ["1","2"]
    type                    = "VirtualMachineScaleSets"
    max_pods                = 30
  }

  addon_profile {
    http_application_routing {
      enabled = false
    }
    oms_agent {
      enabled = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.shared.id
    }
  }

  role_based_access_control {
    enabled = true
    azure_active_directory {
    managed                = true
    admin_group_object_ids = [azuread_group.aks_administrators.id]
    azure_rbac_enabled     = true
    }
  }

  network_profile {
  load_balancer_sku   = "Standard"
  network_plugin      = "azure"
  network_policy      = "azure"
  outbound_type       = "loadBalancer"
  load_balancer_profile{
      outbound_ip_prefix_ids = [azurerm_public_ip_prefix.aks_egress_pip.id]
    }
  }

  identity {
    type = "SystemAssigned"
  }
}