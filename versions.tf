# Restrições de versão do Terraform e providers

terraform {
  required_version = ">= 1.12.2, < 2.0.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    fabric = {
      source  = "microsoft/fabric"
      version = "~> 1.0"
    }
  }
}