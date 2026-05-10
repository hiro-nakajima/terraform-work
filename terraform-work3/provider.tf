terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-logs"
    storage_account_name = "stohradtf01"
    container_name       = "tfstate"
    key                  = "terraform-work3.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.subscription_id

  resource_provider_registrations = "none"
  features {}
}
