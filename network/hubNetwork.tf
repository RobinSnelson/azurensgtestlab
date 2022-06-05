### HUB VNET
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "${var.project_name}-hub-vnet1"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  address_space = [
    var.hub_vnet_iprange
  ]
}

###HUb Subnets
resource "azurerm_subnet" "hub_subnet1" {
  name                 = "${var.project_name}-hub-subnet1"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name

  address_prefixes = [
    var.hub_subnet1_iprange
  ]
}

#### For any VPN gateways that may be required
resource "azurerm_subnet" "gateway_subnet1" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name

  address_prefixes = [
    var.gateway_subnet_iprange
  ]
}

## Peerings

resource "azurerm_virtual_network_peering" "hub_services_peering" {
  name                         = "hub_to_services"
  resource_group_name          = azurerm_resource_group.network_rg.name
  virtual_network_name         = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.services_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true

  depends_on = [
    azurerm_virtual_network.hub_vnet,
    azurerm_virtual_network.services_vnet
  ]

}

resource "azurerm_virtual_network_peering" "hub_resource1_peering" {
  name                         = "hub_to_resource1"
  resource_group_name          = azurerm_resource_group.network_rg.name
  virtual_network_name         = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.resource1_vnet1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true

  depends_on = [
    azurerm_virtual_network.hub_vnet,
    azurerm_virtual_network.resource1_vnet1
  ]

}