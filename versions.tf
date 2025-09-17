terraform {
  required_version = ">= 1.12.2, < 2.0.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "~> 1"
    }
  }
}