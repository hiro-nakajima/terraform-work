provider "azurerm" {
  features {
  }
  skip_provider_registration = true
  subscription_id            = var.subscription_id
  environment                = "public"
  use_msi                    = false
  use_cli                    = true
  use_oidc                   = false
}
