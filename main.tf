resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "eastus"
}

resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_account_name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false

  tags = {
    environment = "testing"
  }
}