###Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

#####Resource Group
resource "azurerm_resource_group" "resources-rg" {
  name     = "${var.project_name}-resources-rg"
  location = var.default_location
}

###### Key Vault
resource "azurerm_key_vault" "resources_keyvault" {
  name                        = "${var.project_name}-resources-kv"
  resource_group_name         = azurerm_resource_group.resources-rg.name
  location                    = azurerm_resource_group.resources-rg.location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"


}