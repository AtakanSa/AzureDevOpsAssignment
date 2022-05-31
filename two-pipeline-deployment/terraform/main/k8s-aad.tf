data "azuread_user" "atakan" {
  user_principal_name = "atakan.sari@xxx"
}

resource "azuread_group" "aks_administrators" {
  display_name = local.aks_aad_admin_name
  description  = "Azure AKS Kubernetes administrators for the ${local.aks_aad_admin_name} cluster."
  members = [
   data.azuread_user.atakan.object_id,
  ]
}

