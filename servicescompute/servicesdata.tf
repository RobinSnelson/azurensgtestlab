data "azurerm_subnet" "servicescompute_subnet" {
  name                 = "${var.project_name}-services-subnet1"
  virtual_network_name = "${var.project_name}-services-vnet1"
  resource_group_name  = "${var.project_name}-network-rg"
}