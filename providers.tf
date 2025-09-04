provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azurerm" {
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  # partner_id = "<DataEX partnet id>" 

  features {}
}

provider "fabric" {

}