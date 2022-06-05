resource "azurerm_network_interface" "resource1compute_vm1_interface" {
  name                = "${var.project_name}-resource1compute-vm1-int"
  resource_group_name = azurerm_resource_group.resource1compute_rg.name
  location            = azurerm_resource_group.resource1compute_rg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.resource1compute_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_linux_virtual_machine" "resource1compute_vm1" {
  name                = "${var.project_name}-resource1compute-vm1"
  resource_group_name = azurerm_resource_group.resource1compute_rg.name
  location            = azurerm_resource_group.resource1compute_rg.location
  size                = "Standard_B2s"
  admin_username      = "sysadmin"

  admin_ssh_key {
    username   = "sysadmin"
    public_key = file("/Users/robinsnelson/.ssh/azure.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.resource1compute_vm1_interface.id
  ]

  os_disk {
    name                 = "${var.project_name}-resource1compute-vm1-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19_10-daily-gen2"
    version   = "latest"
  }

}