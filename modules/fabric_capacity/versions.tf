terraform {
  required_version = ">= 1.12.2, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.42.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "~> 1.5.0"
    }
  }
}