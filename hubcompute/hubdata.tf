data "azurerm_subnet" "hubcompute_subnet" {
  name                 = "${var.project_name}-hub-subnet1"
  virtual_network_name = "${var.project_name}-hub-vnet1"
  resource_group_name  = "${var.project_name}-network-rg"
}

data "azurerm_subnet" "hubbastion_subnet" {
  name                 =  "AzureBastionSubnet"
  virtual_network_name = "${var.project_name}-hub-vnet1"
  resource_group_name  = "${var.project_name}-network-rg"
}