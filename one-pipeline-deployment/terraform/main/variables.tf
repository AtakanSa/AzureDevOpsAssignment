variable "project_code" {
  description = "specific project name for example Assignment"
  type        = string
}

variable "environment" {
  description = "dev or prod"
  type        = string
}

variable "sku" {
  description = "standart or premium"
  type        = string
}

variable "tags" {
  type = map
}

variable "subscription_code" {
  description = "Subscription code for project."
  type        = string
}

variable "location" {
  description = "West Europe"
  type        = string
}

variable "location_code" {
  description = "Azure West Europe"
  type = string
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "traffic_label" {
  type = map
  default = {
    dedicated = "traffic"
  }
}

variable "monitoring_label" {
  type = map
  default = {
    dedicated = "monitoring"
  }
}

variable "virtual_network_address_space" {
  type = map
}

variable "subnet_address_space" {
  type = map
}
