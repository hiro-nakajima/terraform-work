terraform {
  #backend "local" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.99.0"

    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-logs"
    storage_account_name = "stohradtf01"
    container_name       = "tfstate"
    key                  = "terraform-work6.tfstate"
  }
}
