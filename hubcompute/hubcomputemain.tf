###provider
provider "azurerm" {
  features {}
}

##Resource Group for Hub Compute
resource "azurerm_resource_group" "hubcompute_rg" {
  name     = "${var.project_name}-hubcompute-rg"
  location = var.default_location
}