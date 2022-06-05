###provider
provider "azurerm" {
  features {}
}

##Resource Group for Hub Compute
resource "azurerm_resource_group" "resource1compute_rg" {
  name     = "${var.project_name}-resource1compute_rg"
  location = var.default_location
}