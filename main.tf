provider "azurerm" {
  features {}

  client_id       = "998d4378-1b42-42b0-94ee-712963840055"
  client_secret   = "yDP8Q~WDFwfOqi-WPlJqTugbw3OXoGLOKfQdzcfP"
  tenant_id       = "b18261fc-436e-431b-a161-7fb464ba3acf"
  subscription_id = "0ce80fd7-213d-4ba9-9a96-164f4ecc0a53"
}

resource "azurerm_resource_group" "rg" {
name = var.azurerm_resource_group_name
location = var.location
  
}

resource "azurerm_virtual_network" "vnet" {
name = var.azurerm_virtual_network_name
address_space       = var.address_space
location            = var.location
resource_group_name = var.azurerm_resource_group_name
depends_on = [ azurerm_resource_group.rg ]
  
}

resource "azurerm_subnet" "subnet01" {
  name = var.azurerm_subnet01
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes01
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "subnet02" {
  name = var.azurerm_subnet02
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes02
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_subnet" "subnet03" {
  name = var.azurerm_subnet03
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes03
  depends_on = [ azurerm_virtual_network.vnet ]
}
