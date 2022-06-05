
### Services VNET
resource "azurerm_virtual_network" "services_vnet" {
  name                = "${var.project_name}-services-vnet1"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  address_space = [
    var.services_vnet_iprange
  ]
}

###Services Subnets
resource "azurerm_subnet" "services_subnet1" {
  name                 = "${var.project_name}-services-subnet1"
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.services_vnet.name

  address_prefixes = [
    var.services_subnet1_iprange
  ]
}

resource "azurerm_subnet" "services_subnet2" {
  name                 = "${var.project_name}-services-subnet2"
  resource_group_name  = azurerm_resource_group.main_rg.name
  virtual_network_name = azurerm_virtual_network.services_vnet.name

  address_prefixes = [
    var.services_subnet2_iprange
  ]

}

#### Peerings

resource "azurerm_virtual_network_peering" "services_hub_peering" {
  name                         = "services_to_hub"
  resource_group_name          = azurerm_resource_group.main_rg.name
  virtual_network_name         = azurerm_virtual_network.services_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false


  depends_on = [
    azurerm_virtual_network.hub_vnet,
    azurerm_virtual_network.services_vnet
  ]

}