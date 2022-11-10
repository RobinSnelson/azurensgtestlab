####hub subnets nsg and associations
resource "azurerm_network_security_group" "hub_subnet1_nsg" {
  name                = "${var.project_name}-hub_subnet1-nsg"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

}

resource "azurerm_subnet_network_security_group_association" "hub_subnet1_nsg_assoc" {
  subnet_id                 = azurerm_subnet.hub_subnet1.id
  network_security_group_id = azurerm_network_security_group.hub_subnet1_nsg.id
}

####resources subnets nsg and associations
resource "azurerm_network_security_group" "resource1_vnet1_subnet1_nsg" {
  name                = "${var.project_name}-resources1_vnet1-subnet1-nsg"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  security_rule {
    name                       = "Allow SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "10.1.4.0/26"
  }

  ###### Deny All Rule ###################
  security_rule {
    name                       = "Deny_All"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "resources1_vnet1_subnet1_nsg_assoc" {
  subnet_id                 = azurerm_subnet.resource1_vnet1_subnet1.id
  network_security_group_id = azurerm_network_security_group.resource1_vnet1_subnet1_nsg.id
}

### Services Subnets NSGs and associations
resource "azurerm_network_security_group" "services_subnet1_nsg" {
  name                = "${var.project_name}-services-subnet1-nsg"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  security_rule {
    name                       = "Allow SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "10.1.2.0/24"
  }
  ###### Deny All Rule ###################
  security_rule {
    name                       = "Deny_All"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "services_subnet1_nsg_assoc" {
  subnet_id                 = azurerm_subnet.services_subnet1.id
  network_security_group_id = azurerm_network_security_group.services_subnet1_nsg.id
}

resource "azurerm_network_security_group" "services_subnet2_nsg" {
  name                = "${var.project_name}-services-subnet2-nsg"
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name

  security_rule {
    name                       = "Allow SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.1.1.0/27"
    destination_address_prefix = "10.1.3.0/24"
  }
  ###### Deny All Rule ###################
  security_rule {
    name                       = "Deny_All"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "services_subnet2_nsg_assoc" {
  subnet_id                 = azurerm_subnet.services_subnet2.id
  network_security_group_id = azurerm_network_security_group.services_subnet2_nsg.id
}

