# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.4.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # 必須※環境変数 ARM_SUBSCRIPTION_ID でも指定可
  subscription_id = var.subscription_id

  # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/4.0-upgrade-guide?product_intent=terraform#resource_provider_registrations
  resource_provider_registrations = "none"
  features {}
}
