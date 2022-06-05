
#### REsource Network 1
resource "azurerm_virtual_network" "resource1_vnet1" {
  name                = "${var.project_name}-resource1-vnet1"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
  address_space = [
    var.resource1_vnet1_iprange
  ]
}

###HUb Subnets
resource "azurerm_subnet" "resource1_vnet1_subnet1" {
  name                 = "${var.project_name}-resource1-vnet1-subnet1"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.resource1_vnet1.name

  address_prefixes = [
    var.resource1_subnet1_iprange
  ]
}

### Peerings

resource "azurerm_virtual_network_peering" "resource1_hub_peering" {
  name                         = "resource_to_hub"
  resource_group_name          = azurerm_resource_group.network_rg.name
  virtual_network_name         = azurerm_virtual_network.resource1_vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true

  depends_on = [
    azurerm_virtual_network.hub_vnet,
    azurerm_virtual_network.resource1_vnet1
  ]

}