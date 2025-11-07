terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5cca517b-05ee-466e-877d-03720a70e1b0"
  # Configuration options
}