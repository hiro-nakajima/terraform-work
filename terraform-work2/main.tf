#https://learn.microsoft.com/ja-jp/azure/virtual-network/quick-create-terraform?tabs=azure-cli
resource "random_pet" "prefix" {
  prefix = var.resource_group_name_prefix
  length = 1
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.prefix.id
}

# Virtual Network
resource "azurerm_virtual_network" "terraform-work2-network" {
  name                = "${random_pet.prefix.id}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# subnetはvnetにnestできない
# https://qiita.com/Rami21/items/00a94e77cc8c8cbc7a45
# https://learn.microsoft.com/ja-jp/azure/virtual-network/quick-create-terraform?tabs=azure-cli
# Subnet 1
resource "azurerm_subnet" "terraform-work2-subnet-1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.terraform-work2-network.name
  address_prefixes     = ["10.0.0.0/24"]
  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

# Subnet 2
resource "azurerm_subnet" "terraform-work2-subnet-2" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.terraform-work2-network.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

# Network Security Group
resource "azurerm_network_security_group" "terraform-work2-nsg" {
  name                = "terraform-work2-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "120.75.97.239" # your global ip
    destination_address_prefix = "10.0.0.0/24"
  }
}

# NSGの割当 -> Subnet1
resource "azurerm_subnet_network_security_group_association" "subnet1" {
  subnet_id                 = azurerm_subnet.terraform-work2-subnet-1.id
  network_security_group_id = azurerm_network_security_group.terraform-work2-nsg.id
}