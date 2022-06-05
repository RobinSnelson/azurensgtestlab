provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "network_rg" {
  name     = "${var.project_name}-network-rg"
  location = var.default_location
}



