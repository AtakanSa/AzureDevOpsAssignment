# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 2.78"
    }

    azuread = {
      source = "hashicorp/azuread"
      version = "1.6.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.13.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.8.0"
    }
  }
  required_version = ">= 0.14.9"
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "azuread" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
provider "kubernetes"{
  host                   = azurerm_kubernetes_cluster.cluster.kube_admin_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].cluster_ca_certificate)
}
provider "kubectl"{
  host                   = azurerm_kubernetes_cluster.cluster.kube_admin_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_admin_config[0].cluster_ca_certificate)
}