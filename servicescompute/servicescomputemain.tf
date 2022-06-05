###provider
provider "azurerm" {
  features {}
}

##Resource Group for Hub Compute
resource "azurerm_resource_group" "servicescompute_rg" {
  name     = "${var.project_name}-servicescompute-rg"
  location = var.default_location
}