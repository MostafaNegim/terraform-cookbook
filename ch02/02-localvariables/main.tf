provider "azurerm" {
  features {}
}
locals {
  resource_name = "${var.application_name}-${var.environment_name}-${var.country_code}"
}
resource "azurerm_resource_group" "rg" {
  name = "RG-${local.resource_name}"
  location = "West Europe"
}
resource "azurerm_public_ip" "pip" {
  name = "IP-${local.resource_name}"
  location = "West Europe"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  domain_name_label = "mydomain"
}
variable "application_name" {
    description = "The name of application"  
}
variable "environment_name" {
  description = "The name of environment"
}

variable "country_code" {
  description = "The country code (FR-US-...)"
}