data "azurerm_subnet" "resource1compute_subnet" {
  name                 = "${var.project_name}-resource1-vnet1-subnet1"
  virtual_network_name = "${var.project_name}-resource1-vnet1"
  resource_group_name  = "${var.project_name}-network-rg"
}