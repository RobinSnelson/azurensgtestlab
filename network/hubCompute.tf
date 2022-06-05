resource "azurerm_public_ip" "hub_vm1_publicip" {
  name                = "${var.project_name}-hub-vm1-pip"
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "hub_vm1_interface" {
  name                = "${var.project_name}-hub-vm1-int"
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.hub_subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.hub_vm1_publicip.id
  }

}

resource "azurerm_linux_virtual_machine" "hub_vm1" {
  name                = "${var.project_name}-hub-vm1"
  resource_group_name = azurerm_resource_group.main_rg.name
  location            = azurerm_resource_group.main_rg.location
  size                = "Standard_B2s"
  admin_username      = "sysadmin"

  admin_ssh_key {
    username   = "sysadmin"
    public_key = file("/Users/robinsnelson/.ssh/azure.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.hub_vm1_interface.id
  ]

  os_disk {
    name                 = "${var.project_name}-hub-vm1-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}