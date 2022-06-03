provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "main_rg" {
  name     = "${var.project_name}-rg"
  location = var.default_location
}



